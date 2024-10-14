function validTriangle = isValidTriangle(sides)
    % this function checks if a 3-element array represents the sides of
    % a valid triangle and returns true/false logic. 
    % first, it checks if the input is in a 3-element array. if not,
    % it will return an error message explaining it must be one.
    % next, each element within the array will be checked via the 
    % triangle inequality theorem.
    % lastly, after calling the function with a correct input (e.g. [3 4
    % 5]), it will return a logic value (1 or 0), representing true or 
    % false. 
    if length(sides) ~= 3
        error('Input must be a 3-element array.');
    end
       
    a = sides(1);
    b = sides(2);
    c = sides(3);
    
    validTriangle = (a + b > c) && (a + c > b) && (b + c > a);
end