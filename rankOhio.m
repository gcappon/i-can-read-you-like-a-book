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
    [bcs(p), wcs(p), flags(p)] = readTheBook(data,1,0);
    
end



scatter(bcs(logical(flags)),wcs(logical(flags)))
for f = 1:length(flags)
    if(logical(flags(f)))
        text(bcs(f), wcs(f), patsID{f});
    end
end
%[~, ranks] = sort(scores,'desc');

%Rank only valid patients
%ranks = ranks(logical(flags));
        
        