clear all;
clc;
close all;
t=libisloaded('epanet2')
if t==1
    unloadlibrary epanet2
end
modelObj = Model();
viewObj = ViewFigure(modelObj);
% C:\Users\hc042\Documents\MATLAB\gui_app\result
% C:\Users\hc042\Documents\MATLAB\gui_app\example\GWSL_4.inp
% C:\Users\hc042\Documents\MATLAB\gui_app\example\GWSL_4_RR.txt