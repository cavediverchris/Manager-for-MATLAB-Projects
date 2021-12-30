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

