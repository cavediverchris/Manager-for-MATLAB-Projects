%% createAModel
% The purpose of this file is to set up a basic model for the user with the
% appropriate naming convention
%% INPUTS
% This function accepts the following inputs:
%   Input 1: fileTitle
%       Description: This is the name of the file that you wish to create.
%       If this is also a path, then the file will be created at the
%       defined location. If this input is just a name, then the file will
%       be created at the present working directory.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%       Other comments / information: It can be a path to a specific
%       directory, or  simply a name
%% SUPPORT
% This script operates on the currently running MATLAB Project. You can
% learn more about MATLAB Projects from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/projects.html')">MATLAB Projects support page.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.
%% MAIN
function [] = createAModel(modelName)


%% Create basic model
load_system(new_system(modelName));

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

%% Set the Data Dictionary

% % Set the model to use the data dictionary
% set_param(gcs, 'DataDictionary', 'DataDictionary.sldd')
% 
% % Firstly open the data dictiomary
% dataDictionaryName = 'DataDictionary.sldd';
% ddData = Simulink.data.dictionary.open(dataDictionaryName);
% 
% % Then get the configuration value
% sectionObj	= getSection(ddData, 'Configurations');
% entryObj	= getEntry(sectionObj,'ConfigurationReference');
% FixedStepConfiguration  = getValue(entryObj);
% 
% attachConfigSet(gcs, FixedStepConfiguration);
% setActiveConfigSet(gcs, 'ConfigurationReference');

%% Close Down
% save current model
save_system(gcs)
close_system(modelName);
end