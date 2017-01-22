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
len=24;


p=1
load('AA05_group1.mat');
for i=1:len
   main=EEG_C3_first_al(:,i);
   sig{1}=xcorr(EEG_C1_first_al(:,i),main);
   sig{2}=xcorr(EEG_C2_first_al(:,i),main);
   sig{3}=xcorr(EEG_C4_first_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_first_al(:,i),main);
   sig{5}=xcorr(EEG_F3_first_al(:,i),main);
   sig{6}=xcorr(EEG_F4_first_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_first_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[1,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end
for i=1:len
   main=EEG_C3_second_al(:,i);
   sig{1}=xcorr(EEG_C1_second_al(:,i),main);
   sig{2}=xcorr(EEG_C2_second_al(:,i),main);
   sig{3}=xcorr(EEG_C4_second_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_second_al(:,i),main);
   sig{5}=xcorr(EEG_F3_second_al(:,i),main);
   sig{6}=xcorr(EEG_F4_second_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_second_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[2,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end


p
load('AA05_group2.mat');
for i=1:len
   main=EEG_C3_first_al(:,i);
   sig{1}=xcorr(EEG_C1_first_al(:,i),main);
   sig{2}=xcorr(EEG_C2_first_al(:,i),main);
   sig{3}=xcorr(EEG_C4_first_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_first_al(:,i),main);
   sig{5}=xcorr(EEG_F3_first_al(:,i),main);
   sig{6}=xcorr(EEG_F4_first_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_first_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[3,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end
for i=1:len
   main=EEG_C3_second_al(:,i);
   sig{1}=xcorr(EEG_C1_second_al(:,i),main);
   sig{2}=xcorr(EEG_C2_second_al(:,i),main);
   sig{3}=xcorr(EEG_C4_second_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_second_al(:,i),main);
   sig{5}=xcorr(EEG_F3_second_al(:,i),main);
   sig{6}=xcorr(EEG_F4_second_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_second_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[4,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end


p
load('AA05_group3.mat');
for i=1:len
   main=EEG_C3_first_al(:,i);
   sig{1}=xcorr(EEG_C1_first_al(:,i),main);
   sig{2}=xcorr(EEG_C2_first_al(:,i),main);
   sig{3}=xcorr(EEG_C4_first_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_first_al(:,i),main);
   sig{5}=xcorr(EEG_F3_first_al(:,i),main);
   sig{6}=xcorr(EEG_F4_first_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_first_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[5,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end
for i=1:len
   main=EEG_C3_second_al(:,i);
   sig{1}=xcorr(EEG_C1_second_al(:,i),main);
   sig{2}=xcorr(EEG_C2_second_al(:,i),main);
   sig{3}=xcorr(EEG_C4_second_al(:,i),main);
   sig{4}=xcorr(EEG_CZ_second_al(:,i),main);
   sig{5}=xcorr(EEG_F3_second_al(:,i),main);
   sig{6}=xcorr(EEG_F4_second_al(:,i),main);
   sig{7}=xcorr(EEG_FZ_second_al(:,i),main);
   
   for j=1:7
        data=sig{j};
        [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CTmain_(erd_curve,ssn);
        group{j}=vector{1};
   end
   train_data1(p,:)=[6,group{1},group{2},group{3},group{4},group{5},group{6},group{7}];
   p=p+1;   
end



