classdef Controller < handle
    properties
        viewObj;
        modelObj;
    end
    methods
        function obj = Controller(viewObj,modelObj)
            obj.viewObj = viewObj;
            obj.modelObj = modelObj;
        end
        function callback_ButtonRun(obj,src,event)
            diary run.log
            try 
                obj.modelObj.run(obj.viewObj.input);
            catch
                diary off
            end
            diary off
        end
    end
end