function [Class_test] = Classify_DSVM(test_data,label,svmstruct,level)
% This function allows to classify test_data using dendogram svm  
%
%Inputs: 
%    test_data: an m by p matrix containing data to classify 
%    label: is an n by 1 vector containing label of n classes, example label =[0 1 2 3 4]
%    labels should be numerical values 
%    svmstruct: an n-1 by 1 cell vector which contains svmstructs resulting from training phase
%    level: svm level in the dendogram (from racine to root) defined in Train_DSVM function
%output:
%    Class_test: is a 1 by m vector containing labels of classified data
%
% Example using fisheriris data
%
%       load fisheriris
%       train_label={zeros(30,1),ones(30,1),2*ones(30,1)};
%       train_cell={meas(1:30,:),meas(51:80,:),meas(101:130,:)};
%       [svmstruct,level] = Train_DSVM(train_cell,train_label);
%       label=[0 1 2];
%       test_mat=[meas(31:40,:);meas(81:90,:);meas(131:140,:)];
%       [Class_test] = Classify_DSVM(test_mat,label,svmstruct,level);
%       labels=[zeros(1,10),ones(1,10),2*ones(1,10)];
%       [Cmat,DA]= confusion_matrix(Class_test,labels,{'A','B','C'})
%
%%%%%%%%%%%

[lg]=size(test_data);
for i=1:lg(1)
test=test_data(i,:);
cond=1;
indx=1;
while cond==1
    class_x=svmclassify(svmstruct{indx},test);
    if (ismember(class_x,label))
        Class_test(i)=class_x;
        cond=0;
    else
        indx=find(level==class_x,1)+1;
        class_x=svmclassify(svmstruct{indx},test);
        if ismember(class_x,label);
        Class_test(i)=class_x;
        cond=0;
        else
        indx=find(level==class_x,1)+1;
        end    
    end
   
end
end

