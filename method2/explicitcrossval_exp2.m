% function [trainedClassifier] = explicitcrossval(train)
clearvars -except train_data1
% X=pcame(train_data1(:,2:151),150);
% train_data1=[train_data1(:,1),X];
for f=19
    f
    response=train_data1(:,1,f);
    predictors=train_data1(:,2:401,f);
    % indices = crossvalind('Kfold',size(response,1)/(6),25);
    indices = [crossvalind('Kfold',sum(response==1),5);crossvalind('Kfold',sum(response==2),5);crossvalind('Kfold',sum(response==3),5);crossvalind('Kfold',sum(response==4),5);crossvalind('Kfold',sum(response==5),5);crossvalind('Kfold',sum(response==6),5)];
    for i = 1:5
        test_set = (indices == i); train_set = ~test_set;
        %     test_set = repmat(test_set,(6),1);    train_set = repmat(train_set,(6),1);
        a=predictors(train_set,:); a_label=response(train_set,:);
        c=predictors(test_set,:); c_label=response(test_set,:);
        
        %transformation
        %     options = [];
        %     options.Fisherface = 1;
        %     [eigvector, eigvalue] = mylda(a_label, options, a);
        %     A = a*eigvector;
        %     C = c*eigvector;
        
        %transformation
        %     no_dims = round(intrinsic_dim(a, 'MLE'));
        %     disp(['MLE estimate of intrinsic dimensionality: ' num2str(no_dims)]);
        %     [AC, mapping] = compute_mapping([a;c], 'PCA', no_dims); A=AC(1:size(a,1),:); C=AC(1:size(c,1),:);
        %
        %     [A, mapping] = compute_mapping([a], 'PCA', no_dims);C = out_of_sample(c,mapping);
        
        A=a; C=c;
        
        %     Gauassian SVM
        %     template = templateSVM('KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 0);
        %     trainedClassifier = fitcecoc(A,a_label, 'Learners', template, 'Coding', 'onevsone');
        %
        %     Cubic SVM
        %     template = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder', 3, 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1,'CategoricalPredictors',1);
        %     trainedClassifier = fitcecoc(A,a_label, 'Learners', template, 'Coding', 'onevsone');
        %
        
        %       fine KNN
        %     trainedClassifier = fitcknn(A,a_label,'ClassNames', [1 2 3 4 5 6], 'Distance', 'Euclidean', 'Exponent', '', 'NumNeighbors', 2, 'DistanceWeight', 'Equal', 'StandardizeData', 1);
        
        %     simple tree
        %     trainedClassifier = fitctree(A,a_label,'ClassNames', [1 2 3 4 5 6], 'SplitCriterion', 'gdi', 'MaxNumSplits', 10, 'Surrogate', 'off');
        
        
        %     trainedClassifier = fitensemble(A,a_label, 'AdaBoostM2', 200, 'Tree', 'Type', 'Classification', 'LearnRate', 1.000000e-01, 'ClassNames', [1 2 3 4 5 6]);
        trainedClassifier = fitensemble(A,a_label, 'Bag', 500, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6]);
        %     trainedClassifier = fitensemble(A,a_label, 'Subspace', 200, 'Discriminant', 'Type', 'Classification', 'NPredToSample', floor(size(A,2)/2),'ClassNames', [1 2 3 4 5 6]);
        %     trainedClassifier = fitensemble(A,a_label, 'RUSBoost', 200, 'Tree', 'Type', 'Classification', 'LearnRate', 1.000000e-01, 'ClassNames', [1 2 3 4 5 6]);
        
        %     trainFcn = 'trainscg';
        %     hiddenLayerSize = 30;
        %     net = patternnet(hiddenLayerSize);
        %     net.divideParam.trainRatio = 100/100;
        %     net.divideParam.valRatio = 0/100;
        %     net.divideParam.testRatio = 0/100;
        %     a=a';b=b';
        %     % predictors to be input in row format
        %     % responses row format + vector form
        %     [net,tr] = train(net,a, full(ind2vec(b)));
        %
        %     [~,yall(1,test_set)] = max(net(predictors(test_set,:)'),[],1);
        %     y = net(predictors(test_set,:)');
        %     [~,y]=max(y',[],2);
        
        %     yall(test_set,:) = predict(trainedClassifier,predictors(test_set,:));
        
        yall(test_set,:) = predict(trainedClassifier,C);
        %     y=predict(trainedClassifier,C);
        %
        %
        %
        %         num=sum(test_set(1:size(response,1)/(6*8),1))
        %         d3{1,1}=[c_label((00*num+1):(01*num),1),c_label((01*num+1):(02*num),1),c_label((02*num+1):(03*num),1),c_label((03*num+1):(04*num),1),c_label((04*num+1):(05*num),1),c_label((05*num+1):(06*num),1),c_label((06*num+1):(07*num),1),c_label((07*num+1):(08*num),1)];
        %         d3{2,1}=[c_label((08*num+1):(09*num),1),c_label((09*num+1):(10*num),1),c_label((10*num+1):(11*num),1),c_label((11*num+1):(12*num),1),c_label((12*num+1):(13*num),1),c_label((13*num+1):(14*num),1),c_label((14*num+1):(15*num),1),c_label((15*num+1):(16*num),1)];
        %         d3{3,1}=[c_label((16*num+1):(17*num),1),c_label((17*num+1):(18*num),1),c_label((18*num+1):(19*num),1),c_label((19*num+1):(20*num),1),c_label((20*num+1):(21*num),1),c_label((21*num+1):(22*num),1),c_label((22*num+1):(23*num),1),c_label((23*num+1):(24*num),1)];
        %         d3{4,1}=[c_label((24*num+1):(25*num),1),c_label((25*num+1):(26*num),1),c_label((26*num+1):(27*num),1),c_label((27*num+1):(28*num),1),c_label((28*num+1):(29*num),1),c_label((29*num+1):(30*num),1),c_label((30*num+1):(31*num),1),c_label((31*num+1):(32*num),1)];
        %         d3{5,1}=[c_label((32*num+1):(33*num),1),c_label((33*num+1):(34*num),1),c_label((34*num+1):(35*num),1),c_label((35*num+1):(36*num),1),c_label((36*num+1):(37*num),1),c_label((37*num+1):(38*num),1),c_label((38*num+1):(39*num),1),c_label((39*num+1):(40*num),1)];
        %         d3{6,1}=[c_label((40*num+1):(41*num),1),c_label((41*num+1):(42*num),1),c_label((42*num+1):(43*num),1),c_label((43*num+1):(44*num),1),c_label((44*num+1):(45*num),1),c_label((45*num+1):(46*num),1),c_label((46*num+1):(47*num),1),c_label((47*num+1):(48*num),1)];
        %         d33{i,1}=mode(cell2mat(d3),2);
        %
        %
        %         y3{1,1}=[y((00*num+1):(01*num),1),y((01*num+1):(02*num),1),y((02*num+1):(03*num),1),y((03*num+1):(04*num),1),y((04*num+1):(05*num),1),y((05*num+1):(06*num),1),y((06*num+1):(07*num),1),y((07*num+1):(08*num),1)];
        %         y3{2,1}=[y((08*num+1):(09*num),1),y((09*num+1):(10*num),1),y((10*num+1):(11*num),1),y((11*num+1):(12*num),1),y((12*num+1):(13*num),1),y((13*num+1):(14*num),1),y((14*num+1):(15*num),1),y((15*num+1):(16*num),1)];
        %         y3{3,1}=[y((16*num+1):(17*num),1),y((17*num+1):(18*num),1),y((18*num+1):(19*num),1),y((19*num+1):(20*num),1),y((20*num+1):(21*num),1),y((21*num+1):(22*num),1),y((22*num+1):(23*num),1),y((23*num+1):(24*num),1)];
        %         y3{4,1}=[y((24*num+1):(25*num),1),y((25*num+1):(26*num),1),y((26*num+1):(27*num),1),y((27*num+1):(28*num),1),y((28*num+1):(29*num),1),y((29*num+1):(30*num),1),y((30*num+1):(31*num),1),y((31*num+1):(32*num),1)];
        %         y3{5,1}=[y((32*num+1):(33*num),1),y((33*num+1):(34*num),1),y((34*num+1):(35*num),1),y((35*num+1):(36*num),1),y((36*num+1):(37*num),1),y((37*num+1):(38*num),1),y((38*num+1):(39*num),1),y((39*num+1):(40*num),1)];
        %         y3{6,1}=[y((40*num+1):(41*num),1),y((41*num+1):(42*num),1),y((42*num+1):(43*num),1),y((43*num+1):(44*num),1),y((44*num+1):(45*num),1),y((45*num+1):(46*num),1),y((46*num+1):(47*num),1),y((47*num+1):(48*num),1)];
        %         y33{i,1}=mode(cell2mat(y3),2);
        % %
        
        
        
    end
    % figure(1);
    % plotconfusion(ind2vec(response'),ind2vec(yall'))
    book(f,:)=confumat(response,yall);
end
% d34=cell2mat(d33);
% y34=cell2mat(y33);
% figure(2);
% plotconfusion(ind2vec(d34'),ind2vec(y34'))

