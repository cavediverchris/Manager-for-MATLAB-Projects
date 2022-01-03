classdef test_backup < matlab.unittest.TestCase
    methods(Test)
        % What if the desintation is invalid?
        % What about if the destination already has a backup file?
        function confirmCamelCase(testCase)
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