% function [trainedClassifier] = explicitcrossval_time(train)
% load('datasetrerd'); len=23;
clearvars -except train_data1 train_data2 train_data3 train_data4 train_data5 train_data6
[cvalInd1,~,testInd1] = dividerand(size(train_data1,3),0.8,0,0.2);
[cvalInd2,~,testInd2] = dividerand(size(train_data2,3),0.8,0,0.2);
[cvalInd3,~,testInd3] = dividerand(size(train_data3,3),0.8,0,0.2);
[cvalInd4,~,testInd4] = dividerand(size(train_data4,3),0.8,0,0.2);
[cvalInd5,~,testInd5] = dividerand(size(train_data5,3),0.8,0,0.2);
[cvalInd6,~,testInd6] = dividerand(size(train_data6,3),0.8,0,0.2);

cvaldata1= train_data1(:,:,cvalInd1); testdata1= train_data1(:,:,testInd1);
cvaldata2= train_data2(:,:,cvalInd2); testdata2= train_data2(:,:,testInd2);
cvaldata3= train_data3(:,:,cvalInd3); testdata3= train_data3(:,:,testInd3);
cvaldata4= train_data4(:,:,cvalInd4); testdata4= train_data4(:,:,testInd4);
cvaldata5= train_data5(:,:,cvalInd5); testdata5= train_data5(:,:,testInd5);
cvaldata6= train_data6(:,:,cvalInd6); testdata6= train_data6(:,:,testInd6);


