%% Create a new file with a standardised header
%   This function is intended to initialise a new file that contains no
%   functionality, but the header (this section) is documented according to
%   a standard structure. This has been done to ensure that all the
%   information that a new user of the file may need will be presented.
%
%   FUNCTION INPUTS
%       Input 1 - functionName
%           Description: This variable captures the name of the M-file to
%           be created and initialised. Note that the extension of *.m is
%           not expected.
%           Data Type: string
%           Dimensions: 1x1
%       Input 2 - path
%           Description: This is an optional input, which if not provided
%           defaults to the 'pwd'. This defines the folder to create the
%           new M-file in.
%           Data Type: string
%           Dimensions: 1x1
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%       A new folder with a child function file with header structured
%       according to this script is created in the AuxiliaryFunctions
%       folder.
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/Project-Template-for-Apps/tree/standardise-file-documentation#standardised-file-header')">Git documentation</a>.
%
%% FUNCTION
function [] = StandardisedFileHeader(...,
                        functionName, ...
                        path)
%% Input Validation
arguments
    functionName {mustBeNonempty, string}
    path (1,1) string = string(pwd) % optional input
end
%% Processing
% Convert to camel case (if appropriate)
if contains(functionName, " ")
    % CASE: the string that the user gave has spaces
    % ACTION: Modify the first letter to be upper case
    capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
    componentWords = functionName.split;
    newWords = arrayfun(capitalize, componentWords);
    functionName = join(newWords, "");
end

% Initialise an empty file
fid = fopen(path + "\" + functionName + ".m", 'wt');

% Create the title line
fprintf(fid, '%%%% %s \n', functionName);

fprintf(fid, '%s \n', '% The purpose of this script is to ... ');
fprintf(fid, '%s \n', '% TODO: Populate the description ... ');
fprintf(fid, '%s \n', '%% FUNCTIONAL INPUTS');
fprintf(fid, '%s \n', '% This function / script accepts the following input(s):');
fprintf(fid, '%s \n', '% Input 1: <Input 1 Name>');
fprintf(fid, '     %s \n', '% Dimensions: Input variable dimensions');
fprintf(fid, '     %s \n', '% Data Type: Input data type');
fprintf(fid, '     %s \n', '% Other comments / information:');

fprintf(fid, '%s \n', '%% FUNCTIONAL OUTPUTS');
fprintf(fid, '%s \n', '% This function / script produces the following output(s):');
fprintf(fid, '%s \n', '% Output 1: Output 1 Name');
fprintf(fid, '     %s \n', '% Dimensions: Output variable dimensions');
fprintf(fid, '     %s \n', '% Data Type: Output data type');
fprintf(fid, '     %s \n', '% Other comments / information:');

fprintf(fid, '%s \n', '%% OTHER OUTPUTS');
fprintf(fid, '%s \n', '% In addition to the functional output(s) described above, this function / script also produces the following other outputs:');
fprintf(fid, '%s \n', '% Other Output 1: e.g logfile.txt');
fprintf(fid, '     %s \n', '% Dimensions: Output variable dimensions');
fprintf(fid, '     %s \n', '% Data Type: Output data type');
fprintf(fid, '     %s \n', '% Other comments / information:');

% Create a "links" section
fprintf(fid, '%s \n', '%% LINKS');
fprintf(fid, '%s \n', '% For further information check out: <a href="matlab:web("https://github.com/cavediverchris/")">Git documentation</a>.'); 
fprintf(fid, '%s \n', '% TODO: Populate any relevent external links ... ');

%% Close the file for editing
fclose(fid);