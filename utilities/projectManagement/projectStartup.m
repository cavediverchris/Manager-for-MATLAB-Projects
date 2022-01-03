%% Project Set Up
% This script sets up the environment for the current MATLAB Project.
% This script needs to be added to the Shortcuts to Run at Start to ensure
% all the initialisation is conducted at project start.

%% Clear the workspace and command window
% The workspace is cleared of all current variables and all windows are
% closed this done to prevent any collisions with models or scripts that
% operate on data in the base workspace.

clc
clear variables global
close all

%% Set working directories
% In this section we will set the directory of any simulation files and any
% code generation files to be stored in a particular work directory so as
% not to clutter the working folder.
projObj = currentProject;

% Create the location of slprj to be the "work" folder of the current project:
myCacheFolder = fullfile(projObj.RootFolder, 'SimulinkCacheFolder');

% Check if the project settings have the work folder set

if strcmp(myCacheFolder, projObj.SimulinkCacheFolder)
    % CASE: The cache folder is set in the project
    % ACTION: Do nothing?
    % TODO: Check that this is always the case
else
    % CASE: The project does not have the Simulink Cache Folder set
    % ACTION: Create the folder and set it
    
    if ~exist(myCacheFolder, 'dir')
        % CASE: The cache folder doesn't already exist
        % ACTION: Create it and also add it to the project.
        mkdir(myCacheFolder)
        addFolderIncludingChildFiles(projObj, myCacheFolder);
        %        addPath(projObj, myCacheFolder); % CAN'T ADD TO PATH DURING PROJECT START UP
    end
    
    projObj.SimulinkCacheFolder = myCacheFolder;
    
end

% Create the location for any files generated during build for code
% generation.
% Create the location of slprj to be the "work" folder of the current project:
myCodeGenFolder = fullfile(projObj.RootFolder, 'CodeGen');

% Check if the project settings have the work folder set

if strcmp(myCodeGenFolder, projObj.SimulinkCodeGenFolder)
    % CASE: The cache folder is set in the project
    % ACTION: Do nothing?
    % TODO: Check that this is always the case
else
    % CASE: The project does not have the Simulink Cache Folder set
    % ACTION: Create the folder and set it
    
    if ~exist(myCodeGenFolder, 'dir')
        % CASE: The cache folder doesn't already exist
        % ACTION: Create it and also add it to the project.
        mkdir(myCodeGenFolder)
        addFolderIncludingChildFiles(projObj, myCodeGenFolder);
        %        addPath(projObj, myCodeGenFolder); % CAN'T ADD TO PATH DURING PROJECT START UP
    end
    
    projObj.SimulinkCodeGenFolder = myCodeGenFolder;
    
end

clear myCacheFolder myCodeGenFolder;

%% Back Up - Project Folder
% This schedules an aut-export of the Simulink project every day, it simply
% checks whether a folder with the project name / date exists in the export
% location

% Set this flag to false to disable archiving
runBackUp = true;

if runBackUp == true
    % CASE: User wishes to backup the project
    % ACTION: Run the backup
    
    % Check the operating system
    if isunix
        % CASE: Running on linux
        % ACTION: Set the seperator appropriately
        sep = '/';
    elseif ispc
         % CASE: Running on windows
        % ACTION: Set the seperator appropriately
        sep = '\';
    else
        disp('Platform not supported')
    end
    
    parts = strsplit(projObj.RootFolder, sep);
    destination = strjoin(parts(1:end-1), sep);
    destination = fullfile(destination, "backupsFolder");
    if ~(exist(destination, 'dir') == 2)
        % CASE: The backups folder does not exist
        % ACTION: create it
        mkdir(destination);
    end
    
    backup(destination);
end

%% Clean Up
% clear up the workspace
clear variables global;