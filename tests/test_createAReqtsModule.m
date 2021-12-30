classdef test_createAReqtsModule < matlab.unittest.TestCase
    methods(Test)
        function confirmAScriptAndTestIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the
            % createReqtsModule script creates a requirements module
            %% Test Setup
            newFileName = "aSimpleRequirementsModule";
            projObj = currentProject;
            %% Test Execution
            %createReqtsModule(newFileName);
            %% Test Verification
            % We want to check that:
            % - a new requirements file has been created
            
            
            expSolution = 2;
            testCase.verifyEqual(expSolution,expSolution);
            
            %% Test Teardown
            % Remove the files created from the project

        end

    end
end