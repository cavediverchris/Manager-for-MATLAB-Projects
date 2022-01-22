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
classdef test_backup < matlab.unittest.TestCase
    methods(Test)
        % What if the desintation is invalid?
        % What about if the destination already has a backup file?
        function confirmBackUp(testCase)
            %% Description
            % The purpose of this test is to ensure that the backup
            % function creates a backup when the destination is valid
            %% Test Setup
            
            projObj = currentProject;
            
            
            % Check the operating system
            if isunix
                % CASE: Running on linux
                % ACTION: Set the seperator appropriately
                sep = '/';
            elseif ispc
                % CASE: Running on windows
                % ACTION: Set the seperator appropriately
                sep = '\';
            else
                disp('Platform not supported')
            end
            
            % Get parent directory
            parts = strsplit(projObj.RootFolder, sep);
            destination = strjoin(parts(1:end-1), sep);
            destination = fullfile(destination, "backupsFolder");
            
            % A backup file would have been made when the project loads, so
            % let us delete it first
            rmdir(destination, 's')
            mkdir(destination);
            %% Test Execution
            backup(destination);
            %% Test Verification
            % We want to check that the directory contains a backup, if it
            % does, there will be three entries in dirContents
            
            dirContents = dir(destination);

            expSolution = 3;
            testCase.verifyEqual(length(dirContents),expSolution);
            
            %% Test Teardown
            status = rmdir(destination, 's');
            
            % Then verify that the directory was actually deleted
            testCase.verifyEqual(status, true);
        end
    
        
    end
end