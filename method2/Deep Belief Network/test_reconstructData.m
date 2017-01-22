%Test reconstructData function for Generative RBM
clc;
clear;
addpath('DeeBNet');
data = MNIST.prepareMNIST('D:\DataSets\Image\MNIST\');%using MNIST dataset completely.
% data = MNIST.prepareMNIST_Small('+MNIST\');%uncomment this line to use a small part of MNIST dataset.
data.normalize('minmax');
data.validationData=data.testData;
data.validationLabels=data.testLabels;

% RBM
rbmParams=RbmParameters(250,ValueType.binary);
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
rbmParams.performanceMethod='reconstruction';
rbm=GenerativeRBM(rbmParams);

%train
rbm.train(data);

noisyData=imnoise(data.testData(1:9,:),'gaussian',0,0.02);
[reconstructedData]=rbm.reconstructData(noisyData,5);

DataClasses.DataStore.plotData({data.testData(1:9,:),noisyData,reconstructedData},1);
