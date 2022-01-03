%% Backup
% The purpose of this file is to create a backup of the project sandbox.
% This is done when the repository isn't hosted in a place (e.g. a server,
% or website) that isn't robustly backed up.
%% INPUTS
% This function accepts the following inputs:
%   Input 1: backupDirectory
%       Description: This is a path to the directory that you want the
%       backups of your sandbox to be saved to.
%       Data Type: String.
%       Dimensions: 1x1
%       Units: N/A.
%% SUPPORT
% If you run into any issues using this tool, or have ideas for
% improvements, please log an "issue" <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">on the Git repository</a>.


function backup(backupDirectory)

arguments
   backupDirectory (1,1) {mustBeFolder} 
end

%% Get ready

disp('Starting back up process');
%% Generate backup file name

projObj = currentProject;
backupFile = projObj.Name + ...
                "_backup_" + ...
                date + ...
                ".mlproj";

backupFile = fullfile(backupDirectory, backupFile);

%% Create Backup

if exist(backupFile , 'file') == 0
    % CASE: A backup file with the same name does not exist
    % ACTION: Create the backup
    
    % Print message to screen.
    disp("... No archive file found, exporting project to: " +  backupFile);
    
    export(projObj, backupFile, ...
        'ArchiveReferences', true);
    
    % Print message to screen.
    disp('... Back up completed.')
elseif exist(backupFile , 'file') == 2
    % Print message to screen.
    disp ('... Archive file found for current project - skipping export')
end
end