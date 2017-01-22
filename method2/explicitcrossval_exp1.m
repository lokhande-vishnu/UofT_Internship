% function [trainedClassifier] = explicitcrossval_time(train)
clearvars -except train_data1
game=train_data1(:,1);
indices = crossvalind('Kfold',size(game,1)/(6*8),5);

p=1;
for i = 1:5
    i
    test_set = (indices == i); train_set = ~test_set;
    test_set = repmat(test_set,(6*8),1);    train_set = repmat(train_set,(6*8),1);
    
    % Filtering to remove erroneaus data
%     [train_filtered,ilogic]=filtering(game(train_set,:));    
%     [test_filtered]=filteringcheck(game(test_set,:),ilogic); 
%     [test_filtered,ilogic2]=filtering(game(test_set,:));   
    
%     training=cell2mat(train_filtered);  testing=cell2mat(test_filtered);
   testing= cell2mat(game(test_set,:)); training= cell2mat(game(train_set,:)); 
   % training=avgclassifier(game(train_set,:));
    
    %     Gauassian SVM
    template = templateSVM('KernelFunction', 'gaussian', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'CategoricalPredictors',[1,2,3],'Standardize', 1);
    trainedClassifier = fitcecoc(training(:,2:1003),training(:,1), 'Learners', template, 'Coding', 'onevsone');
    
    %     Cubic SVM
%     template = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder', 3, 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 0);
%     trainedClassifier = fitcecoc(training(:,2:1003),training(:,1), 'Learners', template, 'Coding', 'onevsone');
    
    
    %       fine KNN
%     trainedClassifier = fitcknn(training(:,2:1003),training(:,1),'ClassNames', [1 2 3 4 5 6], 'Distance', 'Euclidean', 'Exponent', '', 'NumNeighbors', 2, 'DistanceWeight', 'Equal', 'StandardizeData', 1);
   
    %     simple tree
