function plotVectors(x, y)
% this function takes two vectors and plots the values on a figure. the
% function ensures the vectors are the same length or it will return 
% an error message.
% it creates the figure with a figure title, x-axis title, y-axis title,
% and the grid is on for better visibility.
    
    if length(x) ~= length(y)
        error('Input vectors must be of the same length.');
    end
    
    figure;
    plot(x,y)
    grid on;
    title('Plot title');
    xlabel('X-axis Title');
    ylabel('Y-axis Title');

end