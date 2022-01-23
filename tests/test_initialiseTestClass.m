%% Unit Test Case
% The purpose of this file is to use the MATLAB Unit Testing framework in
% order to automate the testing of the function under test.
%% SUPPORT
% This test script has been built using the MATLAB Unit Testing framework,
% you can get further information on this from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/matlab-unit-test-framework.html')">support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN
classdef test_initialiseTestClass < matlab.unittest.TestCase
    methods(Test) 
       function testAbleToInitialiseFile(testCase)
           %% Description
           % The purpose of this test is to ensure that we can create a
           % MATLAB unit test case file
           %% Setup
           newFilename = "myTest";
           fullFilename = fullfile(pwd, newFilename + ".m");
           
           % First create an M-file with header
           createAFile(fullFilename);
           
           % Extend the test case with some boiler plate material to get the user
           % started with unit test cases
           fileId = fopen(fullFilename, 'a');
           
           %% Exercise
           initialiseTestClass(fileId);
           %% Verify
           testCase.verifyEqual(exist(newFilename, 'class'), 8);
           %% Teardown
           fclose(fileId);
           delete(which(fullFilename), 's');
       end
    end % methods (Test)
end