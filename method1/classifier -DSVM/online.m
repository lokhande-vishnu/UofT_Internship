clearvars -except -regexp ^svmstruct ^level ^test ^svm2struct
close all
addpath('G:\vishnu\Tanh fit')

test_signal(:,:,1)=test1(:,1:5);    
test_signal(:,:,2)=test2(:,1:5);
test_signal(:,:,3)=test3(:,1:5);
test_signal(:,:,4)=test4(:,1:5);
test_signal(:,:,5)=test5(:,1:5);
test_signal(:,:,6)=test6(:,1:5);


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

p=1;
for k=1:6
    for i=1:len
        data=test_signal(:,i,k);
        [fift,ssn,twent] = SSN_(data);
         [vector,store]=CT_(erd_curve,ssn);
        %vector= DWT_(data);
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
[Class_test] = Classify_DSVM(train,label,svmstruct,level);
train_labels=[zeros(1,len),ones(1,len),2*ones(1,len),3*ones(1,len),4*ones(1,len),5*ones(1,len)];
[Cmat,DA]= confusion_matrix(Class_test,train_labels,{'A','B','C','D','E','F'})


u=label';
numClasses=length(u);
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
