close all
clear all
patsID = {'4001', '4002','4003','4004','4005','4006','4007','4008','4009','4010','4011',...
            '4012','4013','4014','4015','4016','4017','4018','4020','4021','4022','4023','4024','4025','4026'};
 
scores = zeros(length(patsID),1);
flags = zeros(length(patsID),1);
for p = 1:length(patsID)
    
    load(fullfile('data','Merged',['ABC' patsID{p}]));
    
    disp(['Scoring ABC' patsID{p} '...']);
    [bcs(p), wcs(p), flags(p)] = readTheBook(data,1,0);
    
end

scatter(bcs,wcs);
%[~, ranks] = sort(scores,'desc');

%Rank only valid patients
%ranks = ranks(logical(flags));
        
        