%% Convert Sentence Case
% The purpose of this file is to take an input string that is a sentence
% (i.e. a series of words with spaces between them) and to then convert
% that sentence into a single "word" where the case convention is as
% specified by the user.
%
% This utility currently supports the following case conversions:
%
% - Camel Case (the first word is all lower case, all subsequent words have the first letter capitalised)
%
%% INPUTS
% This function accepts the following inputs:
%   Input 1: inputString
%       Description: This input is the string that contains the sentence
%       that is to be modified based upon the case convention specified by
%       the second input.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%
%   Input 2: sentenceCase
%       Description: This input specifies the case that the user wishes to
%       have the sentence converted based upon.
%       Data Type: String.
%       Dimensions: 1x1.
%       Units: N/A.
%
%% OUTPUTS
% This function accepts the following inputs:
%   Output 1: formattedSentence
%       Description: This output is a string based upon the input defined
%       by inputString after being converted based upon the convention
%       defined in sentenceCase.
%       Data Type: string.
%       Dimensions: 1x1.
%       Units: N/A.
%
%% SUPPORT
% This function works based upon the string data type. You can learn more
% about Strings from the <a href="matlab:web('https://uk.mathworks.com/help/matlab/ref/string.html?s_tid=doc_ta')">documentation.</a>.
% 
% You can also report bugs or suggestions for improvements in the "issues"
% section of <a href="matlab:web('https://github.com/cavediverchris/Manager-for-MATLAB-Projects/issues')">Github.</a>.

%% MAIN
function [formattedSentence] = convertSentenceCase(inputString,sentenceCase)
sentenceCase = char(sentenceCase);


switch sentenceCase
    case char("camel-case")
        if contains(inputString, " ")
            % CASE: the string that the user gave has spaces
            % ACTION: Modify the first letter to be upper case
            
            capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
            componentWords = inputString.split;
            newWords = arrayfun(capitalize, componentWords(2:end));
            formattedSentence = componentWords(1) + join(newWords, "");
        else
            % CASE: There are no spaces in the input string, therefore we
            % are assuming that it is not a sentence
            % ACTION: Set the formattedSentence output to be the
            % inputString
            formattedSentence = inputString;
        end
    otherwise
        error("convertSentenceCase:unrecognisedCase", "The case specified is unrecognised, the provided case was: %s.", sentenceCase)
        
        
end % switch sentenceCase
end % function
