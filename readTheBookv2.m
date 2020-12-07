function [bcs, wcs, flag] = readTheBookv2(data,verbose,plotMode)
    
    close all

    addpath(genpath('src'));
    
%     if(verbose)
%         fprintf('Preprocessing CGM data...');
%         tic;
%     end
    
%    data = transformToPeaks(data);
    
%    if(verbose)
%        time = toc;
%        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
%    end
    
    if(verbose)
        fprintf('Find the traces to be analyzed...');
        tic;
    end
    
    traces = findTraces(data);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Computing the signature of each trace...');
        tic;
    end
    
    signatures = cell(0);
    for t = 1:length(traces)
        signatures{t} = findSignature(traces{t});
    end
    signatures = normalizeSignatures(signatures,traces);
    signaturesMat = signaturesToMat(signatures);
    
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
    
    if(verbose)
        fprintf('Pruning cluster outliers...');
        tic;
    end
    
    plotClusters(clusters,signaturesMat);
    
    [signaturesMat,clusters] = pruneClusterOutliers(signaturesMat,clusters);
    nDays = floor(height(data)/288);
    flag = size(signaturesMat,1) > nDays; % at least "two" good t per week
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose && plotMode)
        fprintf('Visualizing signatures into clusters...');
        tic;
    end
    
    if(plotMode)
        plotClusters(clusters,signaturesMat);
    end
    
    if(verbose && plotMode)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    if(verbose)
        fprintf('Computing predictability score...');
        tic;
    end
    
    [bcs, wcs] = computeScores(signaturesMat, clusters);
    
    if(verbose)
        time = toc;
        fprintf(['DONE. (Elapsed time ' num2str(time/60) ' min)\n']);
    end
    
    disp(['Patient scores --> BC: ' num2str(bcs) ', WC: ' num2str(wcs)]);
end

