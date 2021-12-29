%% Create Model
%       This function will programmatically create a basic Simulink model.
%
%   FUNCTION INPUTS
%       INPUT 1: model_name
%           Dimensions and type: TBD
%           Description: TBD
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%       OTHER OUTPUT 1: A new Simulink model will be created called
%       model_name.
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#create-new-model-createnewmodel')">Git documentation</a>.
%
function [] = createModel(model_name)
open_system(new_system(model_name));

% Add an inport
add_block('simulink/Sources/In1', [gcs, '/Inport']);
set_param([gcs, '/Inport'], 'position', [100 100 130 114]);

% Add a unity gain block
add_block('simulink/Math Operations/Gain', [gcs, '/UnityGain']);
set_param([gcs, '/UnityGain'], 'position', [200 100 230 130]);

% Add an outport
add_block('simulink/Sinks/Out1', [gcs, '/Outport']);
set_param([gcs, '/Outport'], 'position', [300 100 330 114]);

% save current model
save_system(gcs)

% Connect the inport to the gain block
add_line(gcs, 'Inport/1', 'UnityGain/1');

% Connect the gain block to the outport
add_line(gcs, 'UnityGain/1', 'Outport/1');

% Add a Model Doc Block
add_block('simulink/Model-Wide Utilities/DocBlock', [gcs, '/ModelDocBlock']);
set_param([gcs, '/ModelDocBlock'], 'position', [350 50 400 100]);

%% Set Data Dictionary
% Set the configuration to use the configuration reference defined in teh
% data dictionary

% Set the model to use the data dictionary
set_param(gcs, 'DataDictionary', 'DataDictionary.sldd')

% Firstly open the data dictiomary
dataDictionaryName = 'DataDictionary.sldd';
ddData = Simulink.data.dictionary.open(dataDictionaryName);

% Then get the configuration value
sectionObj	= getSection(ddData, 'Configurations');
entryObj	= getEntry(sectionObj,'ConfigurationReference');
FixedStepConfiguration  = getValue(entryObj);

attachConfigSet(gcs, FixedStepConfiguration);
setActiveConfigSet(gcs, 'ConfigurationReference');

% save current model
save_system(gcs)
close_system(model_name);
end

