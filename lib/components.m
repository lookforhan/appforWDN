% name: components.m
% create a value class
classdef components
    properties
        id
    end
    methods
        function obj = components(id)
            obj.id = id;
        end
        function delete(obj)
            clear obj
        end
    end
    
end
