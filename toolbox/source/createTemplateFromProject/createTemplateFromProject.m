%% TBD
% The purpose of this file is to ...
% TODO: Populate the description
%% INPUTS
% This function accepts the following inputs:
%   Input 1: <<INPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%       Other comments / information: TBD.
%
%   Input 2: <<INPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%       Other comments / information: TBD.
%
%% OUTPUTS
% This function accepts the following inputs:
%   Output 1: <<OUTPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%
%   Output 2: <<OUTPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%% SUPPORT
% For further information check out: <a href="matlab:web('https://github.com/cavediverchris/')">Git documentation</a>.
% TODO: Populate any relevent external links ... 
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