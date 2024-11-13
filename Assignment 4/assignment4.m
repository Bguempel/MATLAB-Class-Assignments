% import isokData
% create table
% create seperate vectors
isokData = importfile('isok_data_6803.csv');

% compares the elements in the gender column with the strings 'M' (males)
% and 'F' (females). logical array is created to filter subjects.
% of the filtered subjects, only the data within column 'days' will be
% selected
maleData = isokData(strcmp(isokData.Gender,'M'),{'Day1','Day2','Day3'});
femaleData = isokData(strcmp(isokData.Gender,'F'),{'Day1','Day2','Day3'});
% data is stored in an array
maleData = table2array(maleData);
femaleData = table2array(femaleData);

% calls the genderIsoCalc function
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(maleData, femaleData);

% defines subjects and days into new variables. not a must but it made more
% sense to me broken up this way.
subjectIDs = SubjectID;
day1Data = Day1;
day2Data = Day2;
day3Data = Day3;

% stores increases from day one to day two
day1toDay2 = dayComparer(subjectIDs,day1Data,day2Data);

% stores increases from day two to day three
day2toDay3 = dayComparer(subjectIDs,day2Data,day3Data);

% Display the results
disp('Subjects with an increase from Day 1 to Day 2:');
disp(day1toDay2);

disp('Subjects with an increase from Day 2 to Day 3:');
disp(day2toDay3);

% normalized data per day by bodyweight
isokData.Day1Normalized = isokData.Day1 ./ isokData.Weight;
isokData.Day2Normalized = isokData.Day2 ./ isokData.Weight;
isokData.Day3Normalized = isokData.Day3 ./ isokData.Weight;

% means per group of normalized data
normDay1mean = mean(isokData.Day1Normalized);
normDay2mean = mean(isokData.Day2Normalized);
normDay3mean = mean(isokData.Day3Normalized);

%padded results to fit exported table

maleIsoIndMeansPadded = [maleIsoIndMeans; NaN * ones(height(isokData) - numel(maleIsoIndMeans), 1)];
isokData.maleIsoIndMeansPr = maleIsoIndMeansPadded;

femaleIsoIndMeansPadded = [femaleIsoIndMeans; NaN * ones(height(isokData) - numel(femaleIsoIndMeans), 1)];
isokData.femaleIsoIndMeansPr = femaleIsoIndMeansPadded;

maleGroupIsoMeanPadded = [maleGroupIsoMean; NaN * ones(height(isokData) - numel(maleGroupIsoMean), 1)];
isokData.maleGroupIsoMeanPr = maleGroupIsoMeanPadded;

femaleGroupIsoMeanPadded = [femaleGroupIsoMean; NaN * ones(height(isokData) - numel(femaleGroupIsoMean), 1)];
isokData.femaleGroupIsoMeanPr = femaleGroupIsoMeanPadded;

% Orient vertically

day1toDay2Vert = reshape(day1toDay2, 12, 1);
day2toDay3Vert = reshape(day2toDay3, 11, 1);

% padded results to fit exported table

day1toDay2Vert = [day1toDay2Vert; repmat({''}, 13, 1)];
isokData.day1toDay2VertPr = day1toDay2Vert;

day2toDay3Vert = [day2toDay3Vert; repmat({''}, 14, 1)];
isokData.day2toDay3VertPr = day2toDay3Vert;

% padded results to fit exported table
normDay1meanPadded = [normDay1mean; NaN * ones(height(isokData) - numel (normDay1mean), 1)];
isokData.normDay1meanPr = normDay1meanPadded;

normDay2meanPadded = [normDay2mean; NaN * ones(height(isokData) - numel (normDay2mean), 1)];
isokData.normDay2meanPr = normDay2meanPadded;

normDay3meanPadded = [normDay3mean; NaN * ones(height(isokData) - numel (normDay3mean), 1)];
isokData.normDay3meanPr = normDay3meanPadded;



% Exports results of table 
writetable(isokData, 'iso_results.csv');
