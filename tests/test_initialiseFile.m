classdef test_initialiseFile < matlab.unittest.TestCase
    methods(Test) 
       function testAbleToInitialiseFile(testCase)
           %% Description
           % The purpose of this test is to ensure that the overall utility
           % responds appropriately if there are fopen issues.
           %% Setup
           newFilename = "test";
           fullFilename = fullfile(pwd, newFilename);
           %% Exercise
           [fileID] = initialiseFile(fullFilename);
           %% Verify
           testCase.verifyEqual(exist(fullFilename, 'file'), 2)
           %% Teardown
           fclose(fileID);
           delete(fullFilename);
       end
    end % methods (Test)
end