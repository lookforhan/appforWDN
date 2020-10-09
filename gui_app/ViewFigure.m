classdef ViewFigure < handle
    properties
        modelObj
        controlObj
        viewSize    ;% ���ڿ�����ͼ��С������
        hfig        ;% ��ͼ�����ӵ��figure��handle
        ButtonRun
        text_outputFolder
        text_Inpfile
        text_RRfile
        text_MCnum 
    end
    properties(Dependent)
        input
    end
    methods
        function obj = ViewFigure(modelObj)
            obj.modelObj = modelObj;
            obj.viewSize = [100,100,300,200];
            obj.modelObj.addlistener('runOver',@obj.over);
            obj.buildUI();
            obj.controlObj = obj.makController();
            obj.attachToController(obj.controlObj)
        end
        function input = get.input(obj)
            outputFolder = get(obj.text_outputFolder,'string');
            Inpfile = get(obj.text_Inpfile,'string');
            RRfile = get(obj.text_RRfile,'string');
            MCnum  = get(obj.text_MCnum,'string');
            input.outputFolder = outputFolder;
            input.Inpfile = Inpfile;
            input.RRfile = RRfile;
            input.MCnum = str2double(MCnum);
        end
        function buildUI(obj)
            obj.hfig = figure('pos',obj.viewSize,'menubar','none','toolbar','none','name','WDNsimulation','numbertitle','off');
            mainLayout =  uix.VBox('parent',obj.hfig,'Padding',5,'spacing',10);
            upperLayout = uix.VBox('pare',mainLayout,'Spacing',5);
            lowerLayout = uix.HBox('pare',mainLayout,'Spacing',5);
            obj.text_outputFolder = uicontrol('pare',upperLayout,'style','edit','string','����ļ�λ��');
            obj.text_Inpfile = uicontrol('pare',upperLayout,'style','edit','string','�����ļ�');
            obj.text_RRfile = uicontrol('pare',upperLayout,'style','edit','string','RR�ļ�');
            obj.text_MCnum = uicontrol('pare',lowerLayout,'style','edit','string','MC ����');
            obj.ButtonRun = uicontrol('pare',lowerLayout,'style','pushbutton','string','Run');
        end
        function over(obj,scr,data)
            f = figure('pos',obj.viewSize,'menubar','none','toolbar','none','name','giraffe','numbertitle','off');
            m = uicontrol('pare',f,'style','text','string','OVER');
            unloadlibrary epanet2
        end
        function controlObj = makController(obj)
            controlObj = Controller(obj,obj.modelObj);
        end
        function attachToController(obj,controller)
            funcH1 = @controller.callback_ButtonRun;
            set(obj.ButtonRun,'callback',funcH1);
        end
    end
    
end