%% name: node.m
% this is a class of node
classdef node < components 
    properties
        id
        x
        y
    end
    methods
        function obj=node(id)
            obj.id=id;
        end
    end
end
