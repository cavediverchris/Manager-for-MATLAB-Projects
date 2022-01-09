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


function [] = createReqtsModule(reqtsFile)
%% Check for Simulink Requirements Licence
feature = "requirements";
status = license('test',feature);

if status == 0
   % CASE: A Simulink Requirements licence is not present
   % ACTION: Return an error
   warning("createReqtsModule:noRequirementsLicence", "A Simulink Requirements licence is required. No requirements module will be created.");
   return;
end

%% Create Requirements File
myReqSet = slreq.new(reqtsFile);

myReqSet.Description = "This requirements file contains the requirements for ...";

% Add headings as per MIL-HDBK-520A to the reqset

add(myReqSet, 'Summary', 'Required states and modes');
add(myReqSet, 'Summary', 'System capability requirements');
add(myReqSet, 'Summary', 'External interface requirements');
add(myReqSet, 'Summary', 'Internal interface requirements');
add(myReqSet, 'Summary', 'Internal data requirements');
add(myReqSet, 'Summary', 'Adaptation requirements');
add(myReqSet, 'Summary', 'Environmental, Safety and Operational Health requirements');
add(myReqSet, 'Summary', 'Security and privacy requirements');
compReqt = add(myReqSet, 'Summary', 'Computer resource requirements');
add(compReqt, 'Summary', 'Computer hardware requirements');
add(compReqt, 'Summary', 'Computer hardware resource utilisation requirements');
add(compReqt, 'Summary', 'Computer software requirements');
add(compReqt, 'Summary', 'Computer communication requirements');
add(myReqSet, 'Summary', 'System quality factors');
add(myReqSet, 'Summary', 'Design and construction constraints');
add(myReqSet, 'Summary', 'Personnel related requirements');
add(myReqSet, 'Summary', 'Training related requirements');
add(myReqSet, 'Summary', 'Logistics related requirements');
add(myReqSet, 'Summary', 'Other requirements');
add(myReqSet, 'Summary', 'Packaging requirements');
add(myReqSet, 'Summary', 'Statutory, regulatory and certification requirements');
add(myReqSet, 'Summary', 'Demilitarisation and disposal');

% Close the requirements file
myReqSet.save;
myReqSet.close;
end

