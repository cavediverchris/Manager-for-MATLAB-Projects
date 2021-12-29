%% initialiseFile
% The purpose of this function is to initialise a new M-file which will
% later be updated with a standardised header structure

function [fileID] = initialiseFile(fullFilePath)
%% Input Validation
% N/A 
%% Initialise file

fileID = fopen(fullFilePath + ".m", 'w+');

% Check that a valid fileID was returned
if fileID == -1
    % CASE: MATLAB cannot open the file
    % ACTION: Generate an error
    errorStruct.message = sprintf('Unable to open file: %s\n', char(fullFilePath));
    errorStruct.identifier = 'initialiseFile:unableToOpenFile';
    error(errorStruct);
elseif ismember(fileID, [0, 1, 2])
    % CASE: fopen returned reserved vale
    % ACTION: Generate an error
    errorStruct.message = 'Opening error, see MATLAB documentation on fopen';
    errorStruct.identifier = 'initialiseFile:reservedFileId';
    error(errorStruct);
elseif fileID >= 3
    % CASE: Valid File ID generated
    % ACTION: No nothing, continue script
else
    % CASE: File ID is less than -1?
    % ACTION: TODO
end % validate returned fileID

end % initialiseFile fcn