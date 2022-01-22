%% initialiseTestClass
% The purpose of this file is to extend the initialisation of a unit test
% case file. When a unit test case file is created, it is first populated
% with a standardised file header. Then some test-specific material is
% added. This function will set up the test-specific material for a unit
% test case.
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
% For further information check out: <a href="matlab:web('https://github.com/cavediverchris/')">Git documentation</a>.
% TODO: Populate any relevent external links ... 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
function [] = initialiseTestClass (fileId)

% Write the class definition header
fprintf(fileId, 'classdef %s < matlab.unittest.TestCase\n', 'TBD');

% Write the methods block header
fprintf(fileId, '   methods(Test)\n');

% TODO - WRITE THE REST OF THE TEST DEF INITIALISATION

% Write the closer to the methods block
fprintf(fileId, '   end % methods');

% Write the closer to the class definition
fprintf(fileId, 'end % classdef');

fprintf(fileId, '%s', newline);

% write a template test
fprintf(fileId, '%s', '%% Template Test 1: Insert Test Name');
fprintf(fileId, '%s', newline);
fprintf(fileId, '%s', newline);

fprintf(fileId, '%s', 'inputData = 1;');
fprintf(fileId, '%s', newline);

text2write = sprintf('functionOuput = functionName(inputData);');
fprintf(fileId, '%s', text2write);
fprintf(fileId, '%s', newline);

text2write = sprintf('assert(functionOutput == criteria, ''Error message if false'');');
fprintf(fileId, '%s', text2write);
fprintf(fileId, '%s', newline);

end % function