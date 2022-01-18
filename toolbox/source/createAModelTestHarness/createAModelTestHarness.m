%% createAModelTestHarness
% The purpose of this file is to create a test harness that can be used to
% verify the behaviour of a model under test by wrapping it in another
% Simulink Model that will stimulate it.
%% INPUTS
% This function accepts the following inputs:
%   Input 1: <<INPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%       Other comments / information: TBD.
%
%   Input 2: <<INPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%       Other comments / information: TBD.
%
%% OUTPUTS
% This function accepts the following inputs:
%   Output 1: <<OUTPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%
%   Output 2: <<OUTPUT 1 NAME>>
%       Description: TBD.
%       Data Type: TBD.
%       Dimensions: TBD.
%       Units: TBD.
%% SUPPORT
% For further information check out: <a href="matlab:web('https://github.com/cavediverchris/')">Git documentation</a>.
% TODO: Populate any relevent external links ...
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
%% Main
function [testHarnessFilename] = createAModelTestHarness (modelUnderTest)

%% Simulink Test Available
% If Simulink Test is available then we can create "proper" test harnesses

isSlTestInstalled = license('test', 'Simulink_test');
testHarnessFilename = "";
%% Get paths and names
[modelPath, modelName, ~] = fileparts(modelUnderTest);
harnessName = modelName + "_harness";

% Recast modelName to be a character array for simulink operations later
modelName = char(modelName);

%% Build Harness
if isSlTestInstalled
    % CASE: Simulink Test is available
    % ACTION: Create a test harness using SL Test
    
    if ~bdIsLoaded(modelUnderTest)
        % CASE: model_name is not loaded
        % ACTION: load it
        load_system(modelUnderTest);
    end
    
    sltest.harness.create(modelName, ...
        'Name', harnessName, ...
        'Description', ['Test harness for ', modelName], ...
        'Source', 'Test Sequence', ...
        'SeparateAssessment', false, ...
        'SynchronizationMode', 'SyncOnOpen', ...
        'CreateWithoutCompile', true, ...
        'VerificationMode', 'Normal', ...
        'RebuildOnOpen', true, ...
        'SaveExternally', false);
else
    % CASE: Simulink Test is not available
    % ACTION: Return a warning
    warning('createAModelTestHarness:SimulinkTestNotAvailable', ...
        'Simulink Test is not available to build a test harness.');
    
    new_system(harnessName);
    
    % Add an constant block
    add_block('simulink/Sources/Constant', [gcs, '/Constant']);
    set_param([gcs, '/Constant'], 'position', [100 100 130 130]);
    
    % Add a model reference
    add_block('simulink/Ports & Subsystems/Model', [gcs, '/', modelName])
    set_param([gcs, '/', modelName], 'position', [200 75 430 150]);
    
    % Add an display
    add_block('simulink/Sinks/Display', [gcs, '/Display']);
    set_param([gcs, '/Display'], 'position', [500 100 550 130]);
    % Set the model reference to point at the previously created model
    set_param([gcs, '/', modelName], 'ModelName', fullfile(modelName));
    
    % Connect the constant to the model reference
    add_line(gcs, 'Constant/1', [modelName, '/1']);
    
    % Connect the Output of the model reference to the display
    add_line(gcs, [modelName, '/1'], 'Display/1');
    
    testHarnessFilename = fullfile(modelPath, harnessName);
    save_system(gcs, testHarnessFilename);
    close_system(gcs);
    
    % Set the model to use a configuration reference from the data
    % dictionary
    % TODO: load the data dictionary
    % TODO: set the configuration reference
end

end % function