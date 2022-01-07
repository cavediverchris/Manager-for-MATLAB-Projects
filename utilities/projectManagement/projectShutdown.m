%% Project Shutdown
% The purpose of this file is to facilitate a controlled project teardown
% sequence. Any customisations that were applied during the project setup
% sequence will be removed to ensure a standard development environment for
% everyone.
%% SUPPORT
% This script operates on the currently running MATLAB Project. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN
% Clear up workspace for dialog message
clc;

% Close down project
disp('Closing down project.');

% Clear workspace
clear variables global
disp('... Cleared workspace');

% Close any open data dictionaries
Simulink.data.dictionary.closeAll;
disp('... Closed data dictionary(s)');