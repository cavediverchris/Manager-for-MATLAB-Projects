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
fprintf(fileId, '%s\n', '   methods(Test)');

% Write the first test case function declaration
fprintf(fileId, '%s\n',  '       function templateTest(testCase)');

% Write the test description
fprintf(fileId, '%s\n',  '       	%% Description');
fprintf(fileId, '%s\n',  '       	% The purpose of this test is to ...');

% Write the test setup
fprintf(fileId, '%s\n',  '       	%% Test Setup');
fprintf(fileId, '%s\n',  '       	% In this section, we conduct any set up that we need for the test to work');
fprintf(fileId, '%s\n',  '       	m = 2;');
fprintf(fileId, '%s\n',  '       	x = 1;');
fprintf(fileId, '%s\n',  '       	c = 5;');

% Write the test execution
fprintf(fileId, '%s\n',  '       	%% Text Execution');
fprintf(fileId, '%s\n',  '       	% In this section we run the test.');
fprintf(fileId, '%s\n',  '       	y = m*x + c;');

% Write the test verification
fprintf(fileId, '%s\n',  '       	%% Text Verification');
fprintf(fileId, '%s\n',  '       	% In this section we write the code to confirm that the test was ran succesfully.');
fprintf(fileId, '%s\n',  '       	testCase.verifyEqual(y, 7);');

% Write the test teardown
fprintf(fileId, '%s\n',  '       	%% Text Teardown');
fprintf(fileId, '%s\n',  '       	% In this section we run any code as par of a teardown after completing the test.');

% write the closer to the first test case
fprintf(fileId, '%s\n',  '       end % templateTest(testCase)');

% Write the closer to the methods block
fprintf(fileId, '%s\n',  '   end % methods');

% Write the closer to the class definition
fprintf(fileId, '%s\n',  'end % classdef');


end % function