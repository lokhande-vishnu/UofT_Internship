function class = predictor(allclassifiers,feas)

pars=allclassifiers{7,1};

%Class 1
trialpc= feas;
len=5;
for i=1:len
    order=pars(i,1);
    trainedClassifier1=allclassifiers{1,1};
    eig1=allclassifiers{1,2};
    
    C=trialpc(order,:)*eig1{order};
    [a,b,cost]= predict(trainedClassifier1{order},C);
    predMat2(i,1)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,1)=0;
    end
    
end

%Class 2
trialpc= feas;
for i=1:len
    order=pars(i,2);
    trainedClassifier2=allclassifiers{2,1};
    eig2=allclassifiers{2,2};
    
    C=trialpc(order,:)*eig2{order};
    [~,b]= predict(trainedClassifier2{order},C);
    predMat2(i,2)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,2)=0;
    end
    
end

%Class 3
trialpc= feas;
for i=1:len
    order=pars(i,3);
    trainedClassifier3=allclassifiers{3,1};
    eig3=allclassifiers{3,2};
    
    C=trialpc(order,:)*eig3{order};
    [~,b]= predict(trainedClassifier3{order},C);
    predMat2(i,3)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,3)=0;
    end
    
end

% Class 4
trialpc= feas;
for i=1:len
    order=pars(i,4);
    trainedClassifier4=allclassifiers{4,1};
    eig4=allclassifiers{4,2};
    
    C=trialpc(order,:)*eig4{order};
    [~,b]= predict(trainedClassifier4{order},C);
    predMat2(i,4)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,4)=0;
    end
    
end

%Class 5
trialpc= feas;
for i=1:len
    order=pars(i,5);
    trainedClassifier5=allclassifiers{5,1};
    eig5=allclassifiers{5,2};
    
    C=trialpc(order,:)*eig5{order};
    [~,b]= predict(trainedClassifier5{order},C);
    predMat2(i,5)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,6)=0;
    end
    
end

%Class 6
trialpc= feas;
for i=1:len
    order=pars(i,6);
    trainedClassifier6=allclassifiers{6,1};
    eig6=allclassifiers{6,2};
    
    C=trialpc(order,:)*eig6{order};
    [~,b]= predict(trainedClassifier6{order},C);
    predMat2(i,6)=b(1);
    if sum(trialpc(order,:))==0
        predMat2(i,6)=0;
    end
    
end

% sum(predMat2,1)
[~,class]=min([100*sum(predMat2(:,1)<0)/sum(predMat2(:,1)~=0), 100*sum(predMat2(:,3)<0)/sum(predMat2(:,3)~=0), 100*sum(predMat2(:,4)<0)/sum(predMat2(:,4)~=0), 100*sum(predMat2(:,6)<0)/sum(predMat2(:,6)~=0)]);


% predCum= [predMat2(:,1),predMat2(:,3),predMat2(:,4),predMat2(:,6)];
% [~,predCum(:,5)]=min(predCum,[],2);
% mode(predCum(:,5))
%
% for i=1:2800
% [~,predCum(i,8)]=max([sum(predCum(1:i,7)==1),sum(predCum(1:i,7)==2),sum(predCum(1:i,7)==3),sum(predCum(1:i,7)==4),sum(predCum(1:i,7)==5),sum(predCum(1:i,7)==6)]);
% end
% % mode(predCum(:,7))
% sum(predCum(:,8)==1)
% sum(predCum(:,8)==2)
% sum(predCum(:,8)==3)
% sum(predCum(:,8)==4)
% sum(predCum(:,8)==5)
% sum(predCum(:,8)==6)

end
