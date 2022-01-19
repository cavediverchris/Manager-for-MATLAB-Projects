%% createAModelPackage
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
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% Main
function [] = createAModelPackage(modelTitle)
%% Determine if a path has been provided
% If a path has been provided then the user knows where they want the file
% to be created

[path, name, ext] = fileparts(modelTitle);

if strcmp(path, "")
    % CASE: A path was not provided
    % ACTION: Set a default path
    targetDir = fullfile(pwd);
    name = modelTitle;
else
    % CASE: User specified a path
    % ACTION: Set the path appropriately
    targetDir = fullfile(path);
    name = name;
end

if strcmp(ext, "")
    % CASE: An was not provided
    % ACTION: Set the default extension of .m
    ext = ".slx";
else
    % CASE: User specified an extension
    % ACTION: Use their extension
    ext = ext;
end

%% Set the file name according to the naming convention

newModelName = convertSentenceCase(name, "camel-case");

%% Create container folder
% The container folder is used to contain the function file and the
% requirements file

targetDir = fullfile(targetDir , newModelName);
mkdir(targetDir);

projObj = currentProject;
addFile(projObj, targetDir);
addPath(projObj, targetDir);

myFile = findFile(projObj, targetDir);
myFile.addLabel("Classification", "Design");
%% Create the model
newModelFilename = fullfile(targetDir, newModelName + ext);
createAModel(newModelFilename);
addFile(projObj, newModelFilename);

myFile = findFile(projObj, newModelFilename);
myFile.addLabel("Classification", "Design");
%% Create requirements 
% In this section we want to create a requirements file alongside the newly
% created MATLAB script
reqtsFile = fullfile(targetDir, "reqts_" + newModelName);
[result, ~] = createReqtsModule(reqtsFile);

if result == 0
    % CASE: A SL Reqts licence is not available
    % ACTION: Do nothing
elseif result == 1
    % CASE: A requirements file has been created
    % ACTION: Add it to project
    addFile(projObj, reqtsFile);
    myFile = findFile(projObj, newModelFilename);
    myFile.addLabel("Classification", "Artifact");
end
%% Create Test Harness
[testHarnessFilename] = createAModelTestHarness(newModelFilename);

if strcmp(testHarnessFilename, newModelFilename)
    % CASE: Test harness filename is the same as new model name. This will
    % be the case if internal test harnesses have been created
    % ACTION: Do nothing
else
    % CASE: An external test harness has been provided
    % ACTION: Add it to the project
    addFile(projObj, which(testHarnessFilename));
    
    myFile = findFile(projObj, which(testHarnessFilename));
    myFile.addLabel("Classification", "Test");
end