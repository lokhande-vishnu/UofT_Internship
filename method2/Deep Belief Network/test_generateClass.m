%Test generateClass function for Discriminative RBM
clc;
clear;
addpath('DeeBNet');
data = MNIST.prepareMNIST('D:\DataSets\Image\MNIST\');%using MNIST dataset completely.
% data = MNIST.prepareMNIST_Small('+MNIST\');%uncomment this line to use a small part of MNIST dataset.
data.normalize('minmax');
data.validationData=data.testData;
data.validationLabels=data.testLabels;

% RBM
rbmParams=RbmParameters(1000,ValueType.binary);
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
rbmParams.performanceMethod='classification';
rbm=DiscriminativeRBM(rbmParams);
rbmParams.maxEpoch=200;

%train
rbm.train(data);
%Generate data
L=([0:9]'*ones(10,1)')';
generatedData=rbm.generateClass(L(:),1000);
DataClasses.DataStore.plotData({generatedData},1);