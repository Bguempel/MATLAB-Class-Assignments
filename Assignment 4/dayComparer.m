function increasedSubjects = dayComparer(subjectIDs,day1Data,day2Data)
% this function compares values between two days per subject in the data
% set. if day two is greater than day one, the value is stored in the
% increasedSubjects array. Lastly, it will return a list of
% increasedSubjects.
 
% Check if the correct number of inputs are provided
    if nargin < 3
        error('Not enough input arguments. The function requires subjectIDs, day1Data, and day2Data.');
    end

% Start an empty array to store the IDs of subjects who had an increase
    increasedSubjects = [];
    
    % Loop over each subject and check if the value increased from day one
    % to day two
    for i = 1:length(subjectIDs)
        if day2Data(i) > day1Data(i) % If the value on day two is greater than day one
            increasedSubjects = [increasedSubjects, subjectIDs(i)]; % Add the subject ID to the list
        end
    end
 end