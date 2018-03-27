%name:OpenINP.m
% a class for open INP file
classdef OpenINP < handle
    properties
        FID
    end
    methods
        function obj = OpenINP (file)%file is inp file path
            %validatestring();% test input parameter
            obj.FID = fopen(file);%
        end
        function delete(obj)
            fclose(obj.FID);
        end
    end
end