%     trainedClassifier = fitctree(training(:,2:1003),training(:,1),'ClassNames', [1 2 3 4 5 6], 'SplitCriterion', 'gdi', 'MaxNumSplits', 10, 'Surrogate', 'off');
    
    
%     trainedClassifier = fitensemble(training(:,2:23),training(:,1), 'AdaBoostM2', 200, 'Tree', 'Type', 'Classification', 'LearnRate', 1.000000e-01, 'ClassNames', [1 2 3 4 5 6]);
%     trainedClassifier = fitensemble(training(:,2:1003),training(:,1), 'Bag', 500, 'Tree', 'Type', 'Classification', 'CategoricalPredictors',[1,2,3],'ClassNames', [1 2 3 4 5 6]);
%     trainedClassifier = fitensemble(training(:,2:1003),training(:,1), 'Subspace', 200, 'Discriminant', 'Type', 'Classification', 'NPredToSample', floor(size(training,2)/2),'ClassNames', [1 2 3 4 5 6]);
%     trainedClassifier = fitensemble(training(:,2:23),training(:,1), 'RUSBoost', 200, 'Tree', 'Type', 'Classification', 'LearnRate', 1.000000e-01, 'ClassNames', [1 2 3 4 5 6]);
    
    
    % Predicting what I have trained to obtain 100 training accuracy
    yt=predict(trainedClassifier,training(:,2:1003));
    dt=training(:,1);
    % here 20 is the num of time divisions
    ytpmod=[];dtpmod=[];
    for j=1:size(training,1)/(7)
        temyt=yt((7*j-6):(j*7),1);temdt=dt((7*j-6):(j*7),1);
        ytpmod=[ytpmod;temyt']; dtpmod=[dtpmod;temdt'];
    end    
    num=size(training,1)/(6*8*7);
    ytc1(1,:,:)=ytpmod((00*num+1):(01*num),:)'; ytc1(2,:,:)=ytpmod((01*num+1):(02*num),:)';ytc1(3,:,:)=ytpmod((02*num+1):(03*num),:)';ytc1(4,:,:)=ytpmod((03*num+1):(04*num),:)';ytc1(5,:,:)=ytpmod((04*num+1):(05*num),:)';ytc1(6,:,:)=ytpmod((05*num+1):(06*num),:)';ytc1(7,:,:)=ytpmod((06*num+1):(07*num),:)';ytc1(8,:,:)=ytpmod((07*num+1):(08*num),:)';
    ytc2(1,:,:)=ytpmod((08*num+1):(09*num),:)'; ytc2(2,:,:)=ytpmod((09*num+1):(10*num),:)';ytc2(3,:,:)=ytpmod((10*num+1):(11*num),:)';ytc2(4,:,:)=ytpmod((11*num+1):(12*num),:)';ytc2(5,:,:)=ytpmod((12*num+1):(13*num),:)';ytc2(6,:,:)=ytpmod((13*num+1):(14*num),:)';ytc2(7,:,:)=ytpmod((14*num+1):(15*num),:)';ytc2(8,:,:)=ytpmod((15*num+1):(16*num),:)';
    ytc3(1,:,:)=ytpmod((16*num+1):(17*num),:)'; ytc3(2,:,:)=ytpmod((17*num+1):(18*num),:)';ytc3(3,:,:)=ytpmod((18*num+1):(19*num),:)';ytc3(4,:,:)=ytpmod((19*num+1):(20*num),:)';ytc3(5,:,:)=ytpmod((20*num+1):(21*num),:)';ytc3(6,:,:)=ytpmod((21*num+1):(22*num),:)';ytc3(7,:,:)=ytpmod((22*num+1):(23*num),:)';ytc3(8,:,:)=ytpmod((23*num+1):(24*num),:)';
    ytc4(1,:,:)=ytpmod((24*num+1):(25*num),:)'; ytc4(2,:,:)=ytpmod((25*num+1):(26*num),:)';ytc4(3,:,:)=ytpmod((26*num+1):(27*num),:)';ytc4(4,:,:)=ytpmod((27*num+1):(28*num),:)';ytc4(5,:,:)=ytpmod((28*num+1):(29*num),:)';ytc4(6,:,:)=ytpmod((29*num+1):(30*num),:)';ytc4(7,:,:)=ytpmod((30*num+1):(31*num),:)';ytc4(8,:,:)=ytpmod((31*num+1):(32*num),:)';
    ytc5(1,:,:)=ytpmod((32*num+1):(33*num),:)'; ytc5(2,:,:)=ytpmod((33*num+1):(34*num),:)';ytc5(3,:,:)=ytpmod((34*num+1):(35*num),:)';ytc5(4,:,:)=ytpmod((35*num+1):(36*num),:)';ytc5(5,:,:)=ytpmod((36*num+1):(37*num),:)';ytc5(6,:,:)=ytpmod((37*num+1):(38*num),:)';ytc5(7,:,:)=ytpmod((38*num+1):(39*num),:)';ytc5(8,:,:)=ytpmod((39*num+1):(40*num),:)';
    ytc6(1,:,:)=ytpmod((40*num+1):(41*num),:)'; ytc6(2,:,:)=ytpmod((41*num+1):(42*num),:)';ytc6(3,:,:)=ytpmod((42*num+1):(43*num),:)';ytc6(4,:,:)=ytpmod((43*num+1):(44*num),:)';ytc6(5,:,:)=ytpmod((44*num+1):(45*num),:)';ytc6(6,:,:)=ytpmod((45*num+1):(46*num),:)';ytc6(7,:,:)=ytpmod((46*num+1):(47*num),:)';ytc6(8,:,:)=ytpmod((47*num+1):(48*num),:)';
    ytc_index{1}=(sum(ytc1,3)==num*1);   ytc_index{2}=(sum(ytc2,3)==num*2);   ytc_index{3}=(sum(ytc3,3)==num*3);   ytc_index{4}=(sum(ytc4,3)==num*4);   ytc_index{5}=(sum(ytc5,3)==num*5);   ytc_index{6}=(sum(ytc6,3)==num*6);
