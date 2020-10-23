function dataTransformed = transformToPeaks(data)
% function  dataTransformed = transformToPeaks(data)
% Transform and retain CGM data to a line that connects peaks and nadirs.
% 
% Input
%   - data: a timetable containing the data to analyze. 
% Output
%   - dataTransformed: a timetable containing also the transformed CGM 
%   data.
%
%
% ---------------------------------------------------------------------
%
% Copyright (C) 2020 Giacomo Cappon
%
% This file is part of I Can Read You Like A Book.
%
% ---------------------------------------------------------------------

    %FInd peaks and naidrs...
    [~,nadLoc] = findpeaks(abs(data.CGM-max(data.CGM)),'MinPeakDistance',24,'MinPeakProminence',30);
    [~,peaLoc] = findpeaks(data.CGM,'MinPeakDistance',24,'MinPeakProminence',30);
    
    %...and sort them
    [locs,ind] = sort([nadLoc; peaLoc]);
    
    %Interpolate the peaks and nadirs points
    transCGM = interp1(data.Time(locs),data.CGM(locs),data.Time);
    
    %Save the interpolated data into a new timetable
    dataTransformed = data;
    dataTransformed.transCGM = transCGM;
    
    %Add also the labels of the peaks and nadirs
    dataTransformed.peakLabel = dataTransformed.CHOLabel;
    dataTransformed.peakLabel(:) = '';
    dataTransformed.peakLabel(nadLoc) = 'N';
    dataTransformed.peakLabel(peaLoc) = 'P';

end