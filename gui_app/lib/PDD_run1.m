function [out_pre,out_demand]=PDD_run1(inputdata,outputrpt,Hmin,Hdes,circulation_num,node_original_data)
% inputdata=output_net_filename;%�����ļ�����
t=libisloaded('epanet2');
if t==0
    loadlibrary('epanet2.dll','epanet2.h');
end

calllib('epanet2','ENopen',inputdata,'.\temporary\PDD_run1_demage_net.rpt','.\temporary\PDD_run1_EXAMPLE.out');
calllib('epanet2','ENsolveH');% ����ˮ������
calllib('epanet2','ENsaveH');%����
calllib('epanet2','ENsetreport','NODES ALL'); % �����������ĸ�ʽ
calllib('epanet2','ENreport'); %������㱨��
count=libpointer('int32Ptr',0);%ָ�����--�������м����
[~,count_node]=calllib('epanet2','ENgetcount',0,count);%ȫ���ڵ����
[~,count_tank]=calllib('epanet2','ENgetcount',1,count);%ˮ�غ�ˮ������
junction_num=count_node-count_tank;%�û��ڵ����
[~,pressure]=Get(junction_num,11);%�ڵ�ѹ��,
calllib('epanet2','ENclose'); %�رռ���


calllib('epanet2','ENopen',inputdata,outputrpt,'.\temporary\PDD_run1_EXAMPLE.out');%��inputdata�ļ�
C_mid=ones(junction_num,1);
HMIN=Hmin*C_mid;HDES=Hdes*C_mid;two=2*C_mid;
[~,bdemand]=Get(junction_num,1);%��ˮ��
for n=1:circulation_num%ȷ��ѭ������
    calllib('epanet2','ENsolveH');% ����ˮ������
    calllib('epanet2','ENsaveH');%����
    %---------------����������
    [~,pre]=Get(junction_num,11);%ѹ��
    [~,bdemand1]=Get(junction_num,1);%��ˮ��
    bdemand2=bdemand1;%bdemand2��Ϊ�м����
    %----------%����ˮѹ������ˮ��
    doa = 0.1;
    bdemand1(pre<=Hmin)=0;
    [i2]=find(pre(:,1)>=Hmin&pre(:,1)<=Hdes);
    bdemand1(i2,1)=(bdemand1(i2,1)+bdemand(i2,1).*((pre(i2,1)-HMIN(i2,1))./(HDES(i2,1)-HMIN(i2,1))).^(1/2))./two(i2,1);
    error=abs(bdemand1-bdemand2);
    b=max(abs(error));
    if b<0.1
        calllib('epanet2','ENsaveinpfile','.\temporary\PDD_run1_1111.inp');
        break
    end
    %----------%���������ˮ������EPA
    for i=1:junction_num
        calllib('epanet2','ENsetnodevalue',i,1,bdemand1(i,1));
    end
end 
calllib('epanet2','ENsetreport','NODES ALL'); % �����������ĸ�ʽ
calllib('epanet2','ENreport'); %������㱨��
node_id=node_original_data(:,1);
original_junction_num=numel(node_id);
[out_pre,out_demand]=Get_chosen_node_value(original_junction_num,node_id);

end