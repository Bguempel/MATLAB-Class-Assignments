function [result] = sumMod(num1, num2)
% this function returns Woo if the sum is even and Hah if the sum is odd.
% it takes two numbers as inputs and returns the string 'Woo' for an even
% sum and the string 'Hah' for an odd sum. 

z = num1 + num2;

    if (mod(z,2) == 0)
        result = 'Woo';
    else
        result = 'Hah';
    end
end