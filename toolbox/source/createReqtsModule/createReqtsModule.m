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

myReqSet = slreq.new(reqtsFile);

myReqSet.Description = "This requirements file contains the requirements for ...";

% Add headings as per DEF-STAN TBD to the reqset

add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');
add(myReqSet, 'Summary', 'Heading 1');

% Close the requirements file
myReqSet.save;
myReqSet.close;
end

