%% Create a Simulink Test data file with unit tests
%   This function will iterate over all files in the Project and look for
%   files withe the "Classification" label of "Test". Files that have been
%   marked with the "Test" "Classification" label correlate to test
%   harnesses that have been made using the CreateNewModel utility. The  
%   identified Test Harnesses will then be added to the Test Manager in
%   order to be available for execution and management using Simulink Test
%   Manager.
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       Test File - A Test Manager file, named "TestFile.mldatx", will be
%       created at the project root if it does not already exist (and
%       updated if it does) and will contain test suites for all found test
%       harnesses within the project.
%% LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/Project-Template-for-System-Design/tree/update-documentation#automatic-population-of-test-manager-autopopulatetestmanager')">Git documentation</a>.
%% MAIN FUNCTION
function autoPopulateTestManager()

% Get a handle to the currently open project
projObj = currentProject;

% Create the test file
testFile = sltest.testmanager.TestFile(strcat(projObj.RootFolder, '\TestFile.mldatx'), true);

% Add the file to the project
addFile(projObj, testFile.FilePath);

%% Find design files, and add their test harness(es) to the test manager

% Loop over all files in the Project
for fileIdx = 1:1:length(projObj.Files)
    
    % Get the current file
    currFile = projObj.Files(fileIdx);
    
    % Get file location information
    [~,name,ext] = fileparts(currFile.Path);
    
    % Check the label
    if isempty(currFile.Labels) || currFile.Labels.Name ~= "Design"
        % CASE: The current file either has no label, or it has a label
        % that is not "Design
        % ACTION: Skip this file - it is not a design file
        continue;
    end
    
    % Check the extension
    if ~contains(ext, 'mdl') || ~contains(ext, 'slx')
        % CASE: The extension of the current file is not a Simulink model
        % ACTION: Skip this file
        continue;
    end
    
    % get the list of harness(es) for the model
    h = load_system(currFile.Path);
    harnessList = sltest.harness.find(h);
    close_system(h);
    
    if isempty(harnessList)
        % CASE: No connected Simulink Test test harnesses were found
        % ACTION: skip
        % TODO: What if there are test harnesses without using SL Test?
        continue;
    end
    
    % Create a test suite for the model
    testSuite = createTestSuite(testFile, name);
    
    % Loop over each attached test harness
    for harnessIdx = 1:1:length(harnessList)
        % Create a test case for this test harness
        testCase = createTestCase(testSuite, ...
            'baseline', ...
            harnessList(harnessIdx).description, ...
            false);
        
        % Add properties to the Test Case
        setProperty(testCase, 'Model', name);
        setProperty(testCase, 'SimulationMode', 'Normal');
        setProperty(testCase, 'HarnessOwner', name, 'HarnessName', harnessList(harnessIdx).name);
        
        % Save the test in the test file
        saveToFile(testFile);
    end
end

% Remove the default test suite
tsDel = getTestSuiteByName(testFile,'New Test Suite 1');
remove(tsDel);

% Re-save the file
saveToFile(testFile);

% Close the test file
testFile.close;

% Close the test manager
sltest.testmanager.close;
end