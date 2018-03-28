%name:MC_parameter.m
classdef MC_parameter < handle
    properties
        file
        FID
        n_seed
        MC_num
        n_argin
    end
    methods
        function obj = MC_parameter(file)
            obj.n_argin=nargin;
            if nargin == 0
                obj.n_seed = 2;
                obj.MC_num = 50;
            else
                
                obj.file = file;
                obj.FID = fopen(file,'r');
                data = textscan(obj.FID,'%s%f','delimiter','\t','headerlines',1);
                obj.n_seed=data{1,2}(1);
                obj.MC_num=data{1,2}(2);
            end
        end
        function delete(obj)
            if obj.n_argin==0
            else
                fclose(obj.FID);
            end
        end
    end
end