%% Create a new Auxiliary Function
%   This function is intended to quickly set up a new function in the
%   AuxiliaryFunctions folder. The AuxiliaryFunctions folder contains
%   utility files that assist with the development job, whilst the design
%   task is store in the Models folder.
%
%   FUNCTION INPUTS
%       None
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%       A new folder with a child function file is created in the
%       AuxiliaryFunctions folder.
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/Project-Template-for-Apps/tree/standardise-file-documentation#new-files---new-auxiliary-function')">Git documentation</a>.
%
%% FUNCTION
function createNewUtilityFunction()

% Get project object
projObj = currentProject;

% Define the parent folder
auxFcnsFolder = projObj.RootFolder + "/AuxiliaryFunctions/";

% Get new function name from user
functionName = inputdlg('Please enter the name of the new function:', ...
                'Creating a new Auxiliary Function');
functionName = functionName{1};
functionName = string(functionName);
            
if contains(functionName, " ")
    % CASE: the string that the user gave has spaces
    % ACTION: Modify the first letter to be upper case
    
    capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
    componentWords = functionName.split;
    newWords = arrayfun(capitalize, componentWords);
    functionName = join(newWords, "");

end

% Create function folder
mkdir(auxFcnsFolder, functionName{1});

% Create the function script
newFunctionContainingFolder = auxFcnsFolder + "/" + functionName;
StandardisedFileHeader(functionName, newFunctionContainingFolder)


% Add the file and folder to project
addFolderIncludingChildFiles(projObj, newFunctionContainingFolder);

% Add the folder to path
addPath(projObj,  newFunctionContainingFolder);
end

