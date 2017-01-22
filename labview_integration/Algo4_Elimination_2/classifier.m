function trainedClassifier = classifier( predictors , response )


% trainedClassifier = fitcdiscr(predictors , response);
% trainedClassifier = fitcknn(predictors , response,'Exponent', '', 'Cost',[0,1;2,0], 'NumNeighbors', 3, 'DistanceWeight', 'Equal');
trainedClassifier = fitcsvm(predictors , response,'Cost',[0,1;2,0], 'KernelFunction', 'gaussian', 'PolynomialOrder',[], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
% trainedClassifier = fitensemble(predictors , response, 'Bag', 50, 'Tree', 'Type', 'Classification');
% trainedClassifier = fitensemble(predictors , response, 'RobustBoost', 50, 'Tree', 'Type', 'Classification', 'LearnRate', 1.000000e-01);
% trainedClassifier = fitensemble(predictors , response, 'Subspace', 25, 'KNN', 'Type', 'Classification', 'NPredToSample', 1);
% trainedClassifier = fitensemble(predictors , response, 'Totalboost', 500, 'Tree', 'Type', 'Classification');

%     Gauassian SVM
% template = templateSVM('KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
% trainedClassifier = fitcecoc(predictors , response, 'Learners', template, 'Coding', 'onevsone');


end

