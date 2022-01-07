%% Build Toolbox
% The purpose of this file is to provide a one-click routine that will
% create a new MATLAB Toolbox file from the project. It will create a new
% MATLAB Toolbox file at the present working directory.
%% SUPPORT
% This script operates based on MATLAB Projects. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% This script generates a MATLAB Toolbox file which can be shared and used
% to install the features. You can learn more about MATLAB Toolboxes from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/creating-help.html')">MATLAB Toolboxes support page.</a>.
%
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
%% MAIN
% Do an update to ensure we've got the latest versions of the reference
% projects that we will want to build templates of
!git submodule update --init --recursive
 
% build the latest versions of the template files
buildProjectTemplates;

% Then build the Toolbox project
projObj = currentProject;
projectFile = fullfile(projObj.RootFolder, ...
                        "toolbox", ...
                        'Manager for MATLAB Projects.prj');
matlab.addons.toolbox.packageToolbox(projectFile);