%% Create Custom Model Advisor Check
%   The purpose of this script is to semi-automate the process for creating
%   a new customised Model Advisor Check because the intial construction of
%   files and functions is very repetitive.
%% FUNCTION INPUTS
%       None
%% FUNCTION OUTPUTS
%       None
%% OTHER OUTPUTS
%       Three files will be created and one modified through the succesful
%       completion of this utility.
%       
%       1 - A check definition file, named with with the following structure:
%       checkDefinition_YourName will be created and populated with the
%       basic content in the ./AuxiliaryFunctions/sl_customization/ folder.
%       The purpose of this file is to define the check properties that
%       will appear in the Model Advisor window.
%       
%       2 - A check file, named with with the following structure:
%       check_YourName will be created and populated with the
%       basic content in the ./AuxiliaryFunctions/sl_customization/ folder.
%       The purpose of this file is to define the logic of the check.
%       
%       3 - An action file, named with with the following structure:
%       action_YourName will be created and populated with the
%       basic content in the ./AuxiliaryFunctions/sl_customization/ folder.
%       The purpose of this file is to define the corrective action that
%       would be required to ensure that the check would pass.
%
%       The sl_customization.m file will be appended with a call to the
%       check definition file for the custom check that is being defined
%       through the use of this utility.
%% LINKS
%   For further information check out: <a href="matlab:web(https://github.com/cavediverchris/Project-Template-for-System-Design/tree/update-documentation#create-a-new-custom-model-advisor-check-createcustommodeladvisorcheck')">Git documentation</a>.
%% Prepare

close all
clear all
%% Find the sl_customization folder
projObj = currentProject;

% Given that the sl_customization folder is higher up the folder structure
% and list of projObj.Files - the first "file" we come across that contains
% sl_customization will be the folder.

idx = 0;
found = false;

while found == false
   idx = idx + 1;
   currFile = projObj.Files(idx).Path;
   if contains(currFile, "sl_customization")
       % CASE: The current file in the projObj.Files list contains
       % sl_customization in the name
       % ACTION: set found = true
       found = true;
   end
end

customChecksFolder = currFile;

% Clear out un-needed variables
clear idx found currFile

%% Get the check name from the user
% Need the user to tell us the name of the check

checkName = inputdlg("Please enter a short name for the custom check","Define custom check");
checkName = checkName{1};
checkName = string(checkName);

if contains(checkName, " ")
    % CASE: the string that the user gave has spaces
    % ACTION: Modify the first letter to be upper case
    
    capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
    componentWords = checkName.split;
    newWords = arrayfun(capitalize, componentWords);
    checkName = join(newWords, "");

end

%% Create the checkDefinition function

checkDefFileName = sprintf('checkDefinition_%s', checkName);
StandardisedFileHeader(checkDefFileName, customChecksFolder)

checkDefPath = customChecksFolder + "\" + checkDefFileName + ".m";

fileID = fopen(checkDefPath, 'a');
fprintf(fileID, '%%%% CHECK DEFINITION\n');
fprintf(fileID, 'function %s\n', checkDefFileName);
fprintf(fileID, 'mdladvRoot = ModelAdvisor.Root;\n');
fprintf(fileID, '\n');
fprintf(fileID, '% Create ModelAdvisor.Check object and set properties.\n');
fprintf(fileID, "rec = ModelAdvisor.Check('com.ARC.sample.%s');\n", checkName);
fprintf(fileID, "rec.Title = 'TO BE POPULATED MANUALLY';\n");
fprintf(fileID, "rec.TitleTips = 'TO BE POPULATED MANUALLY';\n");
fprintf(fileID, "rec.setCallbackFcn(@check_%s,'None','DetailStyle');\n", checkName);
fprintf(fileID, "% Create ModelAdvisor.Action object for setting fix operation.\n");
fprintf(fileID, "myAction = ModelAdvisor.Action;\n");
fprintf(fileID, "myAction.Name='TO BE POPULATED MANUALLY';\n");
fprintf(fileID, "myAction.Description='TO BE POPULATED MANUALLY';\n");
fprintf(fileID, "rec.setAction(myAction);\n");
fprintf(fileID, "myAction.setCallbackFcn(@action_%s);\n", checkName);
fprintf(fileID, "mdladvRoot.publish(rec, 'ARC'); % publish check into ARC group.\n");
fprintf(fileID, '\n');
fprintf(fileID, 'end');

fclose(fileID);

% Add the checkDefinition file to the project
addFile(projObj, checkDefPath);
%% Create the check function

checkFcnName = sprintf('check_%s.m', checkName);
StandardisedFileHeader(checkFcnName, customChecksFolder)

