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
classdef test_createAModel < matlab.unittest.TestCase
    methods(Test)
        function confirmAModelIsMade(testCase)
            %% Description
            % The purpose of this test is to ensure that the createAFile
            % script will correctly set up a new MATLAB script
            %% Test Setup
            newFileName = "aBasicTest";
            newFileName = fullfile(pwd, newFileName);
            bdclose all
            %% Test Execution
            createAModel(newFileName);
            %% Test Verification
            % We want to check that:
            % - a new M-file has been created
            modelExists = exist(which(newFileName), 'file');
            
            
            expSolution = 4;
            testCase.verifyEqual(modelExists,expSolution);
            
            %% Test Teardown
            % Remove the files created from the project
            delete(which(newFileName));
        end

    end
end