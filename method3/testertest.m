clc
trial= testdata4(:,:,2);

%Class 1
trialpc= trial;
len=200;
for i=1:len
    order=pars(i,1);
    C=trialpc(order,2:21)*eig1{order};
    [a,b,cost]= predict(trainedClassifier1{order},C);
    predMat2(i,1)=b(1);
    if sum(trialpc(order,2:21))==0
        predMat2(i,1)=0;
    end
    trueMat2(i,1)= trialpc(i,1);
end

% %Class 2
% trialpc= trial;
% for i=1:len
%     order=pars(i,2);
%     C=trialpc(order,2:21)*eig2{order};
%     [~,b]= predict(trainedClassifier2{order},C);
%     predMat2(i,2)=b(1);
%     trueMat(i,2)= trialpc(i,1);
% end

%Class 3
trialpc= trial;
for i=1:len
    order=pars(i,3);
    C=trialpc(order,2:21)*eig3{order};
    [~,b]= predict(trainedClassifier3{order},C);
    predMat2(i,3)=b(1);
    if sum(trialpc(order,2:21))==0
        predMat2(i,3)=0;
    end
    trueMat(i,3)= trialpc(i,1);
end

%Class 4
trialpc= trial;
for i=1:len
    order=pars(i,5);
    C=trialpc(order,2:21)*eig4{order};
   [~,b]= predict(trainedClassifier4{order},C);
    predMat2(i,4)=b(1);
    if sum(trialpc(order,2:21))==0
        predMat2(i,4)=0;
    end
    trueMat(i,4)= trialpc(i,1);
end

% %Class 5
% trialpc= trial;
% for i=1:len
%     order=pars(i,5);
%     C=trialpc(order,2:21)*eig5{order};
%    [~,b]= predict(trainedClassifier5{order},C);
%     predMat2(i,5)=b(1);
%     trueMat(i,5)= trialpc(i,1);
% end

%Class 6
trialpc= trial;
for i=1:len
    order=pars(i,7);
    C=trialpc(order,2:21)*eig6{order};
    [~,b]= predict(trainedClassifier6{order},C);
    predMat2(i,6)=b(1);
    if sum(trialpc(order,2:21))==0
        predMat2(i,6)=0;
    end
    trueMat(i,6)= trialpc(i,1);
end

% sum(predMat2,1)
100*sum(predMat2(:,1)<0)/sum(predMat2(:,1)~=0), 100*sum(predMat2(:,3)<0)/sum(predMat2(:,3)~=0), 100*sum(predMat2(:,4)<0)/sum(predMat2(:,4)~=0), 100*sum(predMat2(:,6)<0)/sum(predMat2(:,6)~=0) 
predCum= [predMat2(:,1),predMat2(:,3),predMat2(:,4),predMat2(:,6)];
[~,predCum(:,5)]=min(predCum,[],2);
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
