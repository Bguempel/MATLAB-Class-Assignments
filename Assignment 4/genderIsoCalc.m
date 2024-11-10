function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(maleData,femaleData)
% Calculates individual and group means for males and females
%
% Inputs:
% maleData - a subjects and days matrix for males
% femaleData - a subjects and days matrix for females
% 
% Outputs:
% maleIsoIndMeans - vector with the mean for an individuals isometric strength (male)
% femaleIsoIndMeans - vector with the mean for an individuals isometric strength (female) 
% maleGroupIsoMean - mean of subject means (males)
% femaleGroupIsoMean - mean of subject means (females)
%
%
% Calculates individual mean isometric strength across 3 days for males
   maleIsoIndMeans = mean(maleData, 2);  % 2 means we average across columns (days)
    
% Calculate individual mean isometric strength across 3 days for females
   femaleIsoIndMeans = mean(femaleData, 2);  % Averaging across days for female subject
    
% Calculate group mean for males (mean of individual means)
   maleGroupIsoMean = mean(maleIsoIndMeans);  % Mean of all individual male means
    
% Calculate group mean for females (mean of individual means)
   femaleGroupIsoMean = mean(femaleIsoIndMeans);  % Mean of all individual female means

% displays results to check
disp('Male Individual Iso Means:');
disp(maleIsoIndMeans);
disp('Female Individual Iso Means:');
disp(femaleIsoIndMeans);
disp('Male Group Iso Mean:');
disp(maleGroupIsoMean);
disp('Female Group Iso Mean:');
disp(femaleGroupIsoMean);


end