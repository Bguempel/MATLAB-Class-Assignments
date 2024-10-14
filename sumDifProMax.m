function [Sum, Difference, Product, Max] = sumDifProMax(xOut,yOut)
% this function returns the sum, difference, product, and max values of two
% input arguments. % it takes two input arguments and return the four 
% listed outputs. 
Sum = xOut + yOut;
Difference = xOut - yOut;
Product = xOut * yOut;
Max = max(xOut,yOut);
end