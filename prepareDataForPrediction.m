%Prepare targets
data.y30 = [data.CGM(7:end); nan(6,1)];
data.y60 = [data.CGM(13:end); nan(12,1)];

%Remove nans
data(isnan(data.CGM),:) = [];
data(isnan(data.y30),:) = [];
data(isnan(data.y60),:) = [];

%Prepare train and test set
cutoff = round(height(data)*0.8);
Xtr = data(1:cutoff,:);
Xte = data((cutoff+1):end,:);

%Ytr = data.y30(1:cutoff);
%Yte = data.y30((cutoff+1):end);
Ytr = data.y60(1:cutoff);
Yte = data.y60((cutoff+1):end);

%Remove useless column
Xtr.insulin = Xtr.bolus+Xtr.basal;
Xte.insulin = Xte.bolus+Xte.basal;

toRemove = {'SMBG','CHOLabel','basal','bolus','bolusLabel','y30','y60'};
for r = toRemove
    Xtr.(r{:}) = [];
    Xte.(r{:}) = [];
end

%Transform to matrix
Xtr = timetable2table(Xtr);
Xte = timetable2table(Xte);
Xtr = table2array(Xtr(:,2:end));
Xte = table2array(Xte(:,2:end));

