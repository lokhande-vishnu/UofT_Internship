function [allclassifiers] = trainer(pars,cvaldata)


training= permute(cvaldata,[3 2 1]);
len=size(pars,1);
options=[];

for i=1:len
    i
    trainC= training(:,:,i);width=size(trainC,2);
    cul= sum(trainC(:,2:width),2);
    if sum(cul~=0)<5*6
        eig{i}=[];
        trainedClassifier{i}=[];
        continue;
    end
    trainC(cul==0,:)=[];
    
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:width));
    A = trainC(:,2:width)*eigvector;
    eig{i}=eigvector;
    trainedClassifier{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction','gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end
allclassifiers{1,1}=trainedClassifier;
allclassifiers{1,2}=eig;


allclassifiers{2,1}=pars;
end