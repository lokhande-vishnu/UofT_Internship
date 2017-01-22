% Feature extraction technique


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

%Using all electrodes
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


%Subtracting mean from the electrodes
% train_signal=cell(1,6);
% load('AA02_group1.mat');
% e1=EEG_C1_first_al(:,1:len);    e2=EEG_C2_first_al(:,1:len);    e3=EEG_C3_first_al(:,1:len);    e4=EEG_C4_first_al(:,1:len);    e5=EEG_CZ_first_al(:,1:len);    e6=EEG_F3_first_al(:,1:len);    e7=EEG_F4_first_al(:,1:len);    e8=EEG_FZ_first_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{1}= [e1,e2,e3,e4,e5,e6,e7,e8];
%
% e1=EEG_C1_second_al(:,1:len);    e2=EEG_C2_second_al(:,1:len);    e3=EEG_C3_second_al(:,1:len);    e4=EEG_C4_second_al(:,1:len);    e5=EEG_CZ_second_al(:,1:len);    e6=EEG_F3_second_al(:,1:len);    e7=EEG_F4_second_al(:,1:len);    e8=EEG_FZ_second_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{2}= [e1,e2,e3,e4,e5,e6,e7,e8];
%
% load('AA02_group2.mat');
% e1=EEG_C1_first_al(:,1:len);    e2=EEG_C2_first_al(:,1:len);    e3=EEG_C3_first_al(:,1:len);    e4=EEG_C4_first_al(:,1:len);    e5=EEG_CZ_first_al(:,1:len);    e6=EEG_F3_first_al(:,1:len);    e7=EEG_F4_first_al(:,1:len);    e8=EEG_FZ_first_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{3}= [e1,e2,e3,e4,e5,e6,e7,e8];
%
% e1=EEG_C1_second_al(:,1:len);    e2=EEG_C2_second_al(:,1:len);    e3=EEG_C3_second_al(:,1:len);    e4=EEG_C4_second_al(:,1:len);    e5=EEG_CZ_second_al(:,1:len);    e6=EEG_F3_second_al(:,1:len);    e7=EEG_F4_second_al(:,1:len);    e8=EEG_FZ_second_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{4}= [e1,e2,e3,e4,e5,e6,e7,e8];
%
%
% load('AA02_group3.mat');
% e1=EEG_C1_first_al(:,1:len);    e2=EEG_C2_first_al(:,1:len);    e3=EEG_C3_first_al(:,1:len);    e4=EEG_C4_first_al(:,1:len);    e5=EEG_CZ_first_al(:,1:len);    e6=EEG_F3_first_al(:,1:len);    e7=EEG_F4_first_al(:,1:len);    e8=EEG_FZ_first_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{5}= [e1,e2,e3,e4,e5,e6,e7,e8];
%
% e1=EEG_C1_second_al(:,1:len);    e2=EEG_C2_second_al(:,1:len);    e3=EEG_C3_second_al(:,1:len);    e4=EEG_C4_second_al(:,1:len);    e5=EEG_CZ_second_al(:,1:len);    e6=EEG_F3_second_al(:,1:len);    e7=EEG_F4_second_al(:,1:len);    e8=EEG_FZ_second_al(:,1:len);
% em=(e1+e2+e3+e4+e5+e6+e7+e8)/8;
% e1=e1-em; e2=e2-em; e3=e3-em; e4=e4-em; e5=e5-em; e6=e6-em; e7=e7-em; e8=e8-em;
% train_signal{6}= [e1,e2,e3,e4,e5,e6,e7,e8];


p=1;
for k=1:6
    k
    for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        
        %         train_data1(p,:)=[k,floor((i-1)/25)+1,vector{1}];
        %
        %         train_data2(p,:)=[k,floor((i-1)/25)+1,vector{2}];
        %         train_data3(p,:)=[k,floor((i-1)/25)+1,vector{3}];
        %         train_data4(p,:)=[k,floor((i-1)/25)+1,vector{4}];
        %         train_data5(p,:)=[k,floor((i-1)/25)+1,vector{5}];
        %         train_data6(p,:)=[k,floor((i-1)/25)+1,vector{6}];
        %         train_data7(p,:)=[k,floor((i-1)/25)+1,vector{7}];
        
        %         train_data1{p,1}=[k*ones(7,1),ones(7,1)*(floor((i-1)/len)+1),[1:7]',[vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}]];
        
                train_data1(p,:)=[k,(floor((i-1)/len)+1),vector{1}];
        
        
        p=p+1;
    end
    
    
end


