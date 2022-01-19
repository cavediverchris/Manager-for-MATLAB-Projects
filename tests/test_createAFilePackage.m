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
classdef test_createAFilePackage < matlab.unittest.TestCase
    methods(Test)
        function confirmPackageIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the createAFile
            % script will correctly set up a new MATLAB script
            %% Test Setup
            fileName = "aBasicTest.m";
            newFileName = fullfile(pwd, fileName);
            %% Test Execution
            createAFilePackage(newFileName);
            %% Test Verification
            % We want to check that:
            % - a new M-file has been created
            % - a unit test case has been created
            
            
            fcnExists = exist(which(fileName), 'file');
            testFileName = "test_" + fileName;
            testExists = exist(which(testFileName), 'file');
            
            
            expSolution = 2;
            testCase.verifyEqual(fcnExists,expSolution);
            testCase.verifyEqual(testExists,expSolution);
            
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
            delete(which(testFileName));
            
            [containerFolder, ~, ~] = fileparts(which(fileName));
            removePath(projObj, containerFolder);
            removeFile(projObj, containerFolder);
            rmdir(containerFolder, 's');
        end

    end
end