[sum(sum(ytc_index{1}))*100/56,sum(sum(ytc_index{2}))*100/56,sum(sum(ytc_index{3}))*100/56,sum(sum(ytc_index{4}))*100/56,sum(sum(ytc_index{5}))*100/56,sum(sum(ytc_index{6}))*100/56]





    
    %     yall(test_set,:) = predict(trainedClassifier,predictors(test_set,:));
    y=predict(trainedClassifier,testing(:,2:1003));
    d=testing(:,1);
    % here 20 is the num of time divisions
    ypmod=[];dpmod=[];
    for j=1:size(game(test_set,:),1)
        temy=y((7*j-6):(j*7),1);temd=d((7*j-6):(j*7),1);
        ypmod=[ypmod;temy']; dpmod=[dpmod;temd'];
    end
    num=size(game(test_set,:),1)/(6*8); yc=cell(6,1);
    yc{1,1}(1,:,:)=ypmod((00*num+1):(01*num),:)'; yc{1,1}(2,:,:)=ypmod((01*num+1):(02*num),:)';yc{1,1}(3,:,:)=ypmod((02*num+1):(03*num),:)';yc{1,1}(4,:,:)=ypmod((03*num+1):(04*num),:)';yc{1,1}(5,:,:)=ypmod((04*num+1):(05*num),:)';yc{1,1}(6,:,:)=ypmod((05*num+1):(06*num),:)';yc{1,1}(7,:,:)=ypmod((06*num+1):(07*num),:)';yc{1,1}(8,:,:)=ypmod((07*num+1):(08*num),:)';
    yc{2,1}(1,:,:)=ypmod((08*num+1):(09*num),:)'; yc{2,1}(2,:,:)=ypmod((09*num+1):(10*num),:)';yc{2,1}(3,:,:)=ypmod((10*num+1):(11*num),:)';yc{2,1}(4,:,:)=ypmod((11*num+1):(12*num),:)';yc{2,1}(5,:,:)=ypmod((12*num+1):(13*num),:)';yc{2,1}(6,:,:)=ypmod((13*num+1):(14*num),:)';yc{2,1}(7,:,:)=ypmod((14*num+1):(15*num),:)';yc{2,1}(8,:,:)=ypmod((15*num+1):(16*num),:)';
    yc{3,1}(1,:,:)=ypmod((16*num+1):(17*num),:)'; yc{3,1}(2,:,:)=ypmod((17*num+1):(18*num),:)';yc{3,1}(3,:,:)=ypmod((18*num+1):(19*num),:)';yc{3,1}(4,:,:)=ypmod((19*num+1):(20*num),:)';yc{3,1}(5,:,:)=ypmod((20*num+1):(21*num),:)';yc{3,1}(6,:,:)=ypmod((21*num+1):(22*num),:)';yc{3,1}(7,:,:)=ypmod((22*num+1):(23*num),:)';yc{3,1}(8,:,:)=ypmod((23*num+1):(24*num),:)';
    yc{4,1}(1,:,:)=ypmod((24*num+1):(25*num),:)'; yc{4,1}(2,:,:)=ypmod((25*num+1):(26*num),:)';yc{4,1}(3,:,:)=ypmod((26*num+1):(27*num),:)';yc{4,1}(4,:,:)=ypmod((27*num+1):(28*num),:)';yc{4,1}(5,:,:)=ypmod((28*num+1):(29*num),:)';yc{4,1}(6,:,:)=ypmod((29*num+1):(30*num),:)';yc{4,1}(7,:,:)=ypmod((30*num+1):(31*num),:)';yc{4,1}(8,:,:)=ypmod((31*num+1):(32*num),:)';
    yc{5,1}(1,:,:)=ypmod((32*num+1):(33*num),:)'; yc{5,1}(2,:,:)=ypmod((33*num+1):(34*num),:)';yc{5,1}(3,:,:)=ypmod((34*num+1):(35*num),:)';yc{5,1}(4,:,:)=ypmod((35*num+1):(36*num),:)';yc{5,1}(5,:,:)=ypmod((36*num+1):(37*num),:)';yc{5,1}(6,:,:)=ypmod((37*num+1):(38*num),:)';yc{5,1}(7,:,:)=ypmod((38*num+1):(39*num),:)';yc{5,1}(8,:,:)=ypmod((39*num+1):(40*num),:)';
    yc{6,1}(1,:,:)=ypmod((40*num+1):(41*num),:)'; yc{6,1}(2,:,:)=ypmod((41*num+1):(42*num),:)';yc{6,1}(3,:,:)=ypmod((42*num+1):(43*num),:)';yc{6,1}(4,:,:)=ypmod((43*num+1):(44*num),:)';yc{6,1}(5,:,:)=ypmod((44*num+1):(45*num),:)';yc{6,1}(6,:,:)=ypmod((45*num+1):(46*num),:)';yc{6,1}(7,:,:)=ypmod((46*num+1):(47*num),:)';yc{6,1}(8,:,:)=ypmod((47*num+1):(48*num),:)';
    dc{1,1}(1,:,:)=dpmod((00*num+1):(01*num),:)'; dc{1,1}(2,:,:)=dpmod((01*num+1):(02*num),:)';dc{1,1}(3,:,:)=dpmod((02*num+1):(03*num),:)';dc{1,1}(4,:,:)=dpmod((03*num+1):(04*num),:)';dc{1,1}(5,:,:)=dpmod((04*num+1):(05*num),:)';dc{1,1}(6,:,:)=dpmod((05*num+1):(06*num),:)';dc{1,1}(7,:,:)=dpmod((06*num+1):(07*num),:)';dc{1,1}(8,:,:)=dpmod((07*num+1):(08*num),:)';
    dc{2,1}(1,:,:)=dpmod((08*num+1):(09*num),:)'; dc{2,1}(2,:,:)=dpmod((09*num+1):(10*num),:)';dc{2,1}(3,:,:)=dpmod((10*num+1):(11*num),:)';dc{2,1}(4,:,:)=dpmod((11*num+1):(12*num),:)';dc{2,1}(5,:,:)=dpmod((12*num+1):(13*num),:)';dc{2,1}(6,:,:)=dpmod((13*num+1):(14*num),:)';dc{2,1}(7,:,:)=dpmod((14*num+1):(15*num),:)';dc{2,1}(8,:,:)=dpmod((15*num+1):(16*num),:)';
    dc{3,1}(1,:,:)=dpmod((16*num+1):(17*num),:)'; dc{3,1}(2,:,:)=dpmod((17*num+1):(18*num),:)';dc{3,1}(3,:,:)=dpmod((18*num+1):(19*num),:)';dc{3,1}(4,:,:)=dpmod((19*num+1):(20*num),:)';dc{3,1}(5,:,:)=dpmod((20*num+1):(21*num),:)';dc{3,1}(6,:,:)=dpmod((21*num+1):(22*num),:)';dc{3,1}(7,:,:)=dpmod((22*num+1):(23*num),:)';dc{3,1}(8,:,:)=dpmod((23*num+1):(24*num),:)';
    dc{4,1}(1,:,:)=dpmod((24*num+1):(25*num),:)'; dc{4,1}(2,:,:)=dpmod((25*num+1):(26*num),:)';dc{4,1}(3,:,:)=dpmod((26*num+1):(27*num),:)';dc{4,1}(4,:,:)=dpmod((27*num+1):(28*num),:)';dc{4,1}(5,:,:)=dpmod((28*num+1):(29*num),:)';dc{4,1}(6,:,:)=dpmod((29*num+1):(30*num),:)';dc{4,1}(7,:,:)=dpmod((30*num+1):(31*num),:)';dc{4,1}(8,:,:)=dpmod((31*num+1):(32*num),:)';
    dc{5,1}(1,:,:)=dpmod((32*num+1):(33*num),:)'; dc{5,1}(2,:,:)=dpmod((33*num+1):(34*num),:)';dc{5,1}(3,:,:)=dpmod((34*num+1):(35*num),:)';dc{5,1}(4,:,:)=dpmod((35*num+1):(36*num),:)';dc{5,1}(5,:,:)=dpmod((36*num+1):(37*num),:)';dc{5,1}(6,:,:)=dpmod((37*num+1):(38*num),:)';dc{5,1}(7,:,:)=dpmod((38*num+1):(39*num),:)';dc{5,1}(8,:,:)=dpmod((39*num+1):(40*num),:)';
    dc{6,1}(1,:,:)=dpmod((40*num+1):(41*num),:)'; dc{6,1}(2,:,:)=dpmod((41*num+1):(42*num),:)';dc{6,1}(3,:,:)=dpmod((42*num+1):(43*num),:)';dc{6,1}(4,:,:)=dpmod((43*num+1):(44*num),:)';dc{6,1}(5,:,:)=dpmod((44*num+1):(45*num),:)';dc{6,1}(6,:,:)=dpmod((45*num+1):(46*num),:)';dc{6,1}(7,:,:)=dpmod((46*num+1):(47*num),:)';dc{6,1}(8,:,:)=dpmod((47*num+1):(48*num),:)';
    
    
    for k=1:6
        for j=1:num
            matrixy=yc{k,1}(:,:,j);matrixd=dc{k,1}(:,:,j);
            z(p)=mode(matrixy(ytc_index{k}));
            e(p)=mode(matrixd(ytc_index{k}));
            p=p+1;
        end
    end
        
        
    
    
