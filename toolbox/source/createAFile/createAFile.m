%% Create A File
% This script is used to automate the process of setting up a brand new
% script according to a naming convention and folder structure.

function [] = createAFile(fileTitle)
%% Create container folder

newFileName = convertSentenceCase(fileTitle, "camel-case");

targetDir = fullfile(pwd , newFileName);
mkdir(targetDir);
%targetDir = pwd;

%% Create a script
% Initialise a new file
newScriptFilename = fullfile(targetDir, newFileName);
[fileId] = initialiseFile(newScriptFilename);

% Populate the file header
initialiseFileHeader(fileId);
fclose(fileId);

% Add the container folder and new script to the project
projObj = currentProject;
addFolderIncludingChildFiles(projObj, targetDir);
addPath(projObj, targetDir);
%% Create Unit Test file
% A unit test case file is established and added into the tests directory.
testsDir = fullfile(projObj.RootFolder, "tests");

unitTestFilename = fullfile(testsDir, "test_" + newFileName);
[fileId] = initialiseFile(unitTestFilename);
initialiseFileHeader(fileId);
fclose(fileId);

addFile(projObj, which(unitTestFilename));

end