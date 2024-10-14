function [primeNum] = checkPrime(n)
% this function takes a number and determines if it a prime number or not.
% it takes one input number (n) and return if the number is a 
% prime number (true) or not (false). 
% firstly, if a number is less than or equal to one it is not prime.
% next, the for loop runs every number between 2 and the square root of
% the number, checking for a remainder when divided by the iteration value.
% if no remainder, the number is not prime. if all iteration have a remainder,
% the number is prime.

    if n <= 1
        primeNum = false;
        return;
    end
    for i = 2:sqrt(n)
        if mod(n, i) == 0
            primeNum = false;
            return;
        end        
    end

    primeNum = true;
end