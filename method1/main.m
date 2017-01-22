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
N_=@normalize;               % normalizes data to frequency content
CT70_=@corr_tabulation70;        % cross correlates ERD signal and frequency band
CT_=@corr_vishnu;
BC_=@bin_change;             % changes width of frequency bins
GB_=@graph_bar;              % creates 3D bar graph
DWT_=@vishnu_dwt;
CT2_=@corr_try;

%Self processing of data
len=20;
load('AA02_group1.mat');
train_signal(:,1:len,1)= EEG_C4_first_al(:,1:len); test1=EEG_C4_first_al(:,(len+1):27);
train_signal(:,1:len,2)= EEG_C4_second_al(:,1:len);test2=EEG_C4_second_al(:,(len+1):37);
load('AA02_group2.mat');
train_signal(:,1:len,3)= EEG_C4_first_al(:,1:len); test3=EEG_C4_first_al(:,(len+1):31);
train_signal(:,1:len,4)= EEG_C4_second_al(:,1:len);test4=EEG_C4_second_al(:,(len+1):33);
load('AA02_group3.mat');
train_signal(:,1:len,5)= EEG_C4_first_al(:,1:len); test5=EEG_C4_first_al(:,(len+1):25);
train_signal(:,1:len,6)= EEG_C4_second_al(:,1:len);test6=EEG_C4_second_al(:,(len+1):34);

p=1;
for k=1:6
    for i=1:len
         data=train_signal(:,i,k);
         [ssns,ssn,twent,T] = SSN_(data);
        [vector,store]=CT_(erd_curve,ssn);
%         %          [vector]=CT2_(erd_curve,ssn);
%         %        vector= DWT_(data);
        train(p,:)=vector;
        trainval2(p,1)=k;
        p=p+1;
        
        %   imagesc(ssn)
        %   FileName=sprintf('group%d_trial%d.jpg',k,i)
        %   fname = 'U:\EEGcapture\vishnu\sampledataandcode\AA02\Tanh fit\spe_norm';
        %   saveas(gcf,fullfile(fname, FileName))
        %
%             imagesc(log(ssns))
%           FileName=sprintf('group%d_trial%d.jpg',k,i)
%           fname = 'U:\EEGcapture\vishnu\sampledataandcode\AA02\Tanh fit\spe_smoo';
%           saveas(gcf,fullfile(fname, FileName))
        %
        %   subplot(2,1,1)
        %   plot(alpha)
        %     subplot(2,1,2)
        %   plot(beta)
        %   FileName=sprintf('group%d_trial%d.jpg',k,i)
        %   fname = 'U:\EEGcapture\vishnu\sampledataandcode\AA02\Tanh fit\spe_tot';
        %   saveas(gcf,fullfile(fname, FileName))
        
        
    end
end


% for i=1:size(train,2)
%     z=train(:,i);
%     xhat(:,i)=(z-mean(z))/std(z);
% end
% train=xhat;


% for i=1:20
%     trainval(i,:)=[0 0 0 0 0 1];
% end
% for i=1:20
%     trainval(i+20,:)=[0 0 0 0 1 0];
% end
% for i=1:20
%     trainval(i+40,:)=[0 0 0 1 0 0];
% end
% for i=1:20
%     trainval(i+60,:)=[0 0 1 0 0 0];
% end
% for i=1:20
%     trainval(i+80,:)=[0 1 0 0 0 0];
% end
% for i=1:20
%     trainval(i+100,:)=[1 0 0 0 0 0];
% end
% 


