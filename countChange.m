function [totalChange] = countChange(quarters, dimes, nickels, pennies)
% this function counts the amount of change input.
% it takes 4 input arguments of the number of quarters, dimes, nickels, and pennies.
% it returns the summed currency total of the respective inputs.
valueQuarter = 0.25;
valueDime = 0.10;
valueNickels = 0.05;
valuePennies = 0.01;

totalChange = (quarters * valueQuarter) + (dimes * valueDime) + (nickels + valueNickels) + (pennies + valuePennies);
end