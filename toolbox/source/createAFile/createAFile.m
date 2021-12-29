%% Create A File
% This script is used to automate the process of setting up a brand new
% script according to a naming convention and folder structure.

%% Prepare
close all;
clear variables global;
clc;
%% Request User Input

if ~(exist("answer", 'var') == 1)
    answer = inputdlg("Enter the title of the file to be created", "New File");
    answer = answer{:};
    answer = string(answer);
end
%% Create container folder
fcnName = erase(answer, " ");
%targetDir = fullfile(pwd , fcnName);
targetDir = pwd;

%% Instantiate the script
newScriptFilename = fullfile(targetDir, fcnName);
[fileId] = initialiseFile(newScriptFilename);

%% Populate the file header

initialiseFileHeader(fileId);
fclose(fileId);
%% Create Unit Test file



%% Create requirements module

%createReqtsModule;