%Test classification in DBN
clc;
res={};
addpath('DeeBNet');
% data = MNIST.prepareMNIST('D:\DataSets\Image\MNIST\');%using MNIST dataset completely.
% data = MNIST.prepareMNIST_Small('+MNIST\');%uncomment this line to use a small part of MNIST dataset.
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
%BP
ticID=tic;
dbn.backpropagation(data);
toc(ticID);
save('dbnAfterBP.mat','dbn');
%test after BP
classNumber=dbn.getOutput(data.testData,'bySampling');
errorAfterBP=sum(classNumber~=data.testLabels)/length(classNumber)