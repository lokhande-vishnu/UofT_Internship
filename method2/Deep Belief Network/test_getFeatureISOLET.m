%Test getFeature function for autoEncoder DBN
clc
clear;
addpath('DeeBNet');
rng('shuffle');
data = ISOLET.prepareISOLET('D:\DataSets\Voice\ISOLET\');
data.normalize('meanvar');
data.shuffle();

dbn=DBN();
dbn.dbnType='autoEncoder';
% RBM1
rbmParams=RbmParameters(2000,ValueType.binary);
rbmParams.maxEpoch=2;
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.FEPCD;
dbn.addRBM(rbmParams);
% RBM2
rbmParams=RbmParameters(1000,ValueType.binary);
rbmParams.maxEpoch=2;
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.CD;
dbn.addRBM(rbmParams);
% RBM3
rbmParams=RbmParameters(500,ValueType.binary);
rbmParams.maxEpoch=2;
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.CD;
dbn.addRBM(rbmParams);
% RBM4
rbmParams=RbmParameters(250,ValueType.binary);
rbmParams.maxEpoch=2;
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.CD;
dbn.addRBM(rbmParams);
% RBM5
rbmParams=RbmParameters(3,ValueType.gaussian);
rbmParams.maxEpoch=2;
rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.CD;
dbn.addRBM(rbmParams);

dbn.train(data);
save('dbn-BP.mat','dbn');
dbn.backpropagation(data);
save('dbn+BP.mat','dbn');
%% plot
figure;
plotFig=[{'mo' 'go' 'm+' 'r+' 'ro' 'k+' 'g+' 'ko' 'bo' 'b+'}];
lgVec=[];
rp=randperm(26)-1;
for i=1:10
    img=data.trainData(data.trainLabels==rp(i),:);
    ext=dbn.getFeature(img);
    plot3(ext(:,1),ext(:,2),ext(:,3),plotFig{i});hold on;
    lgVec=[lgVec;{int2str(rp(i)+1)}];
end
legend(lgVec);
hold off;