checkFcnPath = customChecksFolder + "\" + checkFcnName;
fileID = fopen(checkFcnPath, 'a');

fprintf(fileID, "%%%% CHECK FUNCTION\n");
fprintf(fileID, 'function check_%s\n', checkName);
fprintf(fileID, "%%%% INSERT YOUR CODE TO FIND THE BLOCKS THAT DON'T MEET THE CHECK\n");
fprintf(fileID, "%EXAMPLE: \n");
fprintf(fileID, "violationBlks = find_system(system, 'Type','block');\n");

fprintf(fileID, "if isempty(violationBlks)\n");
fprintf(fileID, "    ElementResults = ModelAdvisor.ResultDetail;\n");
fprintf(fileID, "    ElementResults.IsInformer = true;\n");
fprintf(fileID, "    ElementResults.Description = 'Identify blocks where the name is not displayed below the block.';\n");
fprintf(fileID, "    ElementResults.Status = 'All blocks have names displayed below the block.';\n");
fprintf(fileID, "    mdladvObj.setCheckResultStatus(true);\n");
fprintf(fileID, "else\n");
fprintf(fileID, "    ElementResults(1,numel(violationBlks))=ModelAdvisor.ResultDetail;\n");
fprintf(fileID, "    for i=1:numel(ElementResults)\n");
fprintf(fileID, "        ElementResults(i).setData(violationBlks{i});\n");
fprintf(fileID, "        ElementResults(i).Description = 'Identify blocks where the name is not displayed below the block.';\n");
fprintf(fileID, "        ElementResults(i).Status = 'The following blocks have names that do not display below the blocks:';\n");
fprintf(fileID, "        ElementResults(i).RecAction =  'Change the location such that the block name is below the block.';\n");
fprintf(fileID, "    end\n");
fprintf(fileID, "mdladvObj.setCheckResultStatus(false);\n");
fprintf(fileID, "mdladvObj.setActionEnable(true);\n");
fprintf(fileID, "end\n");
fprintf(fileID, "%%%% Save Results\n");
fprintf(fileID, "CheckObj.setResultDetails(ElementResults);\n");
fprintf(fileID, "end\n");
fclose(fileID);

% Add the check file to the project
addFile(projObj, checkFcnPath);
%% Create the action function

actionName = sprintf('action_%s.m', checkName);
StandardisedFileHeader(actionName, customChecksFolder)

actionFcnPath = customChecksFolder + "\" + actionName;
fileID = fopen(actionFcnPath, 'a');

fprintf(fileID, "%%%% ACTION FUNCTION\n");
fprintf(fileID, 'function result = action_%s(taskobj)\n', checkName);
fprintf(fileID, 'mdladvObj = taskobj.MAObj;\n');
fprintf(fileID, 'checkObj = taskobj.Check;\n');
fprintf(fileID, 'resultDetailObjs = checkObj.ResultDetails;\n');
fprintf(fileID, '% Create ModelAdvisor.Check object and set properties.\n');
fprintf(fileID, "%%%% INSERT FIX CODE HERE");
fprintf(fileID, "\n");
fprintf(fileID, "for i=1:numel(resultDetailObjs)\n");
fprintf(fileID, "    % take some action for each of them\n");
fprintf(fileID, "    block=Simulink.ID.getHandle(resultDetailObjs(i).Data);\n");
fprintf(fileID, "    set_param(block,'NamePlacement','normal');\n");
fprintf(fileID, "end\n");
fprintf(fileID, "%%%% Results");
fprintf(fileID, "\n");
fprintf(fileID, "\n");
fprintf(fileID, "result = ModelAdvisor.Text('TO BE POPULATED MANUALLY.');\n");
fprintf(fileID, "mdladvObj.setActionEnable(false);\n");
fprintf(fileID, "end");

fclose(fileID);

% Add the action file to the project
addFile(projObj, actionFcnPath);
%% Update sl_customization.m to include new check

% Find the sl_customization.m file

customizationFile = projObj.findFile("/AuxiliaryFunctions/sl_customization.m");

fileID = fopen(customizationFile.Path, 'r+');

% Move pointer to the end of file, but back 3 characters to be before the
% "end" statement. 
% NOTE: Letters are stored as a character type in a text file. A character
% type requires two bytes of storage each. As a result, we need to rewind 
% 3 characters x 2 bytes per character = 6 bytes

fseek(fileID, -6, 'eof');
fprintf(fileID, '\n');
fprintf(fileID, "%% Register custom check: %s\n", checkName);
fprintf(fileID, "cm.addModelAdvisorCheckFcn(@checkDefinition_%s);\n", checkName);
fprintf(fileID, 'end');

fclose(fileID);