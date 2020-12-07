function summary = readTheBook(data)
    
    close all

    addpath(genpath('src'));
    addpath(genpath('libs'));
    
    %Initialize the enviroment
    environment = initEnvironment();
    
    %Extract the traces
    traces = findTraces(data,environment);
    
    %Extract the feature of each trace
    features = extractFeatures(traces,environment);
    
    
    
    
    %Up to this point, for each cluster I have the following useful
    %features
    %   - cvGlucose: to quantify noise 
    %   - excursion, CHO, bolus to describe meal impact on glucose
    %   - mealTime: to quatify the repetitiveness
    
    
    %   - CHO: to quantify meal intake
    
    %normalize excursion by CHO/I and and retain just excursion
    features.excursion = features.excursion.*features.CHO./features.insulin;
    features.insulin = [];
    features.CHO = [];
    
    %TODO: prune outliers 
    
    %Compute final summary the patient
    summary = getSummary(features);
    
end

