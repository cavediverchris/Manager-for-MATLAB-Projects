%% Initialise File Header
% The purpose of this function is to set up a MATLAB M-file to have the a
% standard file header.

function [] = initialiseFileHeader(fileId)

arguments
    fileId (1,1) {mustBeNumeric}
end

%% Case Conversion
functionName = "TBD";
if contains(functionName, " ")
    % CASE: the string that the user gave has spaces
    % ACTION: Modify the first letter to be upper case
    capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
    componentWords = functionName.split;
    newWords = arrayfun(capitalize, componentWords);
    functionName = join(newWords, "");
end

%% Populate file header

% Create title and description
fprintf(fileId, '%%%% %s\n', functionName);
fprintf(fileId, '%% %s\n', 'The purpose of this file is to ...');
fprintf(fileId, '%% %s\n', 'TODO: Populate the description');

% Create inputs definition section
fprintf(fileId, '%s\n', '%% INPUTS');
fprintf(fileId, '%s\n', '% This function accepts the following inputs:');
fprintf(fileId, '%s\n', '%   Input 1: <<INPUT 1 NAME>>');
fprintf(fileId, '%s\n', '%       Description: TBD.');
fprintf(fileId, '%s\n', '%       Data Type: TBD.');
fprintf(fileId, '%s\n', '%       Dimensions: TBD.');
fprintf(fileId, '%s\n', '%       Units: TBD.');
fprintf(fileId, '%s\n', '%       Other comments / information: TBD.');
fprintf(fileId, '%s\n', '%');
fprintf(fileId, '%s\n', '%   Input 2: <<INPUT 1 NAME>>');
fprintf(fileId, '%s\n', '%       Description: TBD.');
fprintf(fileId, '%s\n', '%       Data Type: TBD.');
fprintf(fileId, '%s\n', '%       Dimensions: TBD.');
fprintf(fileId, '%s\n', '%       Units: TBD.');
fprintf(fileId, '%s\n', '%       Other comments / information: TBD.');
fprintf(fileId, '%s\n', '%');

% Create outputs definition section
fprintf(fileId, '%s\n', '%% OUTPUTS');
fprintf(fileId, '%s\n', '% This function accepts the following inputs:');
fprintf(fileId, '%s\n', '%   Output 1: <<OUTPUT 1 NAME>>');
fprintf(fileId, '%s\n', '%       Description: TBD.');
fprintf(fileId, '%s\n', '%       Data Type: TBD.');
fprintf(fileId, '%s\n', '%       Dimensions: TBD.');
fprintf(fileId, '%s\n', '%       Units: TBD.');
fprintf(fileId, '%s\n', '%');
fprintf(fileId, '%s\n', '%   Output 2: <<OUTPUT 1 NAME>>');
fprintf(fileId, '%s\n', '%       Description: TBD.');
fprintf(fileId, '%s\n', '%       Data Type: TBD.');
fprintf(fileId, '%s\n', '%       Dimensions: TBD.');
fprintf(fileId, '%s\n', '%       Units: TBD.');

% Create support section
fprintf(fileId, '%%%% %s\n', 'SUPPORT');
fprintf(fileId, '%s\n', '% For further information check out: <a href="matlab:web(''https://github.com/cavediverchris/'')">Git documentation</a>.'); 
fprintf(fileId, '%s\n', '% TODO: Populate any relevent external links ... ');

end

