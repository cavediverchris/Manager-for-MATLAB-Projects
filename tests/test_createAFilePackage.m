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
            
            testFileName = "test_" + fileName;
            newTestFileName = fullfile(pwd, testFileName);
            fcnExists = exist(which(newFileName), 'file');
            testExists = exist(which(newTestFileName), 'file');
            
            
            expSolution = 2;
            testCase.verifyEqual(fcnExists,expSolution);
            testCase.verifyEqual(testExists,expSolution);
            
            %% Test Teardown
            % Remove the files created from the project
            projObj = currentProject;
            removeFile(projObj, which(fileName));
            removeFile(projObj, which(testFileName));
            removePath(projObj, which(newFileName));
        end

    end
end