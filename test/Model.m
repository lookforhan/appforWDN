% name: model
classdef Model < handle
    properties
        errorCode
        FID
        inpfile
        pdd
    end
    methods
        function obj = Model(inpFile)
            obj.pdd=PDD_Parameter();
            obj.inpfile = inpFile;
            temp_inpFile='temp_net.inp';
            loadlibrary('epanet2.dll','epanet2.h')
            obj.errorCode=calllib('epanet2','ENopen',inpFile,'net.rpt','net.out');
            validateattributes(obj.errorCode,{'numeric'},{'==',0},'Model','Model_ENopen');% open inp file
            errorCode2=calllib('epanet2','ENsaveinpfile',temp_inpFile);
            validateattributes(errorCode2,{'numeric'},{'==',0},'ENsaveinpfile');
            obj.FID=fopen(temp_inpFile);
        end
        function node_pre=getNodePressure(obj,node_id)
            node_id_k=libpointer('cstring',node_id);
            node_index=libpointer('int32Ptr',0);
            node_pre=libpointer('singlePtr',0);
            [~,~,node_index]=calllib('epanet2','ENgetnodeindex',node_id_k,node_index);
            [~,node_pre]=calllib('epanet2','ENgetnodevalue',node_index,11,node_pre);
        end
        function node_ele=getNodeElevation(obj,node_id)
            node_id_k=libpointer('cstring',node_id);
            node_index=libpointer('int32Ptr',0);
            node_ele=libpointer('singlePtr',0);
            [~,~,node_index]=calllib('epanet2','ENgetnodeindex',node_id_k,node_index);
            [~,node_ele]=calllib('epanet2','ENgetnodevalue',node_index,0,node_ele);
        end
        function node_Bdemand=getNodeBaseDemand(obj,node_id)
            node_id_k=libpointer('cstring',node_id);
            node_index=libpointer('int32Ptr',0);
            node_Bdemand=libpointer('singlePtr',0);
            [~,~,node_index]=calllib('epanet2','ENgetnodeindex',node_id_k,node_index);
            [~,node_Bdemand]=calllib('epanet2','ENgetnodevalue',node_index,1,node_Bdemand);
        end
        function node_num=getNodeCount(obj,node_type)
             validateattributes(node_type,{'numeric'},{'>=',0},'Model','getNodeCount',2);
            node_num=libpointer('int32Ptr',0);
            [~,node_num]=calllib('epanet2','ENgetcount',node_type,node_num);
        end
        function run(obj)
            calllib('epanet2','ENsolveH');
            calllib('epanet2','ENsaveH');
        end
        function [PDD_pressure,PDD_demand] = PDDrun(obj)
            junction_num=obj.getNodeCount(0)-obj.getNodeCount(1);
            C_mid=ones(junction_num,1);
            HMIN=obj.pdd.Hmin*C_mid;
            HDES=obj.pdd.Hdes*C_mid;
            Hmin=obj.pdd.Hmin;
            Hdes=obj.pdd.Hdes;
            two=2*C_mid;
            [~,bdemand]=Get(junction_num,1);
            for n=1:obj.pdd.circulation_num%确定循环次数
                calllib('epanet2','ENsolveH');% 运行水力计算
                calllib('epanet2','ENsaveH');%保存
                %---------------检索计算结果
                [~,pre]=Get(junction_num,11);%pressure
                [~,bdemand1]=Get(junction_num,1);%demand
                bdemand2=bdemand1;%bdemand2作为中间变量
                %----------%根据水压处理需水量
                bdemand1(pre<=obj.pdd.Hmin)=0;
                [i2]=find(pre(:,1)>=Hmin&pre(:,1)<=Hdes);
                bdemand1(i2,1)=(bdemand1(i2,1)+bdemand(i2,1).*((pre(i2,1)-HMIN(i2,1))./(HDES(i2,1)-HMIN(i2,1))).^(1/2))./two(i2,1);
                error=abs(bdemand1-bdemand2)-abs(obj.pdd.doa*bdemand2);
                b=max(error);
                if (min(pre)>=0)&&(b<obj.pdd.doa)
                    disp(['满足收敛条件,迭代',num2str(n),'次'])
                    break
                end
                %----------%将处理后需水量输入EPA
                for j=1:junction_num
                    calllib('epanet2','ENsetnodevalue',j,1,bdemand1(j,1));
                end
            end
            calllib('epanet2','ENsaveinpfile','PDD_NET.inp');
            PDD_pressure=pre;
            PDD_demand=bdemand1;
        end
        function report(obj)
            calllib('epanet2','ENsetreport','NODES ALL');
            calllib('epanet2','ENsetreport','NODES ALL');
            calllib('epanet2','ENreport');
            calllib('epanet2','ENclose');
        end
        function delete(obj)
            fclose(obj.FID);
            unloadlibrary epanet2
        end
    end
end