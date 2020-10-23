function valid = isTraceValid(trace)
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
    if( sum(isnan(trace.transCGM)) > maxNansNumber )
        valid = false;
    end
    
    %Check if other CHO intakes are present before the main meal timestamp
    if( sum(trace.CHO(1:12)) > 0 )
        valid = false;
    end
    
    %Check if other insulin boluses are present after the main meal timestamp
    if( sum(trace.bolus(1:12)) > 0 )
        valid = false;
    end
    
    %Check if other CHO intakes are present after the main meal timestamp
    if( sum(trace.CHO(14:end)) > 0 )
        valid = false;
    end
    
    %Check if other insulin boluses are present after the main meal timestamp
    if( sum(trace.bolus(14:end)) > 0 )
        valid = false;
    end
    
end