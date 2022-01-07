%% createTemplateFromProject
% The purpose of this file is to create a MATLAB Project template file
% (*.sltx) of the specified project. The resulting template file is then
% placed at the location defined by exportPath.
%% INPUTS
% This function accepts the following inputs:
%   Input 1: projObj
%       Description: This is the project object for the MATLAB Project that
%       is to be compiled into a template.
%       Data Type: matlab.project.Project class. <a href="matlab:web('https://uk.mathworks.com/help/matlab/ref/matlab.project.project.html')">See MathWorks documentation for more information.</a>. 
%       Dimensions: 1x1.
%       Units: N/A.
%       Other comments / information: Get the project object using projObj = currentProject;.
%
%   Input 2: exportPath
%       Description: This input defines the location that you wish to store
%       the MATLAB Project template.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%
%% SUPPORT
% This script operates on a  MATLAB Project object. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN
function [] = createTemplateFromProject(projObj, exportPath)

%% Format Export File Name
name = projObj.Name;
% Check for hyphens
containsHyphens = contains(name, "-");
if containsHyphens
    % CASE: Name contains hyphens
    % ACTION: Replace them with underscores
    name = replace(name, "-", "_");
end

% Check for spaces
containsSpaces = contains(name, " ");
if containsSpaces
    % CASE: Name contains spaces
    % ACTION: Replace them with underscores
    name = replace(name, " ", "_");
end

% Append extension
name = name + ".sltx";
%% Export Project

templateFile = Simulink.exportToTemplate(projObj, ...
                    name, ...
                    'Author', getenv('USERNAME'), ...
                    'Description', projObj.Description, ...
                    'Group', 'Templates by Chris Armstrong');
                    
if strcmp(exportPath, pwd)
    % CASE: We are currently in the export path
    % ACTION: Do nothing
else
    % CASE: We are elsewhere and the movefile will be successful
    % ACTION: Movve the template file to the exportPath
    movefile(templateFile, fullfile(exportPath, name));
end
end