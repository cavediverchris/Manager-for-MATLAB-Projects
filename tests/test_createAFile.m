classdef test_createAFile < matlab.unittest.TestCase
    methods(Test)
        function confirmAScriptAndTestIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the createAFile
            % script will correctly set up a new MATLAB script and a unit
            % test case
            %% Test Setup
            newFileName = "aBasicTest";
            projObj = currentProject;
            %% Test Execution
            createAFile(newFileName);
            %% Test Verification
            % We want to check that:
            % - a new M-file has been created
            % - a test class has been created
            fcnExists = exist(which(newFileName), 'file');
            testExists = exist(which("test_" + newFileName), 'file');
            
            
            expSolution = 2;
            testCase.verifyEqual(fcnExists,expSolution);
            testCase.verifyEqual(testExists,expSolution);
            
            %% Test Teardown
            % Remove the files created from the project
            removeFile(projObj, which(newFileName));
            removePath(projObj, fullfile(projObj.RootFolder, newFileName) );
            removeFile(projObj, fullfile(projObj.RootFolder, newFileName) );
            
            removeFile(projObj, which("test_" + newFileName));
        end

    end
end