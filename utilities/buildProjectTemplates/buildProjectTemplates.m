%% buildProjectTemplates
% The purpose of this script is to build the project references (which are
% templates of MATLAB projects) into Template files which can then be
% packaged and distributed.
%% SUPPORT
% This script operates on the currently running MATLAB Project. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN

% Acquire the current project
projObj = currentProject;


% Get the referenced projects
refs = projObj.ProjectReferences;

% Iterate over each reference and package it as a template file.
for r = refs
    exportPath = fullfile(projObj.RootFolder, "toolbox", "source");
    createTemplateFromProject(r.Project, exportPath);
end