for i=1:2800
    i
    % Data Preparation
    pardata= [permute(cvaldata1(i,:,:),[3 2 1]);permute(cvaldata2(i,:,:),[3 2 1]);permute(cvaldata3(i,:,:),[3 2 1]);permute(cvaldata4(i,:,:),[3 2 1]);permute(cvaldata5(i,:,:),[3 2 1]);permute(cvaldata6(i,:,:),[3 2 1])];
    
    % removing the culprits
    cul= sum(pardata(:,2:21),2);
    pardata(cul==0,:)=[];
    
    ind = [crossvalind('Kfold',sum(pardata(:,1)==1),10);crossvalind('Kfold',sum(pardata(:,1)==2),10);crossvalind('Kfold',sum(pardata(:,1)==3),10);crossvalind('Kfold',sum(pardata(:,1)==4),10);crossvalind('Kfold',sum(pardata(:,1)==5),10);crossvalind('Kfold',sum(pardata(:,1)==6),10)];
    
    
    for v = 1:10
        valling= pardata((ind == v),:);
        training= pardata(~(ind == v),:);
        %     Adding some additional features
        %                 training(:,52)=sum(training(:,2:21),2); valling(:,52)=sum(valling(:,2:21),2);
        %                 training(:,53)=rms(training(:,2:21),2); valling(:,53)=rms(valling(:,2:21),2);
        %                 training(:,54)=std(training(:,2:21),[],2); valling(:,54)=std(valling(:,2:21),[],2);
        %                 training(:,55)=rssq(training(:,2:21),2); valling(:,55)=rssq(valling(:,2:21),2);
        %
        
        % One vs. all classification
        trainc1 = training; trainc2 = training; trainc3 = training; trainc4 = training; trainc5 = training; trainc6 = training;
        valc1 = valling; valc2 = valling; valc3 = valling; valc4 = valling; valc5 = valling; valc6 = valling;
        options = [];
        
        %class 1
        trainc1(trainc1(:,1)~=1,1)=0;   valc1(valc1(:,1)~=1,1)=0;
        [eigvector, eigvalue] = mylda(trainc1(:,1), options, trainc1(:,2:21));
        A = trainc1(:,2:21)*eigvector;
        C = valc1(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc1(:,1));
        y1((ind == v),:)=predict(trainedClassifier,C); d1((ind == v),:)=valc1(:,1);
        
        
        %class 2
        trainc2(trainc2(:,1)~=2,1)=0;   valc2(valc2(:,1)~=2,1)=0;
        [eigvector, eigvalue] = mylda(trainc2(:,1), options, trainc2(:,2:21));
        A = trainc2(:,2:21)*eigvector;
        C = valc2(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc2(:,1));
        y2((ind == v),:)=predict(trainedClassifier,C); d2((ind == v),:)=valc2(:,1);
        
        
        %class 3
        trainc3(trainc3(:,1)~=3,1)=0;   valc3(valc3(:,1)~=3,1)=0;
        [eigvector, eigvalue] = mylda(trainc3(:,1), options, trainc3(:,2:21));
        A = trainc3(:,2:21)*eigvector;
        C = valc3(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc3(:,1));
        y3((ind == v),:)=predict(trainedClassifier,C); d3((ind == v),:)=valc3(:,1);
        
        
        %class 4
        trainc4(trainc4(:,1)~=4,1)=0;   valc4(valc4(:,1)~=4,1)=0;
        [eigvector, eigvalue] = mylda(trainc4(:,1), options, trainc4(:,2:21));
        A = trainc4(:,2:21)*eigvector;
        C = valc4(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc4(:,1));
        y4((ind == v),:)=predict(trainedClassifier,C); d4((ind == v),:)=valc4(:,1);
        
        
        %class 5
        trainc5(trainc5(:,1)~=5,1)=0;   valc5(valc5(:,1)~=5,1)=0;
        [eigvector, eigvalue] = mylda(trainc5(:,1), options, trainc5(:,2:21));
        A = trainc5(:,2:21)*eigvector;
        C = valc5(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc5(:,1));
        y5((ind == v),:)=predict(trainedClassifier,C); d5((ind == v),:)=valc5(:,1);
        
        
        
        %class 6
        trainc6(trainc6(:,1)~=6,1)=0;   valc6(valc6(:,1)~=6,1)=0;
        [eigvector, eigvalue] = mylda(trainc6(:,1), options, trainc6(:,2:21));
        A = trainc6(:,2:21)*eigvector;
        C = valc6(:,2:21)*eigvector;
        trainedClassifier = classifier(A,trainc6(:,1));
        y6((ind == v),:)=predict(trainedClassifier,C); d6((ind == v),:)=valc6(:,1);
        
    end
    bookc1(i,:)=confumat2(d1,y1);
    bookc2(i,:)=confumat2(d2,y2);
    bookc3(i,:)=confumat2(d3,y3);
    bookc4(i,:)=confumat2(d4,y4);
    bookc5(i,:)=confumat2(d5,y5);
    bookc6(i,:)=confumat2(d6,y6);
    
    
end
[~,ind]=max(bookc1(:,2)+bookc1(:,1)); ind, bookc1(ind,:)
[~,ind]=max(bookc2(:,2)+bookc2(:,1)); ind, bookc2(ind,:)
[~,ind]=max(bookc3(:,2)+bookc3(:,1)); ind, bookc3(ind,:)
[~,ind]=max(bookc4(:,2)+bookc4(:,1)); ind, bookc4(ind,:)
[~,ind]=max(bookc5(:,2)+bookc5(:,1)); ind, bookc5(ind,:)
[~,ind]=max(bookc6(:,2)+bookc6(:,1)); ind, bookc6(ind,:)

[~,pars(:,1)] = sort(bookc1(:,2)+bookc1(:,1),'descend');
[~,pars(:,2)] = sort(bookc2(:,2)+bookc2(:,1),'descend');
[~,pars(:,3)] = sort(bookc3(:,2)+bookc3(:,1),'descend');
[~,pars(:,4)] = sort(bookc4(:,2)+bookc4(:,1),'descend');
[~,pars(:,5)] = sort(bookc5(:,2)+bookc5(:,1),'descend');
[~,pars(:,6)] = sort(bookc6(:,2)+bookc6(:,1),'descend');

