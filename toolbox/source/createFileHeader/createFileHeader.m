%% createFileHeader
% The purpose of this function is to initialise a new M-file with a
% pre-defined template header structure.


function [] = createFileHeader(fullFilePath)
%% Input Validation
% N/A 
%% Initialise file

fileID = fopen(fullFilePath, 'w+');

% Check that a valid fileID was returned
if fileID == -1
    % CASE: MATLAB cannot open the file
    % ACTION: Generate an error
    errorStruct.message = sprintf('Unable to open file: %s\n', char(fullFilePath));
    errorStruct.identifier = 'createFileHeader:unableToOpenFile';
    error(errorStruct);
elseif ismember(fileID, [0, 1, 2])
    % CASE: fopen returned reserved vale
    % ACTION: Generate an error
    errorStruct.message = 'Opening error, see MATLAB documentation on fopen';
    errorStruct.identifier = 'createFileHeader:reservedFileId';
    error(errorStruct);
elseif fileID >= 3
    % CASE: Valid File ID generated
    % ACTION: No nothing, continue script
else
    % CASE: File ID is less than -1?
    % ACTION: TODO
end % validate returned fileID
%% Create title and initial description


%% Close the file
fclose(fileID);
end % createFileHeader fcn