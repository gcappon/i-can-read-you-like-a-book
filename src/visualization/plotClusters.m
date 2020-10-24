function plotClusters(clusters,signatures)
% function  plotSignature(signature)
% Visualizes the clusters.
% 
% Input
%   - clusters: a structure containing the cluster assignment of each 
%   signature;
%   - signatures: a cell array of structures each containing the five 
%   signature points. 
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    figure;
    for c = 1:length(clusters.one)
        hold on
        plotSignature(signatures{clusters.one(c)},[1 0 0]);
    end
    title(['Cluster 1 (n = ' num2str(length(clusters.one)) ')']);
        
    figure;
    for c = 1:length(clusters.two)
        hold on
        plotSignature(signatures{clusters.two(c)},[0 0 1]);
    end
    title(['Cluster 2 (n = ' num2str(length(clusters.two)) ')']);
    
    figure;
    for c = 1:length(clusters.three)
        hold on
        plotSignature(signatures{clusters.three(c)},[0 1 .5]);
    end
    title(['Cluster 3 (n = ' num2str(length(clusters.three)) ')']);
    
    figure;
    for c = 1:length(clusters.four)
        hold on
        plotSignature(signatures{clusters.four(c)},[.5 .5 .5]);
    end
    title(['Cluster 4 (n = ' num2str(length(clusters.four)) ')']);

    figure;
    for c = 1:length(clusters.five)
        hold on
        plotSignature(signatures{clusters.five(c)},[.5 1 0]);
    end
    title(['Cluster 5 (n = ' num2str(length(clusters.five)) ')']);
    
    figure;
    for c = 1:length(clusters.six)
        hold on
        plotSignature(signatures{clusters.six(c)},[.8 .7 0]);
    end
    title(['Cluster 6 (n = ' num2str(length(clusters.six)) ')']);
    
    figure;
    for c = 1:length(clusters.seven)
        hold on
        plotSignature(signatures{clusters.seven(c)},[0 .7 .8]);
    end
    title(['Cluster 7 (n = ' num2str(length(clusters.seven)) ')']);
    
    figure;
    for c = 1:length(clusters.eight)
        hold on
        plotSignature(signatures{clusters.eight(c)},[.4 .3 .8]);
    end
    title(['Cluster 8 (n = ' num2str(length(clusters.eight)) ')']);
    
end