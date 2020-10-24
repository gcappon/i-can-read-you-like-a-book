function score = computeRhoScore(signaturesMat,clusters)
    
    fN = fieldnames(clusters);
    nC = length(fieldnames(clusters));
    

    bcs = computeBetweenClusterScore(signaturesMat,clusters);
    
    wcs = zeros(1,nC);
    for c = 1:nC
        
        wcs(c) = computeWithinClusterScore(signaturesMat(clusters.(fN{c}),:));
    
    end
    wc = sum(wcs)/length(wcs);
    
    score = bcs/(bcs + wc);

end