function [formattedSentence] = convertSentenceCase(inputString,sentenceCase)


switch sentenceCase
    case "camel-case"
        if contains(inputString, " ")
            % CASE: the string that the user gave has spaces
            % ACTION: Modify the first letter to be upper case
            
            capitalize = @(s) upper(extractBefore(s, 2)) + extractAfter(s, 1);
            componentWords = inputString.split;
            newWords = arrayfun(capitalize, componentWords(2:end));
            formattedSentence = componentWords(1) + join(newWords, "");
            
        end
        
    case "pascal-case"
        
        
    otherwise
        
        
        
end
end

