function [pars] = Val_method2(cvaldata)

for i=1:size(cvaldata,1)
    i
    % Data Preparation
    pardata= permute(cvaldata(i,:,:),[3 2 1]);
    
    % removing the culprits
    len = size(pardata,2);
    cul= sum(pardata(:,2:size(pardata,2)),2);
    if sum(cul~=0)<5*6
        book(i,:)=[0,0,0,0,0,0];
        continue;
    end
    pardata(cul==0,:)=[];
    
    ind = [crossvalind('Kfold',sum(pardata(:,1)==1),5);crossvalind('Kfold',sum(pardata(:,1)==2),5);crossvalind('Kfold',sum(pardata(:,1)==3),5);crossvalind('Kfold',sum(pardata(:,1)==4),5);crossvalind('Kfold',sum(pardata(:,1)==5),5);crossvalind('Kfold',sum(pardata(:,1)==6),5)];
    
    for v = 1:5
        valling= pardata((ind == v),:);
        training= pardata(~(ind == v),:);
        options = [];
        
        [eigvector, eigvalue] = mylda(training(:,1), options, training(:,2:len));
        A = training(:,2:len)*eigvector;
        C = valling(:,2:len)*eigvector;
        
        template = templateSVM('KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
        trainedClassifier = fitcecoc(A,training(:,1), 'Learners', template, 'Coding', 'onevsone');
        
        %         trainedClassifier = fitensemble(A,training(:,1), 'Bag', 500, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6]);
        
        
        y((ind == v),:)=predict(trainedClassifier,C); d((ind == v),:)=valling(:,1);
    end
    book(i,:)=confumat(d,y);
    
    
end

[~,pars(:,1)] = sort(book(:,1),'descend');
pars(:,2) = book(pars(:,1),1);

end
