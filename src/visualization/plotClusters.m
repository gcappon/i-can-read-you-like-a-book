function plotClusters(clusters,signaturesMat)
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
    clusterNames = fieldnames(clusters);
    
    colors = [1 0 0;
              0 0 1;
              0 1 .5;
              .5 .5 .5;
              .5 1 0;
              .8 .7 0;
              0 .7 .8;
              .4 .3 .8];
       
    for cn = 1:length(clusterNames)
        figure;
        plot(signaturesMat(clusters.(clusterNames{cn}),:)','color',colors(cn,:),'linewidth',2);
        hold on
        plot(computeCentroid(signaturesMat(clusters.(clusterNames{cn}),:)),'k--','linewidth',3);
        title(['Cluster ' num2str(cn) ' (n = ' num2str(length(clusters.(clusterNames{cn}))) ')']);
    end

    
end