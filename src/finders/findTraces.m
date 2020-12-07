function traces = findTraces(data,environment)
% function  traces = findTraces(dataTransformed)
% Finds and returns the portions of data to be later processed and
% clustered.
% 
% Input
%   - data: a timetable containing the patient data. 
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
    
    if(environment.verbose)
        fprintf('Find the traces to be analyzed...');
        tic;
    end
    
    %Set hyperparameters
    Ts = environment.Ts;
    preMealMinutes = environment.preMealMinutes; 
    postMealMinutes = environment.postMealMinutes; 

    %Find the mealIdxs
    mealIdxs = find(strcmp(data.CHOLabel,'Breakfast') | ...
        strcmp(data.CHOLabel,'Lunch') | ...
        strcmp(data.CHOLabel,'Dinner') | ...
        strcmp(data.CHOLabel,'Snack') );
    
    %Validate and retain the valid traces
    k = 1;
    traces = cell(0);
    for mi = 1:length(mealIdxs)
        
        %Check if the trace can be selected then validate it, and save it.
        if( mealIdxs(mi)>preMealMinutes/Ts && mealIdxs(mi) < (height(data)-postMealMinutes/Ts) )
            
            trace = data( (mealIdxs(mi) - preMealMinutes/Ts) : (mealIdxs(mi) + postMealMinutes/Ts) , : );
            
            if(isTraceValid(trace,environment))
                 
                 %Shift the bolus to mealTime
                 bolusIdx = find(strcmp(trace.bolusLabel,trace.CHOLabel(preMealMinutes/Ts + 1)));
                 
                 if(bolusIdx ~= preMealMinutes/Ts + 1)
                    trace.bolus(preMealMinutes/Ts + 1) = trace.bolus(bolusIdx);
                    trace.bolusLabel(preMealMinutes/Ts + 1) = trace.bolusLabel(bolusIdx);
                    trace.bolus(bolusIdx) = 0;
                    trace.bolusLabel(bolusIdx) = "";
                 end
                 
                 %Cut the first part
                 traces{k} = trace((preMealMinutes/Ts + 1):end,:);
                 k = k + 1;
                 
             end
             
         end
         
    end 
     
    if(environment.verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
end

    