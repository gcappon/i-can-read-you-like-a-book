function valid = isTraceValid(trace, preMealMinutes)
% function  valid = isTraceValid(trace)
% Says whether or not a given data trace is valid and can be included in 
% the analysis or not according to several criteria.
% 
% Input
%   - trace: a timetable containing the data trace to be validated (1 h +
%   meal + 4 hours of data)
% Output
%   - valid: a boolean flag indicating whether or not the give data trace
%   is valid.
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    %Initialize valid 
    valid = true;
   
    %% Setting the validation criteria
    
    %Setting the maximum percentage of nan values within the data trace
    maxNansPercentage = 0.1; %10%
    maxNansNumber = floor(height(trace)*maxNansPercentage);
    
    
    %% Evaluating criteria 
    %Check if the number of nans within the data exceed the criteria
    if( sum(isnan(trace.CGM)) > maxNansNumber || sum(isnan(trace.transCGM)) > 0 )
        valid = false;
    end
    
    %Check if other CHO intakes are present
    if( sum(trace.CHO > 0 ) > 1 )
        valid = false;
    end
    
    %Check if the bolus corresponding to the current meal is present
    bolusIdx = find(strcmp(trace.bolusLabel,trace.CHOLabel(preMealMinutes/5 + 1)), 1);
    if( isempty(bolusIdx) )
        valid = false;
    end
    
    %Check if other insulin boluses are present
    if( sum(trace.bolus > 0) > 1 )
        valid = false;
    end

    
end