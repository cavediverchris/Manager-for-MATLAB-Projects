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
classdef test_convertSentenceCase < matlab.unittest.TestCase
    methods(Test)
        function confirmCamelCase(testCase)
            %% Description
            % The purpose of this test is to ensure that the script
            % properly converts a sentence into camel case
            %% Test Setup
            unformattedSentence = "my first file";

            %% Test Execution
            formattedSentence = convertSentenceCase(unformattedSentence, 'camel-case');
            %% Test Verification
            % We want to check that the output from convertSentenceCase
            % function is as expected

            expSolution = "myFirstFile";
            testCase.verifyEqual(formattedSentence,expSolution);
            
            %% Test Teardown

        end
    
        function confirmNoSentence(testCase)
            %% Description
            % The purpose of this test is to ensure that the script
            % doesn't change the input when a single word / sentence is
            % provided
            %% Test Setup
            unformattedSentence = "my";

            %% Test Execution
            formattedSentence = convertSentenceCase(unformattedSentence, 'camel-case');
            %% Test Verification
            % We want to check that the output from convertSentenceCase
            % function is as expected

            expSolution = "my";
            testCase.verifyEqual(formattedSentence,expSolution);
            
            %% Test Teardown

        end
    end
end