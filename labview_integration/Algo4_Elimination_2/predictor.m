function class = predictor(allclassifiers,feas)

pars=allclassifiers{2,1};

%all Class 
trialpc= feas;
len=5;
for i=1:len
    order=pars(i,1);
    trainedClassifier=allclassifiers{1,1};
    eig=allclassifiers{1,2};
    
    C=trialpc(order,:)*eig{order};
    [a,b,cost]= predict(trainedClassifier{order},C);
    predMat2(i,1)=b(1);
    predMat2(i,2)=b(2);
    predMat2(i,3)=b(3);
    predMat2(i,4)=b(4);
    predMat2(i,5)=b(5);
    
    if sum(trialpc(order,:))==0
        predMat2(i,1)=0;
        predMat2(i,2)=0;
        predMat2(i,3)=0;
        predMat2(i,4)=0;
        predMat2(i,5)=0;
    end
    
end

[~,class]=min([100*sum(predMat2(:,1)<0)/sum(predMat2(:,1)~=0), 100*sum(predMat2(:,3)<0)/sum(predMat2(:,3)~=0), 100*sum(predMat2(:,4)<0)/sum(predMat2(:,4)~=0), 100*sum(predMat2(:,6)<0)/sum(predMat2(:,6)~=0)]);

end
