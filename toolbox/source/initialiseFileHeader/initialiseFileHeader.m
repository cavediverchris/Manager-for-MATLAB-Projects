%% Initialise File Header
% The purpose of this function is to set up a MATLAB M-file to have the a
% standard file header.

function [] = initialiseFileHeader(fileId)

% Create title and description
fprintf(fileId, '%s', '%%%% Placeholder File Title\n');
fprintf(fileId, '%s', '%% The purpose of this file is to ...\n');
fprintf(fileId, '%s', '%%\n');

% Create inputs definition section
fprintf(fileId, '%s', '%%%% INPUTS\n');
fprintf(fileId, '%s', '%% This function accepts the following inputs:\n');
fprintf(fileId, '%s', '%%   Input 1: <<INPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');
fprintf(fileId, '%s', '\n');
fprintf(fileId, '%s', '%%   Input 2: <<INPUT 1 NAME>>');
fprintf(fileId, '%s', '%%       Description: TBD.\n');
fprintf(fileId, '%s', '%%       Data Type: TBD.\n');
fprintf(fileId, '%s', '%%       Dimensions: TBD.\n');
fprintf(fileId, '%s', '%%       Units: TBD.\n');

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

end

