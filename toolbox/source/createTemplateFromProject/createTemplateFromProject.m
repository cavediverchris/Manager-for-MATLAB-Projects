function [] = createTemplateFromProject(projObj, exportPath)

%% Format Export File Name
name = projObj.Name;
% Check for hyphens
containsHyphens = contains(name, "-");
if containsHyphens
    % CASE: Name contains hyphens
    % ACTION: Erase them
    name = erase(name, "-");
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