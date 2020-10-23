function readTheBook(data,verbose)
    
    addpath(genpath('src'));
    
    if(verbose)
        fprintf('Preprocessing CGM data...');
        tic;
    end
    
    dataTransformed = transformToPeaks(data);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Find the traces to be analyzed...');
        tic;
    end
    
    traces = findTraces(dataTransformed);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Computing the signature of each trace...');
        tic;
    end
    
    for t = 1:length(traces)
        signatures{t} = findSignature(traces{t});
    end
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Dividing signatures into clusters...');
        tic;
    end
    
    clusters = divideSignatures(signatures);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end

end

