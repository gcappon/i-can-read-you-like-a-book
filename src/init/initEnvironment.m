function environment = initEnvironment()

    environment.verbose = 1;
    environment.plotMode = 1;
    
    %sample time
    environment.Ts = 5; 
    
    %Find traces hyperparameters
    environment.preMealMinutes = 60;
    environment.postMealMinutes = 60;
    
    
end