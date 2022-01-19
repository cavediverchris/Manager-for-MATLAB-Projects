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
classdef test_createAModelTestHarness < matlab.unittest.TestCase
    methods(Test)
        function confirmHarnessIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the createAFile
            % script will correctly set up a new MATLAB script
            %% Test Setup
            bdclose all;
            modelUnderTestName = "myBasicModel.slx";
            newFileName = fullfile(pwd, modelUnderTestName);
            createAModel(newFileName);
            %% Test Execution
            [testHarnessFilename] = createAModelTestHarness (newFileName);
            
            %% Test Verification
            % We want to check that:
            % - if SL Test is not available, an external test harness would
            % have been created
            % - if SL Test is available, an internal test harness would
            % have been created within the model under test
            
            
            isSlTestInstalled = license('test', 'Simulink_test');
            
            if isSlTestInstalled == false
                % CASE: SL Test isn't installed
                % ACTION: Check for an external test harness
                testExists = exist(which(testHarnessFilename), 'file');
                
                expSolution = 4;
                testCase.verifyEqual(testExists,expSolution);
            elseif isSlTestInstalled == true
                % CASE: SL Test is installed
                % ACTION: Check for internal test harness
                harnessList = sltest.harness.find(testHarnessFilename);
                
                if isempty(harnessList)
                    % CASE: Harness is empty
                    % ACTION: Report a failure because this is wrong
                    testCase.verifyEqual(true,false);
                else
                    % CASE: Model has test harnesses
                    % ACTION: Report a pass
                    testCase.verifyEqual(true,true);
                end
            end
         
            
            %% Test Teardown
            % Remove the files created from the project
            delete(testHarnessFilename);
            delete(newFileName);
        end

    end
end