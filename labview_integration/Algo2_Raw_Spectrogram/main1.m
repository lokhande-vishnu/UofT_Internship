function [class,append]= main1(firstS,data_ch1,data_ch2,data_ch3,data_ch4,append,C_class)


%% Feature Extraction
feas1= featureEx(data_ch1);
feas2= featureEx(data_ch2);
feas3= featureEx(data_ch3);
feas4= featureEx(data_ch4);
feas = [feas1, feas2, feas3, feas4];



%% Prediction
if firstS==0
    load 'trainedClassifier';
    class=predict(trainedClassifier,feas);
else
    class =7;
end

%% Data addition
append=[append;[C_class,feas]];

end