%% Create Dialog
%
%   FUNCTION INPUTS
%       None
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#create-new-model-createnewmodel')">Git documentation</a>.
%
function [] = createModelFunctionalTestHarness(model_name, th_name)
SLTestInstalled = license('test', 'Simulink_test');
if ~bdIsLoaded(model_name)
    % CASE: model_name is not loaded
    % ACTION: load it
    load_system(model_name);
end

if SLTestInstalled
    % CASE: Simulink Test is installed,
    % ACTION:create a test harness using the Simulink Test command
    sltest.harness.create(model_name, ...
        'Name', strcat(th_name), ...
        'Description', ['Test harness for ', model_name], ...
        'Source', 'Test Sequence', ...
        'SeparateAssessment', false, ...
        'SynchronizationMode', 'SyncOnOpen', ...
        'CreateWithoutCompile', true, ...
        'VerificationMode', 'Normal', ...
        'RebuildOnOpen', true, ...
        'SaveExternally', false);
    
    % Set the model to use the data dictionary
    set_param(gcs, 'DataDictionary', 'DataDictionary.sldd')
else
    % CASE: Simulink Test is not installed
    % ACTION: create a test harness manually
    open_system(new_system(th_name));
    
    % Set the model to use the data dictionary
    set_param(gcs, 'DataDictionary', 'DataDictionary.sldd')
    
    % Add an constant block
    add_block('simulink/Sources/Constant', [gcs, '/Constant']);
    set_param([gcs, '/Constant'], 'position', [100 100 130 130]);
    
    % Add a model reference
    add_block('simulink/Ports & Subsystems/Model', [gcs, '/', model_name])
    set_param([gcs, '/', model_name], 'position', [200 75 430 150]);
    
    % Add an display
    add_block('simulink/Sinks/Display', [gcs, '/Display']);
    set_param([gcs, '/Display'], 'position', [500 100 550 130]);
    
    save_system(gcs)
    % Set the model reference to point at the previously created model
    set_param([gcs, '/', model_name], 'ModelName', fullfile(model_name));
    
    % Connect the constant to the model reference
    add_line(gcs, 'Constant/1', [model_name, '/1']);
    
    % Connect the Output of the model reference to the display
    add_line(gcs, [model_name, '/1'], 'Display/1');
    
    % Set the configuration to use the configuration reference defined in teh
    % data dictionary
    
    % Firstly open the data dictiomary
    dataDictionaryName = 'DataDictionary.sldd';
    ddData = Simulink.data.dictionary.open(dataDictionaryName);
    
    % Then get the configuration value
    sectionObj	= getSection(ddData, 'Configurations');
    entryObj	= getEntry(sectionObj,'ConfigurationReference');
    FixedStepConfiguration  = getValue(entryObj);
    
    attachConfigSet(gcs, FixedStepConfiguration);
    setActiveConfigSet(gcs, 'ConfigurationReference');
    
    save_system(gcs)
    close_system(th_name);
end