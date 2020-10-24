function score = computeWithinClusterScore(signaturesMat)
    
    %fN = fieldnames(clusters);
    %nC = length(fieldnames(clusters));
    
    centroid = computeCentroid(signaturesMat);
    
    score = 0;
    
    if(size(signaturesMat,1) > 1)
        for s = 1:size(signaturesMat,1)
            score = score + norm(centroid - signaturesMat(s,:));
        end
        score = score/(size(signaturesMat,1) - 1);
    end

end