

projObj = currentProject;

refs = projObj.ProjectReferences;

for r = refs
    exportPath = fullfile(projObj.RootFolder, "toolbox", "source");
    createTemplateFromProject(r.Project, exportPath);
end