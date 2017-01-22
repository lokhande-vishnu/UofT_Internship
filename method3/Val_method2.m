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

for i=1:7
    i
        pardata= [permute(cvaldata1(i,:,:),[3 2 1]);permute(cvaldata2(i,:,:),[3 2 1]);permute(cvaldata3(i,:,:),[3 2 1]);permute(cvaldata4(i,:,:),[3 2 1]);permute(cvaldata5(i,:,:),[3 2 1]);permute(cvaldata6(i,:,:),[3 2 1])];
%     pardata= [permute(cvaldata1(i,:,:),[3 2 1]);permute(cvaldata3(i,:,:),[3 2 1]);permute(cvaldata4(i,:,:),[3 2 1]);permute(cvaldata6(i,:,:),[3 2 1])];
    
    % removing the culprits
    len = size(pardata,2);
    cul= sum(pardata(:,2:len),2);
    %     if sum(cul)<60
    %         book(i,:)=[0,0,0,0,0,0];
    %         continue;
    %     end
    pardata(cul==0,:)=[];
    %     ind = [crossvalind('Kfold',sum(pardata(:,1)==1),10);crossvalind('Kfold',sum(pardata(:,1)==2),10);crossvalind('Kfold',sum(pardata(:,1)==3),10);crossvalind('Kfold',sum(pardata(:,1)==4),10);crossvalind('Kfold',sum(pardata(:,1)==5),10);crossvalind('Kfold',sum(pardata(:,1)==6),10)];
    ind = [crossvalind('Kfold',sum(pardata(:,1)==1),10);crossvalind('Kfold',sum(pardata(:,1)==3),10);crossvalind('Kfold',sum(pardata(:,1)==4),10);crossvalind('Kfold',sum(pardata(:,1)==6),10)];
    
    options = [];
    
    for v = 1:10
        valling= pardata((ind == v),:);
        training= pardata(~(ind == v),:);
        
        [eigvector, eigvalue] = mylda(training(:,1), options, training(:,2:len));
        A = training(:,2:len);%*eigvector;
        C = valling(:,2:len);%*eigvector;
        %         trainedClassifier = classifier(A,training(:,1));
        template = templateSVM('KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
        trainedClassifier = fitcecoc(A,training(:,1), 'Learners', template, 'Coding', 'onevsone');
%         trainedClassifier = fitensemble(A,training(:,1), 'Bag', 500, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6]);


        y((ind == v),:)=predict(trainedClassifier,C); d((ind == v),:)=valling(:,1);
    end
    book(i,:)=confumat(d,y);
    
    
end

[~,pars(:,1)] = sort(book(:,1),'descend');
pars(:,2) = book(pars(:,1),1);


