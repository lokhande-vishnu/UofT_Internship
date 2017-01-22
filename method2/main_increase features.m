close all;
clear all;

% Declare Variables%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -5:0.1:2.1;
% ers_curve=(tanh(x)+3)/4;
ers_curve=(tanh(x)+3)/100;
sample=-(tanh(x/0.25)/3)+0.5;
erd_curve=sample(43:63);
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
CTmain_=@corr_tabulation;        % cross correlates ERD signal and frequency band
len=25;

train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_C1_first_al;
train_signal{2}= EEG_C1_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_C1_first_al;
train_signal{4}= EEG_C1_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_C1_first_al;
train_signal{6}= EEG_C1_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_dataC1(p,:)=[k,vector{1}];
%         train_dataC1(p,:,:)=permute([k*ones(28,1),vector{1}],[3,2,1]);
        p=p+1;
    end
end


train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_C2_first_al;
train_signal{2}= EEG_C2_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_C2_first_al;
train_signal{4}= EEG_C2_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_C2_first_al;
train_signal{6}= EEG_C2_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_data2(p,:)=[vector{1}];
%         train_data2(p,:,:)=permute([vector{1}],[3,2,1]);       
        p=p+1;
    end
end


train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_C3_first_al;
train_signal{2}= EEG_C3_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_C3_first_al;
train_signal{4}= EEG_C3_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_C3_first_al;
train_signal{6}= EEG_C3_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_data3(p,:)=[vector{1}];
%         train_data3(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end


train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_C4_first_al;
train_signal{2}= EEG_C4_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_C4_first_al;
train_signal{4}= EEG_C4_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_C4_first_al;
train_signal{6}= EEG_C4_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_data4(p,:)=[vector{1}];
%         train_data4(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end


train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_CZ_first_al;
train_signal{2}= EEG_CZ_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_CZ_first_al;
train_signal{4}= EEG_CZ_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_CZ_first_al;
train_signal{6}= EEG_CZ_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_dataZ(p,:)=[vector{1}];
%         train_dataZ(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end


train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_F3_first_al;
train_signal{2}= EEG_F3_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_F3_first_al;
train_signal{4}= EEG_F3_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_F3_first_al;
train_signal{6}= EEG_F3_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_dataF3(p,:)=[vector{1}];
%         train_dataF3(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end

train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_F4_first_al;
train_signal{2}= EEG_F4_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_F4_first_al;
train_signal{4}= EEG_F4_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_F4_first_al;
train_signal{6}= EEG_F4_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_dataF4(p,:)=[vector{1}];
%        train_dataF4(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end

train_signal=cell(1,6);
load('AA01_group1.mat');
train_signal{1}= EEG_FZ_first_al;
train_signal{2}= EEG_FZ_second_al;
load('AA01_group2.mat');
train_signal{3}= EEG_FZ_first_al;
train_signal{4}= EEG_FZ_second_al;
load('AA01_group3.mat');
train_signal{5}= EEG_FZ_first_al;
train_signal{6}= EEG_FZ_second_al;
p=1;
for k=1:6
    k
   for i=1:size(train_signal{k},2)
        data=train_signal{k}(:,i);
        [ssns,ssn,twent,T] = SSN_(data(1:4001,:));
        [vector,store]=CTmain_(erd_curve,ssn);
        train_dataFZ(p,:)=[vector{1}];
%         train_dataFZ(p,:,:)=permute([vector{1}],[3,2,1]);
        p=p+1;
    end
end

% train_data1=(train_dataC1+train_data2+train_data3+train_data4+train_dataZ+train_dataF3+train_dataF4+train_dataFZ)./8;

train_data1=[train_dataC1,train_data2,train_data3,train_data4,train_dataZ,train_dataF3,train_dataF4,train_dataFZ];

