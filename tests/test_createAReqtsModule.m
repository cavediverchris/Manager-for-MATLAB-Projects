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