close all;
clear all;
% Declare Variables%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -5:0.1:2.1;
% ers_curve=(tanh(x)+3)/4;
ers_curve=(tanh(x)+3)/100;
sample=-(tanh(x/0.25)/3)+0.5;
erd_curve=sample(43:63);

% Function prototypes% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
CTmain_=@corr_tabulation;        % cross correlates ERD signal and frequency band
MF_ =@matched_filtering;
CTmain2_=@corr_tabulation2;

%Self processing of data
%Using all data points
% train_signal=cell(1,6);
load('AA03_group1.mat');
train_signal1(:,:,1)=EEG_C1_first_al(:,:); train_signal1(:,:,2)=EEG_C2_first_al(:,:); train_signal1(:,:,3)=EEG_C3_first_al(:,:); train_signal1(:,:,4)=EEG_C4_first_al(:,:); train_signal1(:,:,5)=EEG_CZ_first_al(:,:); train_signal1(:,:,6)=EEG_F3_first_al(:,:); train_signal1(:,:,7)=EEG_F4_first_al(:,:); train_signal1(:,:,8)=EEG_FZ_first_al(:,:);
train_signal2(:,:,1)=EEG_C1_second_al(:,:); train_signal2(:,:,2)=EEG_C2_second_al(:,:); train_signal2(:,:,3)=EEG_C3_second_al(:,:); train_signal2(:,:,4)=EEG_C4_second_al(:,:); train_signal2(:,:,5)=EEG_CZ_second_al(:,:); train_signal2(:,:,6)=EEG_F3_second_al(:,:); train_signal2(:,:,7)=EEG_F4_second_al(:,:); train_signal2(:,:,8)=EEG_FZ_second_al(:,:);

load('AA03_group2.mat');
train_signal3(:,:,1)=EEG_C1_first_al(:,:); train_signal3(:,:,2)=EEG_C2_first_al(:,:); train_signal3(:,:,3)=EEG_C3_first_al(:,:); train_signal3(:,:,4)=EEG_C4_first_al(:,:); train_signal3(:,:,5)=EEG_CZ_first_al(:,:); train_signal3(:,:,6)=EEG_F3_first_al(:,:); train_signal3(:,:,7)=EEG_F4_first_al(:,:); train_signal3(:,:,8)=EEG_FZ_first_al(:,:);
train_signal4(:,:,1)=EEG_C1_second_al(:,:); train_signal4(:,:,2)=EEG_C2_second_al(:,:); train_signal4(:,:,3)=EEG_C3_second_al(:,:); train_signal4(:,:,4)=EEG_C4_second_al(:,:); train_signal4(:,:,5)=EEG_CZ_second_al(:,:); train_signal4(:,:,6)=EEG_F3_second_al(:,:); train_signal4(:,:,7)=EEG_F4_second_al(:,:); train_signal4(:,:,8)=EEG_FZ_second_al(:,:);

load('AA03_group3.mat');
train_signal5(:,:,1)=EEG_C1_first_al(:,:); train_signal5(:,:,2)=EEG_C2_first_al(:,:); train_signal5(:,:,3)=EEG_C3_first_al(:,:); train_signal5(:,:,4)=EEG_C4_first_al(:,:); train_signal5(:,:,5)=EEG_CZ_first_al(:,:); train_signal5(:,:,6)=EEG_F3_first_al(:,:); train_signal5(:,:,7)=EEG_F4_first_al(:,:); train_signal5(:,:,8)=EEG_FZ_first_al(:,:);
train_signal6(:,:,1)=EEG_C1_second_al(:,:); train_signal6(:,:,2)=EEG_C2_second_al(:,:); train_signal6(:,:,3)=EEG_C3_second_al(:,:); train_signal6(:,:,4)=EEG_C4_second_al(:,:); train_signal6(:,:,5)=EEG_CZ_second_al(:,:); train_signal6(:,:,6)=EEG_F3_second_al(:,:); train_signal6(:,:,7)=EEG_F4_second_al(:,:); train_signal6(:,:,8)=EEG_FZ_second_al(:,:);



for i=1:size(train_signal1,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal1(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data)
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=1;
        
        %method 1
        train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        %         train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
        
    end
    train_data1(:,:,i)=train_data;
end

for i=1:size(train_signal2,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal2(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=2;
        
        %method 1
        train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        %                 train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
    end
    train_data2(:,:,i)=train_data;
end

for i=1:size(train_signal3,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal3(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=3;
        
        %method 1
        train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        
        %                 train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
    end
    train_data3(:,:,i)=train_data;
end

for i=1:size(train_signal4,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal4(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=4;
        
        %method 1
        %         train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        
        %                 train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
    end
    train_data4(:,:,i)=train_data;
end

for i=1:size(train_signal5,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal5(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=5;
        %method 1
        %         train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        
        %                 train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
        
    end
    train_data5(:,:,i)=train_data;
end

for i=1:size(train_signal6,2)
    i
    train_data=[];
    for e=1:8
        data=train_signal6(:,i,e);
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        %         [vector,store]=CTmain2_(erd_curve,ssn);
        k=6;
        
        %method 1
        %         train_data=[train_data;k*ones(50,1),vector{1};k*ones(50,1),vector{2};k*ones(50,1),vector{3};k*ones(50,1),vector{4};k*ones(50,1),vector{5};k*ones(50,1),vector{6};k*ones(50,1),vector{7}];
        
        %                 train_data=[train_data;k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        
        %         if e==1
        %             train_data=[k,vector{1};k,vector{2};k,vector{3};k,vector{4};k,vector{5};k,vector{6};k,vector{7}];
        %         else
        %             dum=[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];
        %             train_data=[train_data,dum];
        %         end
        
    end
    train_data6(:,:,i)=train_data;
end



