function signaturesMat = signaturesToMat(signatures)
% function  signaturesMat = signaturesToMat(signatures)
% Transforms the signatures cell array to a matrix.
% 
% Input
%   - signatures: a cell array of structures each containing the five 
%   signature points of a given cluster. 
% Output
%   - signaturesMat: a matrix containing the signature "signals".
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------
    
     signaturesMat = [];
    
    for s = 1:length(signatures)
    
        signatureX = [signatures{s}.A.idx signatures{s}.B.idx signatures{s}.C.idx signatures{s}.D.idx signatures{s}.E.idx];
        signatureY = [signatures{s}.A.value signatures{s}.B.value signatures{s}.C.value signatures{s}.D.value signatures{s}.E.value]; 
        
        uniqueX = unique(signatureX);
        uniqueY = uniqueX;
        for u = 1:length(uniqueX)
            idx = find(signatureX == uniqueX(u),1,'first');
            uniqueY(u) = signatureY(idx);
        end
        signaturesMat(s,:) = interp1(uniqueX, uniqueY, 1:signatures{1}.E.idx);
        
    end
    
end