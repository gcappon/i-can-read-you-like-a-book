function [score, flag] = readTheBook(data,verbose,plotMode)
    
    close all

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
    signatures = normalizeSignatures(signatures,traces);
    signaturesMat = signaturesToMat(signatures);
    
    flag = length(signatures) > 30;
    
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
    
    if(verbose && plotMode)
        fprintf('Visualizing signatures into clusters...');
        tic;
    end
    
    if(plotMode)
        plotClusters(clusters,signatures);
    end
    
    if(verbose && plotMode)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Computing predictability score...');
        tic;
    end
    
    score = computeRhoScore(signaturesMat, clusters);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    disp(['Patient score: ' num2str(score)]);
end

