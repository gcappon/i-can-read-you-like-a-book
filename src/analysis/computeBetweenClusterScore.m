function score = computeBetweenClusterScore(signaturesMat,clusters)
    
    clusterNames = fieldnames(clusters);
    nC = length(clusterNames);
    
    
    %centroids = zeros(nC,size(signaturesMat,2));
    
%     if(length(signaturesMat) > 0)
%         for c = 1:nC
% 
%             centroids(c,:) = computeCentroid(signaturesMat(clusters.(fN{c}),:));
% 
%         end
%     end
    
    %cc = computeCentroid(centroids);
    
    %score = 0;
    %for c = 1:size(centroids,1)
    %    score = score + norm(cc - centroids(c,:));
    %end
    %score = score/(size(centroids,1) - 1);

    numerosities = zeros(nC,1);
    for c = 1:nC
        numerosities(c) = length(clusters.(clusterNames{c}));
    end
    
    score = var(numerosities)/(sum(numerosities)*sum(numerosities)/length(numerosities));
end