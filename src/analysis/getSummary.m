function summary = getSummary(features)

% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    %Divide by mealType and then drop mealType
    featuresBreakfast = features(strcmp(features.mealType,'Breakfast'),:);
    featuresLunch = features(strcmp(features.mealType,'Lunch'),:);
    featuresDinner = features(strcmp(features.mealType,'Dinner'),:);
    featuresSnack = features(strcmp(features.mealType,'Snack'),:);
    featuresBreakfast.mealType = [];
    featuresLunch.mealType = [];
    featuresDinner.mealType = [];
    featuresSnack.mealType = [];
    
    
    summary.breakfastTime = std(featuresBreakfast.mealTime);
    summary.breakfastExcursion = std(featuresBreakfast.excursion);
    summary.breakfastCV = std(featuresBreakfast.cv);
    summary.breakfastStartGlucose = std(featuresBreakfast.startGlucose);
    
    summary.snackTime = std(featuresSnack.mealTime);
    summary.snackExcursion = std(featuresSnack.excursion);
    summary.snackCV = std(featuresSnack.cv);
    summary.snackStartGlucose = std(featuresSnack.startGlucose);
    
    summary.lunchTime = std(featuresLunch.mealTime);
    summary.lunchExcursion = std(featuresLunch.excursion);
    summary.lunchCV = std(featuresLunch.cv);
    summary.lunchStartGlucose = std(featuresLunch.startGlucose);
    
    summary.dinnerTime = std(featuresDinner.mealTime);
    summary.dinnerExcursion = std(featuresDinner.excursion);
    summary.dinnerCV = std(featuresDinner.cv);
    summary.dinnerStartGlucose = std(featuresDinner.startGlucose);
    
    summary = struct2table(summary);
end