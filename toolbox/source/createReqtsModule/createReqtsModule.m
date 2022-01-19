%% Create Requirements Module
% The purpose of this function is to initialise a (Simulink) requirements
% module with a standard structure as a starter for further requirements
% management work.
%% INPUTS
% This function accepts the following inputs:
%
% INPUT 1: TBD
%   Description: TBD
%   Data Type: TBD
%   Dimensions: TBD
%   Units: TBD
%
% INPUT 2: TBD
%   Description: TBD
%   Data Type: TBD
%   Dimensions: TBD
%   Units: TBD
%% OUTPUTS
% This function produces the following outputs:
%
% OUTPUT 1: TBD
%   Description: TBD
%   Data Type: TBD
%   Dimensions: TBD
%   Units: TBD
%
% OUTPUT 2: TBD
%   Description: TBD
%   Data Type: TBD
%   Dimensions: TBD
%   Units: TBD
%% SUPPORT
% For further support on how this function works, or with suggestions for
% improvements ...


function [result, comment] = createReqtsModule(reqtsFile)
%% Check for Simulink Requirements Licence
status = license('test','slvnv');

if status == 0
   % CASE: A Simulink Requirements licence is not present
   % ACTION: Return an error
   warning("createReqtsModule:noRequirementsLicence", "A Simulink Requirements licence is required. No requirements module will be created.");
   result = 0;
   comment = "No SL Requirements Licence";
   return;
end

%% Create Requirements File
myReqSet = slreq.new(reqtsFile);

myReqSet.Description = "This requirements file contains the requirements for ...";

% Add headings as per MIL-HDBK-520A to the reqset

reqObj = add(myReqSet, 'Summary', 'Required states and modes');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'System capability requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'External interface requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Internal interface requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Internal data requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Adaptation requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Environmental, Safety and Operational Health requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Security and privacy requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

compReqt = add(myReqSet, 'Summary', 'Computer resource requirements');
compReqt.Type = 'Container';
compReqt.Description = 'TBD';

reqObj = add(compReqt, 'Summary', 'Computer hardware requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(compReqt, 'Summary', 'Computer hardware resource utilisation requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(compReqt, 'Summary', 'Computer software requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(compReqt, 'Summary', 'Computer communication requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'System quality factors', 'Type');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Design and construction constraints');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Personnel related requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Training related requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Logistics related requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Other requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Packaging requirements');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Statutory, regulatory and certification requirements', 'Type', 'Container', 'Description', 'TBD');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';

reqObj = add(myReqSet, 'Summary', 'Demilitarisation and disposal', 'Type', 'Container', 'Description', 'TBD');
reqObj.Type = 'Container';
reqObj.Description = 'TBD';


% Close the requirements file
myReqSet.save;
myReqSet.close;

% Set outputs
result = 1;
comment = "success";
end

