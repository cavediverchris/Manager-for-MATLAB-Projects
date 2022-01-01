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