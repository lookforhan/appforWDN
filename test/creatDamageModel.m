%name:creatDamageModel.m
classdef creatDamageModel < handle
    properties
        file
        FID
        newfile
        newFID
        errorCode
    end
    methods
        function obj = creatDamageModel(file)
            obj.file = file;
            temp_file = 'net.inp';
            loadlibrary('epanet2.dll','epanet2.h')
            obj.errorCode=calllib('epanet2','ENopen',file,'net.rpt','net.out');
            errorCode2=calllib('epanet2','ENsaveinpfile',temp_file);
            validateattributes(errorCode2,{'numeric'},{'==',0},'ENsaveinpfile');
            obj.FID=fopen(temp_inpFile);
        end
        function delete(obj)
            fclose(obj.FID);
            fclose(obj.newFID);
        end
        function readData(obj)
        end
    end
end