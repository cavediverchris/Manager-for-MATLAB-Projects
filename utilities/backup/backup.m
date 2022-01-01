%% Backup
% The purpose of this file is to create a backup of the project sandbox.
% This is done when the repository isn't hosted in a place (e.g. a server,
% or website) that isn't robustly backed up.
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
% For further information check out: <a href="matlab:web("https://github.com/cavediverchris/")">Git documentation</a>.
% TODO: Populate any relevent external links ... 

function [] = backup(backupDirectory)

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