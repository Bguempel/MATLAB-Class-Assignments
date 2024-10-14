function countNumFromTo(a, b)
% this function takes two numbers and displays a count from the lowest to 
% the highest number. 
% first, it checks that the inputs are both numerical. if not, it will 
% provide an error message explanation. next, it takes the two inputs and 
% establishes the lower and higher number. Lastly, it displayes the 
% iteration of values from lowest to highest. 
    if ~isnumeric(a) || ~isnumeric(b)
        error('Both inputs must be numeric.');
    end
    
    lower = min(a, b);
    higher = max(a, b);    
    
    for i = lower:higher
        disp(i);
    end
 end
