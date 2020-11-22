function [bcs, wcs] = computeScores(signaturesMat,clusters)
    
    fN = fieldnames(clusters);
    nC = length(fieldnames(clusters));
    
    %bcs = 1 
    bcs = computeBetweenClusterScore(signaturesMat,clusters); %0 if all signatures are equally distributed across the eight clusters
    
    wcss = zeros(1,nC);
    for c = 1:nC
        
        wcss(c) = computeWithinClusterScore(signaturesMat(clusters.(fN{c}),:));
    
    end
    wcs = nanmean(wcss); %0 if every signatures is exaclty equal to its centroid
    
    %score = bcs/(bcs + wc);
    %score = sqrt(bcs^2 + wc^2);
    
end