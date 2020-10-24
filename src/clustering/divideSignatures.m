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
    clusterNames = {'one','two','three','four','five','six','seven','eight'};
    for cn = 1:length(clusterNames)
        clusters.(clusterNames{cn}) = [];
    end
    
    %Assign signatures to clusters
    for s = 1:length(signatures)
        
        signature = signatures{s};
        
        % Cluster 1
        if( signature.A.idx < signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx < signature.E.idx) 
        
            clusters.one = [clusters.one; s];
            
        end
        
        % Cluster 1bis 
        if( signature.A.idx < signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx == signature.E.idx) 
        
            clusters.two = [clusters.two; s];
            
        end
        
        % Cluster 2
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx < signature.E.idx)
        
            clusters.three = [clusters.three; s];
            
        end
        
        % Cluster 2bis
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx == signature.E.idx)
        
            clusters.four = [clusters.four; s];
            
        end
        
        % Cluster 3
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx == signature.D.idx && ...
            signature.D.idx == signature.E.idx) 
        
            clusters.five = [clusters.five; s];
            
        end
        
        % Cluster 4
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx == signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx < signature.E.idx) 
        
            clusters.six = [clusters.six; s];
            
        end
        
        % Cluster 4bis
        if( signature.A.idx == signature.B.idx && ...
            signature.B.idx == signature.C.idx && ...
            signature.C.idx < signature.D.idx && ...
            signature.D.idx == signature.E.idx) 
        
            clusters.seven = [clusters.seven; s];
            
        end
        
        % Cluster 5
        if( signature.A.idx < signature.B.idx && ...
            signature.B.idx < signature.C.idx && ...
            signature.C.idx == signature.D.idx && ...
            signature.D.idx == signature.E.idx) 
        
            clusters.eight = [clusters.eight; s];
            
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
    
    