function [class,append]= main1(firstS,data_ch1,data_ch2,data_ch3,data_ch4,append,C_class)


%% Feature Extraction
feas1= featureEx(data_ch1);
feas2= featureEx(data_ch2);
feas3= featureEx(data_ch3);
feas4= featureEx(data_ch4);


%% Prediction
if firstS==0
    load 'trainedClassifier';
    p=1
    for i=1:7
        classes(p)=predict(trainedClassifier,cell2mat(feas1(i)));
        p=p+1;
    end
    for i=1:7
        classes(p)=predict(trainedClassifier,cell2mat(feas2(i)));
        p=p+1;
    end
    for i=1:7
        classes(p)=predict(trainedClassifier,cell2mat(feas3(i)));
        p=p+1;
    end
    for i=1:7
        classes(p)=predict(trainedClassifier,cell2mat(feas4(i)));
        p=p+1;
    end
    class= mode(classes);
    
else
    class =7;
end

%% Data addition
p=1;
for i=1:7
    append=[append;[C_class,cell2mat(feas1(i))]];
    p=p+1;
end
for i=1:7
    append=[append;[C_class,cell2mat(feas2(i))]];
    p=p+1;
end
for i=1:7
    append=[append;[C_class,cell2mat(feas3(i))]];
    p=p+1;
end
for i=1:7
    append=[append;[C_class,cell2mat(feas4(i))]];
    p=p+1;
end

end