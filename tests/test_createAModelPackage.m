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
classdef test_createAModelPackage < matlab.unittest.TestCase
    methods(Test)
        function confirmPackageIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the createAFile
            % script will correctly set up a new MATLAB script
            %% Test Setup
            fileName = "aBasicModel";
            newFileName = fullfile(pwd, fileName);
            bdclose all;
            clc;
            %% Test Execution
            createAModelPackage(newFileName);
            %% Test Verification
            % We want to check that:
            % - a new model has been created
            % - a unit test case has been created
            containingFolder = fullfile(pwd, fileName);
            modelName = fullfile(containingFolder, fileName + ".slx");
            modelExists = exist(which(modelName), 'file');
            
            isSlTestInstalled = license('test', 'Simulink_test');
            if isSlTestInstalled
                % CASE: Simulink Test is installed, the test harness will
                % be internal
                % ACTION: Check for the presence of internal test harnesses
                % TODO
                harnessList = sltest.harness.find(modelName);
                if isempty(harnessList)
                    % CASE: No harnesses are connected
                    % ACTION: This is a failure
                    testCase.verifyEqual(1,2);
                else
                    % CASE: Test harness is present
                    % ACTION: Report a pass
                    testCase.verifyEqual(true, true);
                end
            elseif isSlTestInstalled == false
                testFileName = fullfile(containingFolder, fileName + "_harness.slx");
                testExists = exist(which(testFileName), 'file');
                testCase.verifyEqual(testExists,4);
            end
            
            isSlReqtsInstalled = license('test','slvnv');
            
            if isSlReqtsInstalled
                % CASE: SL Reqts is installed, so a reqts file would have
                % been made
                % ACTION: check for it
            
                reqtsFileName = "reqts_" + fileName + ".slreqx";
                reqtsExists = exist(which(reqtsFileName), 'file');
                testCase.verifyEqual(reqtsExists, 2);
            end
            
            expSolution = 4;
            testCase.verifyEqual(modelExists,expSolution);
            
            
            % Check that the files have the correct label
            projObj = currentProject;
            fcnFileObj = findFile(projObj, which(fileName));
            labels = fcnFileObj.findLabel("Classification", "Design");
            testCase.verifyNotEmpty(labels);
            
            testFileObj = findFile(projObj, which(testFileName));
            labels = testFileObj.findLabel("Classification", "Test");
            testCase.verifyNotEmpty(labels);
            
            %% Test Teardown
            % Remove the files created from the project
            
            removeFile(projObj, which(fileName));
            removeFile(projObj, which(testFileName));
            
            [containerFolder, ~, ~] = fileparts(which(fileName));
            removePath(projObj, containerFolder);
            removeFile(projObj, containerFolder);
            if isSlReqtsInstalled
                % CASE: SL Reqts is installed, requirements module to be
                % removed
                % ACTION: Remove it from project and delete
                %reqtsFile = findFile(projObj, reqtsFileName);
                removeFile(projObj, which(reqtsFileName));
                delete(which(reqtsFileName));
            end
            rmdir(containerFolder, 's');
        end

    end
end