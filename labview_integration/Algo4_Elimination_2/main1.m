function [class,append]= main1(firstS,data_ch1,data_ch2,data_ch3,data_ch4,append,C_class)


%% Feature Extraction
feas= featureEx(data_ch1,data_ch2,data_ch3,data_ch4);

%% Prediction
if firstS==0
    load 'allclassifiers';
    class=predictor(allclassifiers,feas);
else
    class =7;
end

%% Data addition

%Saving is required as labview is unable to process multi-dimensional data
if size(append,1)==0
    append2=[];
else
    load 'append2';
end

append=1;
append2=cat(3,append2,[C_class*ones(size(feas,1),1),feas]);
matfile = fullfile(cd, 'append2.mat');
save(matfile,'append2');


end