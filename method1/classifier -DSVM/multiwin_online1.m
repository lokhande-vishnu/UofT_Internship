% clearvars -except -regexp ^svmstruct\d$ ^level\d$ ^test\d$
clearvars -except -regexp ^svmstruct ^level ^test ^svm2struct
close all
addpath('G:\vishnu\Tanh fit')

% Declare Variables%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -5:0.1:2.1;
% ers_curve=(tanh(x)+3)/4;
ers_curve=(tanh(x)+3)/100;
sample=-(tanh(x/0.25)/3)+0.5;
erd_curve=sample(43:63);

% Function prototypes% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
N_=@normalize;               % normalizes data to frequency content              
CT70_=@corr_tabulation70;        % cross correlates ERD signal and frequency band
CT_=@corr_vishnu;
BC_=@bin_change;             % changes width of frequency bins
GB_=@graph_bar;              % creates 3D bar graph
DWT_=@vishnu_dwt;
CT2_=@corr_try;

len=5;

test_signal(:,:,1)=test1(:,1:5);    
test_signal(:,:,2)=test2(:,1:5);
test_signal(:,:,3)=test3(:,1:5);
test_signal(:,:,4)=test4(:,1:5);
test_signal(:,:,5)=test5(:,1:5);
test_signal(:,:,6)=test6(:,1:5);

p=1;
for k=1:6
    for i=1:len
        data=test_signal(:,i,k);
        [fift,ssn,twent] = SSN_(data);
%       [vector,r_ERD]=CT_(erd_curve,ssn); 
        [vector]=CT2_(erd_curve,ssn); 
%         vector= DWT_(data);
        train(p,:)=vector;
        trainval2(p,1)=k-1;
        p=p+1;
        %   imagesc(store)
        %   FileName=sprintf('group%d_trial%d.jpg',k,i)
        %   fname = 'C:\Users\lokhanV\Desktop\kathryns work\ccplots';
        %   saveas(gcf,fullfile(fname, FileName))
        
    end
end

label=[0 1 2 3 4 5];
train_sub=cell2mat(train(:,1));
[Class_test1] = Classify_DSVM(train_sub,label,svmstruct1,level1);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct1(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test1(1,j) = k-1;
end

train_sub=cell2mat(train(:,2));
[Class_test2] = Classify_DSVM(train_sub,label,svmstruct2,level2);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct2(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test2(1,j) = k-1;
end

train_sub=cell2mat(train(:,3));
[Class_test3] = Classify_DSVM(train_sub,label,svmstruct3,level3);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct3(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test3(1,j) = k-1;
end

train_sub=cell2mat(train(:,4));
[Class_test4] = Classify_DSVM(train_sub,label,svmstruct4,level4);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct4(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test4(1,j) = k-1;
end

train_sub=cell2mat(train(:,5));
[Class_test5] = Classify_DSVM(train_sub,label,svmstruct5,level5);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct5(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test5(1,j) = k-1;
end

train_sub=cell2mat(train(:,6));
[Class_test6] = Classify_DSVM(train_sub,label,svmstruct6,level6);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct6(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test6(1,j) = k-1;
end

train_sub=cell2mat(train(:,7));
[Class_test7] = Classify_DSVM(train_sub,label,svmstruct7,level7);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct7(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test7(1,j) = k-1;
end

train_sub=cell2mat(train(:,8));
[Class_test8] = Classify_DSVM(train_sub,label,svmstruct8,level8);
numClasses=length(label);
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct8(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test8(1,j) = k-1;
end

%%%%%%%%%%%%%%

vector21=[Class_test1;Class_test2;Class_test3;Class_test4;Class_test5;Class_test6;Class_test7;Class_test8];
vector22=[Class2_test1;Class2_test2;Class2_test3;Class2_test4;Class2_test5;Class2_test6;Class2_test7;Class2_test8];
train_sub=vector21';
%[idx,C] = kmeans(train_sub,6);
% idx=mode(train_sub,2);
% train_labels=[zeros(1,len),ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len)];
% %train_labels=[ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len),6*ones(1,len)];
% [Cmat,DA]= confusion_matrix(idx',train_labels,{'A','B','C','D','E','F'})


% train_label={zeros(len,1),ones(len,1),2*ones(len,1),3*ones(len,1),4*ones(len,1),5*ones(len,1)};
% train_cell={train_sub(1:len,:),train_sub((len+1):2*len,:),train_sub((2*len+1):3*len,:),train_sub((3*len+1):4*len,:),train_sub((4*len+1):5*len,:),train_sub((5*len+1):6*len,:)};
% [svmstruct,level] = Train_DSVM(train_cell,train_label);
% 
% %test_mat=[meas(31:40,:);meas(81:90,:);meas(131:140,:)];
label=[0 1 2 3 4 5];
%train_mat=[train(1:len,:);train((len+1):2*len,:);train((2*len+1):3*len,:);train((3*len+1):4*len,:);train((4*len+1):5*len,:);train((5*len+1):6*len,:)];
[Class_test] = Classify_DSVM(train_sub,label,svmstruct,level);
train_labels=[zeros(1,len),ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len)];
[Cmat,DA]= confusion_matrix(Class_test,train_labels,{'A','B','C','D','E','F'})

train_sub=vector22';
u=label';
numClasses=length(u);
%testing
for j=1:size(train_sub,1)
    for k=1:numClasses
        if(svmclassify(svm2struct(k),train_sub(j,:))) 
            break;
        end
    end
    Class2_test(1,j) = k-1;
end
[Cmat2,DA2]= confusion_matrix(Class2_test,train_labels,{'A','B','C','D','E','F'})