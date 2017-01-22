addpath('G:\vishnu\Tanh fit')
train_label={zeros(len,1),ones(len,1),2*ones(len,1),3*ones(len,1),4*ones(len,1),5*ones(len,1)};
train_cell={train(1:len,:),train((len+1):2*len,:),train((2*len+1):3*len,:),train((3*len+1):4*len,:),train((4*len+1):5*len,:),train((5*len+1):6*len,:)};
[svmstruct,level] = Train_DSVM(train_cell,train_label);

label=[0 1 2 3 4 5];
[Class_test] = Classify_DSVM(train,label,svmstruct,level);
train_labels=[zeros(1,len),ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len)];
[Cmat,DA]= confusion_matrix(Class_test,train_labels,{'A','B','C','D','E','F'})

u=label';
numClasses=length(u);
train_labels=[zeros(1,len),ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len)]';
%build models
for k=1:numClasses
    G1vAll=(train_labels==u(k));
    svm2struct(k) = svmtrain(train,G1vAll,'Kernel_Function','rbf');
end
%testing
for j=1:size(train,1)
    for k=1:numClasses
        if(svmclassify(svm2struct(k),train(j,:)))
            break;
        end
    end
    Class2_test(1,j) = k-1;
end
[Cmat2,DA2]= confusion_matrix(Class2_test,train_labels,{'A','B','C','D','E','F'})
