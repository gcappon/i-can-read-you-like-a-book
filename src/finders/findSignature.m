function signature = findSignature(trace)
% function  signature = findSignature(trace)
% Finds the signature of a given trace.
% 
% Input
%   - trace: a timetable containing the data trace to analyze. 
% Output
%   - signature: a structure containing the four signature points. 
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    %Find A
    signature.A.idx = 1;
    signature.A.value = trace.transCGM(signature.A.idx);

    %Find C
    signature.C.idx = find(trace.transCGM == max(trace.transCGM),1,'last');
    signature.C.value = trace.transCGM(signature.C.idx);

    %Find B
    snippet = trace.transCGM(1:signature.C.idx);
    signature.B.idx = find(snippet == min(snippet),1,'last');
    signature.B.value = trace.transCGM(signature.B.idx);

    %Find D
    snippet = trace.transCGM(signature.C.idx:end);
    signature.D.idx = find(snippet == min(snippet),1,'last') + signature.C.idx - 1;
    signature.D.value = trace.transCGM(signature.D.idx);

end
