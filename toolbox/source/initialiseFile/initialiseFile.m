%% initialiseFile
% The purpose of this function is to initialise a new M-file which will
% later be updated with a standardised header structure
%% INPUTS
% This function accepts the following inputs:
%   Input 1: fullFilePath
%       Description: This input is the full path plus file name (without
%       extension) of the file to be initialised.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%
%% OUTPUTS
% This function accepts the following inputs:
%   Output 1: fileID
%       Description: This is a unique ID that MATLAB assigns when it has
%       successfully been able to create a file. This fileID can now be
%       used to write additional data to the file.
%       Data Type: Number? Integer?.
%       Dimensions: 1x1.
%       Units: N/A.
%
%% SUPPORT
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN
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