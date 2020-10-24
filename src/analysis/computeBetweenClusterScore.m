function score = computeBetweenClusterScore(signaturesMat,clusters)
    
    fN = fieldnames(clusters);
    nC = length(fieldnames(clusters));
    
    
    centroids = zeros(nC,size(signaturesMat,2));
    
    for c = 1:nC
        
        centroids(c,:) = computeCentroid(signaturesMat(clusters.(fN{c}),:));
    
    end
    
    cc = computeCentroid(centroids);
    
    score = 0;
    for c = 1:size(centroids,1)
        score = score + norm(cc - centroids(c,:));
    end
    score = score/(size(centroids,1) - 1);

end