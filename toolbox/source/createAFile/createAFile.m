%% Create A File
% This script is used to automate the process of setting up a brand new
% script according to a naming convention and with a template file header
%% INPUTS
% This function accepts the following inputs:
%   Input 1: fileTitle
%       Description: This is the name of the file that you wish to create.
%       If this is also a path, then the file will be created at the
%       defined location. If this input is just a name, then the file will
%       be created at the present working directory.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%       Other comments / information: It can be a path to a specific
%       directory, or  simply a name
%% SUPPORT
% This script operates on the currently running MATLAB Project. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
%% MAIN
function [] = createAFile(fileTitle)


%% Create a script
% Initialise a new file
[fileId] = initialiseFile(fileTitle);

% Populate the file header
initialiseFileHeader(fileId);
fclose(fileId);

end