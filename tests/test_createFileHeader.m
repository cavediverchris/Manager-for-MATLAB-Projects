classdef test_createFileHeader < matlab.unittest.TestCase
    methods(Test) 
       function testAbleToInitialiseFile(testCase)
           %% Description
           % The purpose of this test is to ensure that the overall utility
           % responds appropriately if there are fopen issues.
           %% Setup
           newFilename = "test.m";
           fullFilename = fullfile(pwd, newFilename);
           %% Exercise
           createFileHeader(fullFilename);
           %% Verify
           testCase.verifyEqual(exist(fullFilename, 'file'), 2)
           %% Teardown
           delete(fullFilename);
           
       end
    end % methods (Test)
end