%     num=size(game(test_set,:),1)/(6*8);
%     d3{1,1}=[dpmod((00*num+1):(01*num),:),dpmod((01*num+1):(02*num),:),dpmod((02*num+1):(03*num),:),dpmod((03*num+1):(04*num),:),dpmod((04*num+1):(05*num),:),dpmod((05*num+1):(06*num),:),dpmod((06*num+1):(07*num),:),dpmod((07*num+1):(08*num),:)];
%     d3{2,1}=[dpmod((08*num+1):(09*num),:),dpmod((09*num+1):(10*num),:),dpmod((10*num+1):(11*num),:),dpmod((11*num+1):(12*num),:),dpmod((12*num+1):(13*num),:),dpmod((13*num+1):(14*num),:),dpmod((14*num+1):(15*num),:),dpmod((15*num+1):(16*num),:)];
%     d3{3,1}=[dpmod((16*num+1):(17*num),:),dpmod((17*num+1):(18*num),:),dpmod((18*num+1):(19*num),:),dpmod((19*num+1):(20*num),:),dpmod((20*num+1):(21*num),:),dpmod((21*num+1):(22*num),:),dpmod((22*num+1):(23*num),:),dpmod((23*num+1):(24*num),:)];
%     d3{4,1}=[dpmod((24*num+1):(25*num),:),dpmod((25*num+1):(26*num),:),dpmod((26*num+1):(27*num),:),dpmod((27*num+1):(28*num),:),dpmod((28*num+1):(29*num),:),dpmod((29*num+1):(30*num),:),dpmod((30*num+1):(31*num),:),dpmod((31*num+1):(32*num),:)];
%     d3{5,1}=[dpmod((32*num+1):(33*num),:),dpmod((33*num+1):(34*num),:),dpmod((34*num+1):(35*num),:),dpmod((35*num+1):(36*num),:),dpmod((36*num+1):(37*num),:),dpmod((37*num+1):(38*num),:),dpmod((38*num+1):(39*num),:),dpmod((39*num+1):(40*num),:)];
%     d3{6,1}=[dpmod((40*num+1):(41*num),:),dpmod((41*num+1):(42*num),:),dpmod((42*num+1):(43*num),:),dpmod((43*num+1):(44*num),:),dpmod((44*num+1):(45*num),:),dpmod((45*num+1):(46*num),:),dpmod((46*num+1):(47*num),:),dpmod((47*num+1):(48*num),:)];
%     d33{i,1}=mode(cell2mat(d3),2);
%     
%     
%     y3{1,1}=[ypmod((00*num+1):(01*num),:),ypmod((01*num+1):(02*num),:),ypmod((02*num+1):(03*num),:),ypmod((03*num+1):(04*num),:),ypmod((04*num+1):(05*num),:),ypmod((05*num+1):(06*num),:),ypmod((06*num+1):(07*num),:),ypmod((07*num+1):(08*num),:)];
%     y3{2,1}=[ypmod((08*num+1):(09*num),:),ypmod((09*num+1):(10*num),:),ypmod((10*num+1):(11*num),:),ypmod((11*num+1):(12*num),:),ypmod((12*num+1):(13*num),:),ypmod((13*num+1):(14*num),:),ypmod((14*num+1):(15*num),:),ypmod((15*num+1):(16*num),:)];
%     y3{3,1}=[ypmod((16*num+1):(17*num),:),ypmod((17*num+1):(18*num),:),ypmod((18*num+1):(19*num),:),ypmod((19*num+1):(20*num),:),ypmod((20*num+1):(21*num),:),ypmod((21*num+1):(22*num),:),ypmod((22*num+1):(23*num),:),ypmod((23*num+1):(24*num),:)];
%     y3{4,1}=[ypmod((24*num+1):(25*num),:),ypmod((25*num+1):(26*num),:),ypmod((26*num+1):(27*num),:),ypmod((27*num+1):(28*num),:),ypmod((28*num+1):(29*num),:),ypmod((29*num+1):(30*num),:),ypmod((30*num+1):(31*num),:),ypmod((31*num+1):(32*num),:)];
%     y3{5,1}=[ypmod((32*num+1):(33*num),:),ypmod((33*num+1):(34*num),:),ypmod((34*num+1):(35*num),:),ypmod((35*num+1):(36*num),:),ypmod((36*num+1):(37*num),:),ypmod((37*num+1):(38*num),:),ypmod((38*num+1):(39*num),:),ypmod((39*num+1):(40*num),:)];
%     y3{6,1}=[ypmod((40*num+1):(41*num),:),ypmod((41*num+1):(42*num),:),ypmod((42*num+1):(43*num),:),ypmod((43*num+1):(44*num),:),ypmod((44*num+1):(45*num),:),ypmod((45*num+1):(46*num),:),ypmod((46*num+1):(47*num),:),ypmod((47*num+1):(48*num),:)];
%     y33{i,1}=mode(cell2mat(y3),2);
%     
  clearvars -except train_data1 game indices p i z e  
     
    
end
% figure(1);
% plotconfusion(ind2vec(d'),ind2vec(y'))

% d34=cell2mat(d33);
% y34=cell2mat(y33);
% plotconfusion(ind2vec(d34'),ind2vec(y34'))
s=plotconfusion(ind2vec(e),ind2vec(z));

% end
