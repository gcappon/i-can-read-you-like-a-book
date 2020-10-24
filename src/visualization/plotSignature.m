function plotSignature(signature,color)
% function  plotSignature(signature)
% Visualizes a given signature.
% 
% Input
%   - signature: a structures containing the four signature points;
%   - color: a vector of character defining the color to use.
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    x = [signature.A.idx 
        signature.B.idx 
        signature.C.idx 
        signature.D.idx
        signature.E.idx]; 
    
    y = [signature.A.value 
        signature.B.value 
        signature.C.value 
        signature.D.value
        signature.E.value]; 
    
    plot(x,y,'color',color,'linewidth',2);
    hold on
    scatter(x,y,'MarkerEdgeColor',color,'MarkerFaceColor',color,'linewidth',2);
    hold off
    
end