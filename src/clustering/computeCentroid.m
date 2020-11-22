function centroid = computeCentroid(signaturesMat)
% function  centroid = computeCentroid(signatures)
% Computes the centroid of a cluster of signatures.
% 
% Input
%   - signatures: a matrix containing the signature "signals" of a specific
%   cluster.
% Output
%   - centroid: the cluster centroid.
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------
    
    if(size(signaturesMat,1) > 0)
        centroid = mean(signaturesMat,1);
    else
        centroid = zeros(1,25);
    end

end