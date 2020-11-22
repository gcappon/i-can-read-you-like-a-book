function [signaturesMat,clusters] = pruneClusterOutliers(signaturesMat,clusters)

    clusterNames = fieldnames(clusters);
        
    k = 1;
    newSignaturesMat = [];
    for cn = 1:length(clusterNames)
        newClusters.(clusterNames{cn}) = [];
    end
    
    for cn = 1:length(clusterNames)
        if(length(clusters.(clusterNames{cn})) > 1)
            %1. Get the 5-95th prctiles
            prc5 = prctile(signaturesMat(clusters.(clusterNames{cn}),:),5);
            prc95 = prctile(signaturesMat(clusters.(clusterNames{cn}),:),95);
            
            %2. Check each signature in the cluster and retain it if at least 50% of
            %its points are inside the 5-95th prctile zone
            for s = 1:length(clusters.(clusterNames{cn}))
                if( (sum(signaturesMat(clusters.(clusterNames{cn})(s),:) <= prc5) + sum(signaturesMat(clusters.(clusterNames{cn})(s),:) >= prc95)) <= size(signaturesMat,2)/2)
                    newClusters.(clusterNames{cn}) = [newClusters.(clusterNames{cn}) k];
                    newSignaturesMat = [newSignaturesMat; signaturesMat(clusters.(clusterNames{cn})(s),:)];
                    k = k+1;
                end
            end
            

        else
            if(length(clusters.(clusterNames{cn})) == 1)
                newClusters.(clusterNames{cn}) = [newClusters.(clusterNames{cn}) k];
                newSignaturesMat = [newSignaturesMat; signaturesMat(clusters.(clusterNames{cn}),:)];
                k = k+1;
            end
        end
    end
    
    signaturesMat = newSignaturesMat;
    clusters = newClusters;
end