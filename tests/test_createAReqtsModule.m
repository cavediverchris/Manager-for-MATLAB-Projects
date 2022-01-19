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
        function TestForWhenThereIsNoLicence(testCase)
            %% Description
            % This test is designed to confirm that an
            % error is returned in the event that the target computer is
            % unable to create a requirements module because Simulink
            % Requirements is not available.
            %% Test Setup
            newFileName = "aSimpleRequirementsModule";
            %projObj = currentProject;
            %% Test Execution
            [result, ~] = createReqtsModule(newFileName);
            %% Test Verification
            % We want to check that an error is returned
            if result == 0
                % CASE: The target machine does not have a licence
                % ACTION: Verify the error
                expSolution = "createReqtsModule:noRequirementsLicence";
                testCase.verifyWarning(@() createReqtsModule(newFileName),expSolution);
            elseif result == 1
                % CASE: The target machine does have a licence
                % ACTION: Do nothing because this test is not applicable
                testCase.verifyEqual(true, true);
            end
            
            %% Test Teardown
        end

        function confirmReqtsModuleCreated(testCase)
            %% Description
            % This test is designed to confirm that a requirements module
            % is created when a licence is available
            %% Test Setup
            newFileName = "aSimpleRequirementsModule";
            %projObj = currentProject;
            %% Test Execution
            [result, ~] = createReqtsModule(newFileName);
            %% Test Verification
            % We want to check that an error is returned
            if result == 0
                % CASE: The target machine does not have a licence
                % ACTION: Do nothing because this test is not applicable
            elseif result == 1
                % CASE: The target machine does have a licence
                % ACTION: Check that a requirements file is made
                expSolution = 2;
                
                reqtsExist = exist(which(newFileName), 'file');
                testCase.verifyEqual(reqtsExist,expSolution);
            end
            
            %% Test Teardown
            if result == 1
                % CASE: The target machine has a requirements licence
                % ACTION: delete the requirements module
                delete(which(newFileName));
            end

        end

    end
end