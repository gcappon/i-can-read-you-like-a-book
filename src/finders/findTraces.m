function traces = findTraces(dataTransformed)
% function  traces = findTraces(data)
% Finds and returns the portions of data to be later processed and
% clustered.
% 
% Input
%   - dataTransformed: a timetable containing the patient data. 
% Output
%   - traces: a cell array of timetables containing the data traces to be 
%   later processed and clustered.  
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------
    
    %Find the mainMealIdxs
    mainMealIdxsAll = find(strcmp(dataTransformed.CHOLabel,'Breakfast') | ...
        strcmp(dataTransformed.CHOLabel,'Lunch') | ...
        strcmp(dataTransformed.CHOLabel,'Dinner') );
    
    
    %Retain mainMealIdxs of days with AT LEAST all three meals logged
    k = 1;
    for mmi = 1:length(mainMealIdxsAll)
        
        %Select the day of data
        dayData = dataTransformed( dataTransformed.Time.Year == dataTransformed.Time(mainMealIdxsAll(mmi)).Year & ...
            dataTransformed.Time.Month == dataTransformed.Time(mainMealIdxsAll(mmi)).Month & ...
            dataTransformed.Time.Day == dataTransformed.Time(mainMealIdxsAll(mmi)).Day, :);
        
        %Check if there are all the main meals in the current day
        if( any(strcmp(dayData.CHOLabel,'Breakfast')) && ...
                any(strcmp(dayData.CHOLabel,'Lunch')) && ...
                any(strcmp(dayData.CHOLabel,'Dinner')) )
            mainMealIdxs(k) = mainMealIdxsAll(mmi);
            k = k + 1;
        end
        
    end
    
    %Transpose the result in order to be a column
    mainMealIdxs = mainMealIdxs';
    
    %Validate and retain the valid traces
    k = 1;
    for mmi = 1:length(mainMealIdxs)
        
        %Check if the trace can be selected then validate it, and save it.
        if( mainMealIdxs(mmi)>12 && mainMealIdxs(mmi) < (height(dataTransformed)-48) )
            trace = dataTransformed( (mainMealIdxs(mmi) - 12) : (mainMealIdxs(mmi) + 48) , : );
            
            if(isTraceValid(trace))
                
                traces{k} = trace(13:end,:);
                k = k + 1;
                
            end
            
        end
        
    end 
    
end

    