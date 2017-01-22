function [cp]=crossval_svm(data,label,sigma,k)
%This fucnction allows to perform k-folds cross validation process using
%SVM classifier.
%Inputs:
%data:N by M feature's matrix  
%label:Vector (whith length N) of labels correspanding to data matrix, 
%sigma: RBF_sigma
%k : number of folds to perform cross validation 
%Output: 
%cp: struct containing cross validation performances

cvFolds = crossvalind('Kfold', label,k);   
cp = classperf(label);                      

for i = 1:k                                  
    testIdx = (cvFolds == i);                
    trainIdx = ~testIdx;                    

    % train an SVM model over training instances
    svmModel = svmtrain(data(trainIdx,:), label(trainIdx), ...
                  'Showplot',false,'Kernel_Function','rbf', 'RBF_sigma',sigma);%, 'RBF_Sigma',1.5

    % test using test instances
    pred = svmclassify(svmModel, data(testIdx,:));

    % evaluate and update performance object
    cp = classperf(cp, pred, testIdx);
end

% get accuracy
cp.CorrectRate

% get confusion matrix
% columns:actual, rows:predicted, last-row: unclassified instances
cp.CountingMatrix
end