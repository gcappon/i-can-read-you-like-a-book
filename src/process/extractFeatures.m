function features = extractFeatures(traces,environment)
% function  traces = findTraces(dataTransformed)
% Finds and returns the portions of data to be later processed and
% clustered.
% 
% Input
%   - traces: a cell array of timetables containing the data traces to be 
%   later processed and clustered. 
% Output
%   - features: a cell array of structures containg the traces features
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
        fprintf('Extracting the features of each trace...');
        tic;
    end
    
    features = cell(length(traces),1);

    %mealTypes = {'Breakfast','Lunch','Dinner','Snack'};
    for t = 1:length(traces)
        
        %Rename trace CGM to comply with AGATA
        trace = traces{t};
        trace.glucose = trace.CGM;
        
        %Process trace
        trace = imputeGlucose(trace,environment.postMealMinutes);
        
        %Extract meal features
        features{t}.mealTime = minutes(trace.Time(1)-datetime(trace.Time(1).Year,trace.Time(1).Month,trace.Time(1).Day,0,0,0)); %minutes from midnight
        features{t}.CHO = trace.CHO(1)*environment.Ts;
        
        %features{t}.mealType = find(strcmp(trace.CHOLabel(1),mealTypes));
        features{t}.mealType = trace.CHOLabel(1);
        features{t}.insulin = trace.bolus(1)*environment.Ts + nansum(trace.basal)*environment.Ts;
        
        %Create a de-trended version of glucose data
        traceDet = trace;
        m = (trace.glucose(end) - trace.glucose(1))/(height(traceDet));
        traceDet.glucose = traceDet.glucose - m*(1:height(traceDet))';
        %Extract gv features
        %features{t}.std = stdGlucose(traceDet);
        features{t}.cv = cvGlucose(traceDet);
        
        %Extract glycemic features
        features{t}.startGlucose = trace.glucose(1);
        %features{t}.endGlucose = trace.glucose(end);
        features{t}.excursion = trace.glucose(end) - trace.glucose(1);
        %features{t}.lbgi = lbgi(trace);
        %features{t}.hbgi = hbgi(trace);
                
    end
    
    %Convert features to a table
    for t = 1:length(features)
        featTable(t,:) = struct2table(features{t});
    end
    
    features = featTable;
     
    if(environment.verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
end

    