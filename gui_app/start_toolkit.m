function start_toolkit()
%START_TOOLKIT Loads all the appforWDN folder paths in MATLAB. 
%Run this function before calling 'main.m' and the Matlab modules.
%
% Syntax:  start_toolkit
%
% Inputs:
%    none
%
% Outputs:
%    none
%
% Example: 
%    start_toolkit
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: none

% Author        : Zhao Han

%------------- BEGIN CODE --------------
addpath(genpath(pwd));
disp('appforWDN gui_app Paths Loaded.');    
%------------- END OF CODE --------------
end