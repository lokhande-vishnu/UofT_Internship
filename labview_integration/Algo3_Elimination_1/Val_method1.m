function [pars] = Val_method1(cvaldata)

for i=1:size(cvaldata,1)
    i
    % Data Preparation
    pardata= permute(cvaldata(i,:,:),[3 2 1]);
    
    % removing the culprits
    len = size(pardata,2);
%     cul= sum(pardata(:,2:size(pardata,2)),2);    
%     if sum(cul~=0)<5*6
%         bookc1(i,:)=[0,0,0];
%         bookc2(i,:)=[0,0,0];
%         bookc3(i,:)=[0,0,0];
%         bookc4(i,:)=[0,0,0];
%         bookc5(i,:)=[0,0,0];
%         bookc6(i,:)=[0,0,0];
%         continue;
%     end
%     pardata(cul==0,:)=[];
        
    ind = [crossvalind('Kfold',sum(pardata(:,1)==1),2);crossvalind('Kfold',sum(pardata(:,1)==2),2);crossvalind('Kfold',sum(pardata(:,1)==3),2);crossvalind('Kfold',sum(pardata(:,1)==4),2);crossvalind('Kfold',sum(pardata(:,1)==5),2);crossvalind('Kfold',sum(pardata(:,1)==6),2)];
   
    
    for v = 1:2
        valling= pardata((ind == v),:);
        training= pardata(~(ind == v),:);
               
        
        % One vs. all classification
        trainc1 = training; trainc2 = training; trainc3 = training; trainc4 = training; trainc5 = training; trainc6 = training;
        valc1 = valling; valc2 = valling; valc3 = valling; valc4 = valling; valc5 = valling; valc6 = valling;
        options = [];
        
        %class 1
        trainc1(trainc1(:,1)~=1,1)=0;   valc1(valc1(:,1)~=1,1)=0;
        [eigvector, eigvalue] = mylda(trainc1(:,1), options, trainc1(:,2:len));
        A = trainc1(:,2:len);*eigvector;
        C = valc1(:,2:len);*eigvector;
        trainedClassifier = classifier(A,trainc1(:,1));
        y1((ind == v),:)=predict(trainedClassifier,C); d1((ind == v),:)=valc1(:,1);
        
        
        %class 2
        trainc2(trainc2(:,1)~=2,1)=0;   valc2(valc2(:,1)~=2,1)=0;
        [eigvector, eigvalue] = mylda(trainc2(:,1), options, trainc2(:,2:len));
        A = trainc2(:,2:len);*eigvector;
        C = valc2(:,2:len);*eigvector;
        trainedClassifier = classifier(A,trainc2(:,1));
        y2((ind == v),:)=predict(trainedClassifier,C); d2((ind == v),:)=valc2(:,1);
        
        %class 3
        trainc3(trainc3(:,1)~=3,1)=0;   valc3(valc3(:,1)~=3,1)=0;
        [eigvector, eigvalue] = mylda(trainc3(:,1), options, trainc3(:,2:len));
        A = trainc3(:,2:len);*eigvector;
        C = valc3(:,2:len);*eigvector;
        trainedClassifier = classifier(A,trainc3(:,1));
        y3((ind == v),:)=predict(trainedClassifier,C); d3((ind == v),:)=valc3(:,1);
        
        
        %class 4
        trainc4(trainc4(:,1)~=4,1)=0;   valc4(valc4(:,1)~=4,1)=0;
        [eigvector, eigvalue] = mylda(trainc4(:,1), options, trainc4(:,2:len));
        A = trainc4(:,2:len);*eigvector;
        C = valc4(:,2:len);*eigvector;
        trainedClassifier = classifier(A,trainc4(:,1));
        y4((ind == v),:)=predict(trainedClassifier,C); d4((ind == v),:)=valc4(:,1);
        
        
        %class 5
        trainc5(trainc5(:,1)~=5,1)=0;   valc5(valc5(:,1)~=5,1)=0;
        [eigvector, eigvalue] = mylda(trainc5(:,1), options, trainc5(:,2:len));
        A = trainc5(:,2:len);*eigvector;
        C = valc5(:,2:len);*eigvector;
        trainedClassifier = classifier(A,trainc5(:,1));
        y5((ind == v),:)=predict(trainedClassifier,C); d5((ind == v),:)=valc5(:,1);
        
        
        
        %class 6
        trainc6(trainc6(:,1)~=6,1)=0;   valc6(valc6(:,1)~=6,1)=0;
        [eigvector, eigvalue] = mylda(trainc6(:,1), options, trainc6(:,2:len));
        A = trainc6(:,2:len);*eigvector;
        C = valc6(:,2:len);*eigvector;
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


[~,pars(:,1)] = sort(bookc1(:,2)+bookc1(:,3),'descend');
[~,pars(:,2)] = sort(bookc2(:,2)+bookc2(:,1),'descend');
[~,pars(:,3)] = sort(bookc3(:,2)+bookc3(:,3),'descend');
[~,pars(:,4)] = sort(bookc4(:,2)+bookc4(:,3),'descend');
[~,pars(:,5)] = sort(bookc5(:,2)+bookc5(:,3),'descend');
[~,pars(:,6)] = sort(bookc6(:,2)+bookc6(:,3),'descend');

end


