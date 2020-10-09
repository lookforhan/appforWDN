classdef Model < handle
    properties
        pdd
        epaFormat
        outputFolder
        Inpfile
        RRfile
        MCnum
        RRdata
        netData
        damageInfo
        
    end
    events
        runOver
    end
    methods
        function obj =Model()
            % addpath('./lib')
            load epa_format.mat
            t=libisloaded('epanet2');
            if t==0
                loadlibrary('epanet2.dll','epanet2.h');
            end
            %             validateattributes(errorCode,{'numeric'},{'==',0},'Model','Model_ENopen');
            obj.pdd=PDD_Parameter();
            obj.epaFormat = epa_format;
        end
        function run(obj,input)
            diary on % 打开记录
            obj.outputFolder = input.outputFolder;
            obj.Inpfile = input.Inpfile;
            obj.RRfile = input.RRfile;
            obj.MCnum = input.MCnum;
            %---------------------
            mkdir(obj.outputFolder);
            obj.readNet()
            obj.readRR()
            MC_pre_cell = cell(1,obj.MCnum);
            MC_dem_cell = cell(1,obj.MCnum);
            for MC_i = 1:obj.MCnum
                disp(['第',num2str(MC_i),'次MC抽样：'])
                obj.creatDamageInfo();
                damage_inp_File  = [obj.outputFolder,'\damageNet_',num2str(MC_i),'.inp'];
                obj.creatDamageModel(damage_inp_File);
                [PDD_pressure,PDD_demand]=obj.pddRun(damage_inp_File);
                MC_pre_cell{MC_i} = PDD_pressure;
                MC_dem_cell{MC_i} = PDD_demand;
            end
            MC_pre = cell2mat(MC_pre_cell);
            MC_dem = cell2mat(MC_dem_cell);
            dlmwrite([obj.outputFolder,'\Pressure.txt'],MC_pre,'delimiter','\t','newline','pc','precision','%2.3f');
            dlmwrite([obj.outputFolder,'\demand.txt'],MC_pre,'delimiter','\t','newline','pc','precision','%2.3f');
            diary off
            obj.notify('runOver');
        end
        function readNet(obj)
            Net = readNETdata(obj.Inpfile);
            Net.pre_readData();
            Net.readData();
            obj.netData = Net.netData;
            Net.delete();
        end
        function readRR(obj)
            RR = readRRdata(obj.RRfile);
            RR.RRdata = readtable(RR.file);
            obj.RRdata = RR.RRdata;
            RR.delete();
        end
        function creatDamageInfo(obj)
            Damage = creatDamageInfo(obj.RRdata);
            Damage.run();
            obj.damageInfo = Damage.damageInfo;
            Damage.delete();
        end
        function creatDamageModel(obj,damage_inp_file)
            epa_format = obj.epaFormat;
            net_data = obj.netData;
            damage_pipe_info =[{obj.damageInfo.damagePipe_num},...
                {obj.damageInfo.damageNode_length},...
                {obj.damageInfo.damageNode_type},...
                {obj.damageInfo.damageNode_leakC}];
            [t,damage_node_data]=ND_Junction5(net_data,damage_pipe_info);
            [t_p,pipe_new_add]=ND_Pipe4(damage_node_data,damage_pipe_info,net_data{5,2});
            [t,all_add_node_data,pipe_new_add]=ND_P_Leak3(damage_node_data,damage_pipe_info,pipe_new_add);
            pipe_data=net_data{5,2};
            pipe_data(damage_pipe_info{1,1},:)=[];
            mid_data=(struct2cell(pipe_new_add))';
            all_pipe_data=[pipe_data;mid_data];
            
            dataP=all_pipe_data(:,1:3);
            dataR=net_data{3,2}(:,1);
            dataC=[net_data{23,2}(:,1);all_add_node_data(:,1)];
            if ~isempty(net_data{4,2})
                dataT=net_data{4,2}(:,1);
            else
                dataT=[];
            end
            [isolated_node_num,Nid,Nloc,Pid,Ploc]=NC_bfs3(dataP,dataR,dataC,dataT);
            %             all_node_coordinate=[net_data{23,2};all_add_node_data(:,1:3)];
            all_node_coordinate=[net_data{23,2};all_add_node_data(:,1:3)]; %所有节点坐标（包括水源、水池、用户节点）；!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            if isolated_node_num==0
                disp('破损管网连通性检查完成,不存在孤立节点！')
                [~,outdata]=ND_Out_no_delete(all_pipe_data,all_add_node_data,all_node_coordinate,net_data);
            else
                disp(['破损管网连通性检查完成，存在', num2str(isolated_node_num),'个孤立节点，孤立节点及其邻接管段已删除！'])
                [~,outdata]=ND_Out_delete4(Nid,Nloc,Ploc,all_pipe_data,all_add_node_data,all_node_coordinate,net_data);
            end
            t_W=Write_Inpfile4(net_data,epa_format,outdata,damage_inp_file);
        end
        function [PDD_pressure,PDD_demand]=pddRun(obj,inpfile)
            node_original_data = obj.netData{2,2};
            out_rpt = '.\temporary\out.rpt';
            [PDD_pressure,PDD_demand]=PDD_run1(inpfile,out_rpt,obj.pdd.Hmin,obj.pdd.Hdes,obj.pdd.circulation_num,node_original_data);
        end
    end
end