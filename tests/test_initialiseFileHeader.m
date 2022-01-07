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
classdef test_initialiseFileHeader < matlab.unittest.TestCase
    methods(Test) 
       function testAbleToInitialiseFile(testCase)
           %% Description
           % The purpose of this test is to ensure that the a file can be
           % initialised.
           %% Setup
           newFilename = "test";
           fullFilename = fullfile(pwd, newFilename);
           [fileID] = initialiseFile(fullFilename);
           %% Exercise
           initialiseFileHeader(fileID);
           %% Verify
           testCase.verifyEqual(exist(fullFilename, 'file'), 2)
           %% Teardown
           fclose(fileID);
           delete(fullFilename + ".m");
       end
    end % methods (Test)
end