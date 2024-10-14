function [lengthStr, firstChar, lastChar] = stringDet(inputStr)
% this function takes a string value input and returns the character length
% of the string, the first character, and last character (the string
% details).
% it takes 1 input argument (string) and returns the three output 
% arguments. Lastly, it displays the results in the command window.
   
    lengthStr = length(inputStr);
    firstChar = inputStr(1);
    lastChar = inputStr(end);
   
    disp(lengthStr);  
    disp(firstChar);   
    disp(lastChar);

end