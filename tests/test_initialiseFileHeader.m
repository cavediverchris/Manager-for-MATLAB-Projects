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