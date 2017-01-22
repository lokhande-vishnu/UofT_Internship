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
% CTmain_=@corr_tabulation;        % cross correlates ERD signal and frequency band
CTtime_=@corr_time;

%Self processing of data
len=25;
% load('AA02_group1.mat');5
% train_signal(:,1:len,1)= EEG_C4_first_al(:,1:len); test1=EEG_C4_first_al(:,(len+1):27);
% train_signal(:,1:len,2)= EEG_C4_second_al(:,1:len);test2=EEG_C4_second_al(:,(len+1):37);
% load('AA02_group2.mat');
% train_signal(:,1:len,3)= EEG_C4_first_al(:,1:len); test3=EEG_C4_first_al(:,(len+1):31);
% train_signal(:,1:len,4)= EEG_C4_second_al(:,1:len);test4=EEG_C4_second_al(:,(len+1):33);
% load('AA02_group3.mat');
% train_signal(:,1:len,5)= EEG_C4_first_al(:,1:len); %test5=EEG_C4_first_al(:,(len+1):25);
% train_signal(:,1:len,6)= EEG_C4_second_al(:,1:len);test6=EEG_C4_second_al(:,(len+1):34);

%Using all data points
train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= [EEG_C1_first_al(:,1:len),EEG_C2_first_al(:,1:len),EEG_C3_first_al(:,1:len),EEG_C4_first_al(:,1:len),EEG_CZ_first_al(:,1:len),EEG_F3_first_al(:,1:len),EEG_F4_first_al(:,1:len),EEG_FZ_first_al(:,1:len)];
train_signal{2}= [EEG_C1_second_al(:,1:len),EEG_C2_second_al(:,1:len),EEG_C3_second_al(:,1:len),EEG_C4_second_al(:,1:len),EEG_CZ_second_al(:,1:len),EEG_F3_second_al(:,1:len),EEG_F4_second_al(:,1:len),EEG_FZ_second_al(:,1:len)];
load('AA01_group2.mat');
train_signal{3}= [EEG_C1_first_al(:,1:len),EEG_C2_first_al(:,1:len),EEG_C3_first_al(:,1:len),EEG_C4_first_al(:,1:len),EEG_CZ_first_al(:,1:len),EEG_F3_first_al(:,1:len),EEG_F4_first_al(:,1:len),EEG_FZ_first_al(:,1:len)];
train_signal{4}= [EEG_C1_second_al(:,1:len),EEG_C2_second_al(:,1:len),EEG_C3_second_al(:,1:len),EEG_C4_second_al(:,1:len),EEG_CZ_second_al(:,1:len),EEG_F3_second_al(:,1:len),EEG_F4_second_al(:,1:len),EEG_FZ_second_al(:,1:len)];
load('AA01_group3.mat');
train_signal{5}= [EEG_C1_first_al(:,1:len),EEG_C2_first_al(:,1:len),EEG_C3_first_al(:,1:len),EEG_C4_first_al(:,1:len),EEG_CZ_first_al(:,1:len),EEG_F3_first_al(:,1:len),EEG_F4_first_al(:,1:len),EEG_FZ_first_al(:,1:len)];
train_signal{6}= [EEG_C1_second_al(:,1:len),EEG_C2_second_al(:,1:len),EEG_C3_second_al(:,1:len),EEG_C4_second_al(:,1:len),EEG_CZ_second_al(:,1:len),EEG_F3_second_al(:,1:len),EEG_F4_second_al(:,1:len),EEG_FZ_second_al(:,1:len)];


p=1;
for k=1:6
    for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data);
        [store_pre]=CTtime_(erd_curve,ssn);
        train_data1{p,1}=[k*ones(20,1),ones(20,1)*(floor((i-1)/len)+1),[1:20]',store_pre];
        %         train_data2(p,:)=[k,vector{2}];
        %         train_data3(p,:)=[k,vector{3}];
        %         train_data4(p,:)=[k,vector{4}];
        %         train_data5(p,:)=[k,vector{5}];
        %         train_data6(p,:)=[k,vector{6}];
        %         train_data7(p,:)=[k,vector{7}];
        train_tar(p,1)=k;
        p=p+1;
    end
end
