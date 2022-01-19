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
classdef test_buildToolbox < matlab.unittest.TestCase
    methods(Test)
        function confirmBuildToolbox(testCase)
            %% Description
            % The purpose of this test is to ensure that the build toolbox
            % script generates a MATLAB Toolbox file
            %% Test Setup
            

            %% Test Execution
            buildToolbox;
             % TODO: Investigate why GitHub runner is unable to clone a
            % repo.
            %% Test Verification
            % We want to check that the output from convertSentenceCase
            % function is as expected

            tbxName = "Manager for MATLAB Projects" + ".mltbx";
            result = exist(which(tbxName), 'file');
            
            expSolution = 2;
            testCase.verifyEqual(result,expSolution);
            
            %% Test Teardown
            delete(which(tbxName));

        end
    
        
    end
end