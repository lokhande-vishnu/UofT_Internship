
% Saving the classifiers

% tpar1= (bookc1(:,1)>50 & bookc1(:,2)>40); sum(tpar1)
% training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
len=size(pars,1);
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:31),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig1{i}=[];
        trainedClassifier1{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=1,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:31));
    A = trainC(:,2:31)*eigvector;
    eig1{i}=eigvector;
    trainedClassifier1{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction','gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end


% tpar2= (bookc2(:,1)>60 & bookc2(:,2)>40); sum(tpar2)
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:21),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig2{i}=[];
        trainedClassifier2{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=2,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:21));
    A = trainC(:,2:21)*eigvector;
    eig2{i}=eigvector;
    trainedClassifier2{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end


% tpar3= (bookc3(:,1)>60 & bookc3(:,2)>42); sum(tpar3)
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:21),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig3{i}=[];
        trainedClassifier3{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=3,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:21));
    A = trainC(:,2:21)*eigvector;
    eig3{i}=eigvector;
    trainedClassifier3{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end


% tpar4= (bookc4(:,1)>50 & bookc4(:,2)>40); sum(tpar4)
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:21),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig4{i}=[];
        trainedClassifier4{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=4,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:21));
    A = trainC(:,2:21)*eigvector;
    eig4{i}=eigvector;
    trainedClassifier4{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end


% tpar5= (bookc5(:,1)>60 & bookc5(:,2)>40); sum(tpar5)
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:21),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig5{i}=[];
        trainedClassifier5{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=5,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:21));
    A = trainC(:,2:21)*eigvector;
    eig5{i}=eigvector;
    trainedClassifier5{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end


% tpar6= (bookc6(:,1)>50 & bookc6(:,2)>30); sum(tpar6)
training= [permute(cvaldata1(:,:,:),[3 2 1]);permute(cvaldata2(:,:,:),[3 2 1]);permute(cvaldata3(:,:,:),[3 2 1]);permute(cvaldata4(:,:,:),[3 2 1]);permute(cvaldata5(:,:,:),[3 2 1]);permute(cvaldata6(:,:,:),[3 2 1])];
for i=1:len
    i
    trainC= training(:,:,i);
    cul= sum(trainC(:,2:21),2);
    trainC(cul==0,:)=[];
    if sum(cul~=0)<60
        eig6{i}=[];
        trainedClassifier6{i}=[];
        continue;
    end
    trainC(trainC(:,1)~=6,1)=0;
    [eigvector, eigvalue] = mylda(trainC(:,1), options, trainC(:,2:21));
    A = trainC(:,2:21)*eigvector;
    eig6{i}=eigvector;
    trainedClassifier6{i}= fitcsvm(A, trainC(:,1),'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
end



