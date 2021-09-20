% buildProjectTemplates
% The purpose of this script is to build the project references (which are
% templates of MATLAB projects) into Template files which can then be
% packaged and distributed.

% Acquire the current project
projObj = currentProject;


% Get the referenced projects
refs = projObj.ProjectReferences;

% Iterate over each reference and package it as a template file.
for r = refs
    exportPath = fullfile(projObj.RootFolder, "toolbox", "source");
    createTemplateFromProject(r.Project, exportPath);
end