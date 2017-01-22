function main2(append,firstS)

%% Appending the dataset
if firstS==0
    load 'trainedClassifier';
else
    trainedClassifier.Y=[]; trainedClassifier.X=[];
end
Y=[trainedClassifier.Y;append(:,1)];
X=[trainedClassifier.X;append(:,2:size(append,2))];

%% TRAINING
trainedClassifier = fitensemble(X,Y, 'Bag', 500, 'Tree', 'Type', 'Classification');



%% SAVING THE TRAINED CLASSIFIER
matfile = fullfile(cd, 'trainedClassifier.mat');
save(matfile,'trainedClassifier');

end