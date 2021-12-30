%% Create Script
%
%   FUNCTION INPUTS
%       None
%
%   FUNCTION OUTPUTS
%       None
%
%   OTHER OUTPUTS
%       None
%
%   LINKS
%   For further information check out: <a href="matlab:web('https://github.com/cavediverchris/MATLAB-Project-Template-System-Design#create-new-model-createnewmodel')">Git documentation</a>.
%
function [] = createScriptTestHarness(th_name, scriptName)

StandardisedFileHeader(th_name);

% Create the file
fid = fopen(th_name, 'a');

% write a title;
fprintf(fid, '%% Test harness for %s', scriptName);
fprintf(fid, '%s', newline);

% write a template test
fprintf(fid, '%s', '%% Template Test 1: Insert Test Name');
fprintf(fid, '%s', newline);
fprintf(fid, '%s', newline);

fprintf(fid, '%s', 'inputData = 1;');
fprintf(fid, '%s', newline);

text2write = sprintf('functionOuput = functionName(inputData);');
fprintf(fid, '%s', text2write);
fprintf(fid, '%s', newline);

text2write = sprintf('assert(functionOutput == criteria, ''Error message if false'');');
fprintf(fid, '%s', text2write);
fprintf(fid, '%s', newline);
fclose(fid);
end

