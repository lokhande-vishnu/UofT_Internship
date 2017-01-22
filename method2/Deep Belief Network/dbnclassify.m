% Testing of Deep Belief network
clc;
res={};

response=train_data1(:,1);
predictors=train_data1(:,2:12001);
indices = crossvalind('Kfold',size(response,1)/(6),5);
i = 1;
test_set = (indices == i); train_set = ~test_set;
    test_set = repmat(test_set,(6),1);    train_set = repmat(train_set,(6),1);
    a=predictors(train_set,:); a_label=response(train_set,:);
    c=predictors(test_set,:); c_label=response(test_set,:);

data=DataClasses.DataStore();
data.trainData=a;
data.trainLabels=a_label;
data.testData=c;
data.testLabels=c_label;


data.normalize('minmax');
data.validationData=data.testData;
data.validationLabels=data.testLabels;
dbn=DBN('classifier');

% RBM1
rbmParams=RbmParameters(500,ValueType.binary);
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
dbn.addRBM(rbmParams);
% RBM2
rbmParams=RbmParameters(500,ValueType.binary);
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
dbn.addRBM(rbmParams);
% RBM3
rbmParams=RbmParameters(2000,ValueType.binary);
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
rbmParams.rbmType=RbmType.discriminative;
dbn.addRBM(rbmParams);
%train
ticID=tic;
dbn.train(data);
toc(ticID)
save('dbnBeforeBP.mat','dbn');
%test train
classNumber=dbn.getOutput(data.testData,'bySampling');
errorBeforeBP=sum(classNumber~=data.testLabels)/length(classNumber)
plotconfusion(ind2vec(data.testLabels'),ind2vec(classNumber'))

%BP
ticID=tic;
dbn.backpropagation(data);
toc(ticID);
save('dbnAfterBP.mat','dbn');
%test after BP
classNumber=dbn.getOutput(data.testData,'bySampling');
errorAfterBP=sum(classNumber~=data.testLabels)/length(classNumber)
plotconfusion(ind2vec(data.testLabels'),ind2vec(classNumber'))