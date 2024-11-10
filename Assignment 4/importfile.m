function isokData = importfile(filename)
% loads isok data into workspace, reads it into table, creates seperate
% vectors by column headers as variables.
%
% Input:
% filename - A string file name
%
% Output:
% isokData = Data imported from file

% read file into table
isokData = readtable(filename);

% Loop through each column in the table
   for k = 1:width(isokData)
        % Get the column name (header) and its corresponding data (column)
        columnName = isokData.Properties.VariableNames{k};
        columnData = isokData{:, k};
        
        % Assign the column data to a variable in the workspace with 
        % the name of the column
        assignin('base', columnName, columnData);
   end

end

