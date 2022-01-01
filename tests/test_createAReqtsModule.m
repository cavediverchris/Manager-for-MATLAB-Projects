classdef test_createAReqtsModule < matlab.unittest.TestCase
    methods(Test)
        function tempTestForWhenThereIsNoLicence(testCase)
            %% Description
            % This test is temporary and is designed to confirm that an
            % error is returned in the event that the target computer is
            % unable to create a requirements module because Simulink
            % Requirements is not available.
            %% Test Setup
            newFileName = "aSimpleRequirementsModule";
            %projObj = currentProject;
            %% Test Execution
            
            %% Test Verification
            % We want to check that an error is returned

            expSolution = "createReqtsModule:noRequirementsLicence";
            testCase.verifyError(@() createReqtsModule(newFileName),expSolution);
            
            %% Test Teardown


        end
        
%         function confirmAScriptAndTestIsMade(testCase)
%             %% Description
%             % The purpose of this test is to ensure that the
%             % createReqtsModule script creates a requirements module
%             %% Test Setup
%             newFileName = "aSimpleRequirementsModule";
%             projObj = currentProject;
%             %% Test Execution
%             createReqtsModule(newFileName);
%             %% Test Verification
%             % We want to check that:
%             % - a new requirements file has been created
%             
%             
%             expSolution = 2;
%             testCase.verifyEqual(expSolution,expSolution);
%             
%             %% Test Teardown
%             % Remove the files created from the project
% 
%         end

    end
end