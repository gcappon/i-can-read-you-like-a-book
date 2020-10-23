function clusters = divideSignatures(signatures)
% function  clusters = divideSignatures(signatures)
% Assign each signature to the corresponding cluster.
% 
% Input
%   - signature: a cell array of structures each containing the four 
%   signature points. 
% Output
%   - clusters: a structure containing the cluster assignment of each 
%   signiture. 
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------
    
    %Init clusters 
    clusterNames = {'one','two','three','four','five'};
    for cn = 1:length(clusterNames)
        clusters.(clusterNames{cn}) = [];
    end
    
    %Assign signatures to clusters
    for s = 1:length(signatures)
        
        signature = signatures{s};
        
        % Cluster 1
        if( signature.A.idx < signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx ) 
        
            clusters.one = [clusters.one; s];
            
        end
    
        % Cluster 2
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx ) 
        
            clusters.two = [clusters.two; s];
            
        end
        
        % Cluster 3
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx == signature.D.idx ) 
        
            clusters.three = [clusters.three; s];
            
        end
        
        % Cluster 4
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx == signature.C.idx && ...
            signature.C.idx < signature.D.idx ) 
        
            clusters.four = [clusters.four; s];
            
        end
        
        % Cluster 5
        if( signature.A.idx < signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx == signature.D.idx ) 
        
            clusters.five = [clusters.five; s];
            
        end
        
    end
    
    %Check if every signature has been asssigned to a cluster. If not raise
    %a warning
    n = 0;
    for cn = 1:length(clusterNames)
        n = n + length(clusters.(clusterNames{cn}));
    end
    
    if( n < length(signatures) )
        warning('Some signatures have not been assigned to a cluster.');    
    end
    
        
end
    
    