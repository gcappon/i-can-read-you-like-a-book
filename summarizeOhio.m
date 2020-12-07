close all
clear all
patsID = {'559','563','570','575','588','591','540','544','552','567','584','596'};
 
dbstop if error
bcs = zeros(length(patsID),1);
wcs = zeros(length(patsID),1);
flags = zeros(length(patsID),1);

for p = 1:length(patsID)
    
    load(fullfile('data','Merged',['Ohio' patsID{p}]));
    
    disp(['Scoring Ohio' patsID{p} '...']);
    summary(p,:) = readTheBook(data);
    
end

%scatter(bcs,wcs);
%[~, ranks] = sort(scores,'desc');

%Rank only valid patients
%ranks = ranks(logical(flags));
        
        
        
        