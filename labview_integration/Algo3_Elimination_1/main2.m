function main2(append,firstS)

load 'append2';

if firstS==0
    load 'allclassifiers';
else
    allclassifiers{7,2}=[];
end

cvaldata=cat(3,allclassifiers{7,2},append2);


%%Validating
pars=Val_method1(cvaldata);

%% TRAINING
allclassifiers = trainer(pars,cvaldata);
allclassifiers{7,2}=cvaldata;


%% SAVING THE TRAINED CLASSIFIER
matfile = fullfile(cd, 'allclassifiers.mat');
save(matfile,'allclassifiers');

end