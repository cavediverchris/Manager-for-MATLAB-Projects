%% Initialise File Header
% The purpose of this function is to set up a MATLAB M-file to have the a
% standard file header.

function [] = initialiseFileHeader(fileId)

arguments
    fileId mustBeNumeric
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
fprintf(fileId, '%s \n', '%% The purpose of this file is to ...');
fprintf(fileId, '%s \n', '% TODO: Populate the description');
fprintf(fileId, '%s', '%%\n');

% Create inputs definition section
fprintf(fileId, '%s', '%%%% INPUTS\n');
fprintf(fileId, '%s', '%% This function accepts the following inputs:\n');
fprintf(fileId, '%s', '%%   Input 1: <<INPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');
fprintf(fileId, '%s', '%%       Other comments / information: TBD.\n');
fprintf(fileId, '%s', '\n');
fprintf(fileId, '%s', '%%   Input 2: <<INPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');
fprintf(fileId, '%s', '%%       Other comments / information: TBD.\n');

% Create outputs definition section
fprintf(fileId, '%s', '%%%% OUTPUTS\n');
fprintf(fileId, '%s', '%% This function accepts the following inputs:\n');
fprintf(fileId, '%s', '%%   Output 1: <<OUTPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');
fprintf(fileId, '%s', '\n');
fprintf(fileId, '%s', '%%   Output 2: <<OUTPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');

% Create support section
fprintf(fileId, '%s', '%%%% SUPPORT\n');
fprintf(fileId, '%s \n', '% For further information check out: <a href="matlab:web("https://github.com/cavediverchris/")">Git documentation</a>.'); 
fprintf(fileId, '%s \n', '% TODO: Populate any relevent external links ... ');

end

