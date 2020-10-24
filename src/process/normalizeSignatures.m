function signatures = normalizeSignatures(signatures,traces)
% function  signatures = normalizeSignatures(signatures,data)
% Normalize the signature by CHO/I.
% 
% Input
%   - signatures: a cell array of structures each containing the four 
%   signature points;
%   - traces: a cell array of timetables containing the data traces to be 
%   later processed and clustered. 
% Output
%   - signatures: a (normalized) cell array of structures each containing 
%   the four signature points.
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    for t = 1:length(traces)
    
        factor = traces{t}.CHO(1)/traces{t}.bolus(1);
        
        offset = signatures{t}.A.value/factor;
        
        signatures{t}.A.value = signatures{t}.A.value/factor - offset;
        signatures{t}.B.value = signatures{t}.B.value/factor - offset;
        signatures{t}.C.value = signatures{t}.C.value/factor - offset;
        signatures{t}.D.value = signatures{t}.D.value/factor - offset;
        signatures{t}.E.value = signatures{t}.E.value/factor - offset;
        
    end
    

end