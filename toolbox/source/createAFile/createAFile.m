%% Create A File
% This script is used to automate the process of setting up a brand new
% script according to a naming convention and folder structure.
%% INPUTS
% This function accepts the following inputs:
%   Input 1: fileTitle
%       Description: This is the name of the file that you wish to create.
%       If this is also a path, then the file will be created at the
%       defined location. If this input is just a name, then the file will
%       be created at the present working directory.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%       Other comments / information: It can be a path to a specific
%       directory, or  simply a name
%% SUPPORT
% This script operates on the currently running MATLAB Project. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
%% MAIN
function [] = createAFile(fileTitle)

%% Determine if a path has been provided
% If a path has been provided then the user knows where they want the file
% to be created

[path, name, ext] = fileparts(fileTitle);

if isempty(path)
    % CASE: A path was not provided
    % ACTION: Set a default path
    targetDir = fullfile(pwd);
    name = fileTitle;
else
    % CASE: User specified a path
    % ACTION: Set the path appropriately
    targetDir = fullfile(path);
    name = name;
end

%% Set the file name according to the naming convention

newFileName = convertSentenceCase(name, "camel-case");
%% Create container folder



targetDir = fullfile(targetDir , newFileName);
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