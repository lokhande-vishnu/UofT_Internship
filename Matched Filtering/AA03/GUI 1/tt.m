load('AA03_group1.mat');

i=1;
CMt_=@confusion_matrix_time;    % returns a matrix containing probability of ..
ID_=@id_max;                   % identify the maximum value reached
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data


handles.t = -5:0.1:2.1;
handles.sample=-(tanh(handles.t/0.25)/3)+0.5;
handles.erd_curve=(handles.sample(43:63))';
handles.u = handles.erd_curve.'*handles.erd_curve;
handles.thresh = 0.9;
handles.n = 1:50;
% Create a matched filter based on the template 
handles.b = flipud(handles.erd_curve(:));

[C1_second,T] = SSN_(EEG_C1_second_al(1:4001,i));

for f=1:30
x(f,:)=C1_second(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind_G1G2_C1_second(f,handles.n(matches),1)=1;
end