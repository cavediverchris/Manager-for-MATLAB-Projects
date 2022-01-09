%% Create A File Package
% This script builds on CreateAFile (which will initialise a single MATLAB
% script) by creating what is known as a package.
%
% A package is defined as:
%
% - the script / function required
% - a MATLAB unit test harness
% - a requirements module for the script
% - all contained in an appropriately named (and located) folder structure
%
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
function [] = createAFilePackage(fileTitle)

%% Determine if a path has been provided
% If a path has been provided then the user knows where they want the file
% to be created

[path, name, ext] = fileparts(fileTitle);

if strcmp(path, "")
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

if strcmp(ext, "")
    % CASE: An was not provided
    % ACTION: Set the default extension of .m
    ext = ".m";
else
    % CASE: User specified an extension
    % ACTION: Use their extension
    ext = ext;
end


%% Set the file name according to the naming convention

newFileName = convertSentenceCase(name, "camel-case");
%% Create container folder
% The container folder is used to contain the function file and the
% requirements file

targetDir = fullfile(targetDir , newFileName);
mkdir(targetDir);

projObj = currentProject;
addFile(projObj, targetDir);
addPath(projObj, targetDir);

%% Create a script
% Initialise a new file
newScriptFilename = fullfile(targetDir, newFileName + ext);
createAFile(newScriptFilename);
addFile(projObj, newScriptFilename);

%% Create requirements 
% In this section we want to create a requirements file alongside the newly
% created MATLAB script
reqtsFile = fullfile(targetDir, "reqts_" + newFileName);
createReqtsModule(reqtsFile);
%addFile(projObj, reqtsFile);

%% Create Unit Test file
% A unit test case file is established and added into the tests directory.
testsDir = fullfile(projObj.RootFolder, "tests");

unitTestFilename = fullfile(testsDir, "test_" + newFileName + ".m");
createAFile(unitTestFilename);

addFile(projObj, which(unitTestFilename));

end