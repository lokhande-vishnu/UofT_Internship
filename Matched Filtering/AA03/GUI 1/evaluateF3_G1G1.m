function[] = evaluateF3_G1G1(i)

load('avg_allin_1out.mat');
load('AA03_group1.mat');


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

[F3_first,T] = SSN_(EEG_F3_first_al(1:4001,i));

for f=1:30
x(f,:)=F3_first(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind_G1G1_F3_first(f,handles.n(matches),1)=1;
end
for k=1:size(ind_G1G1_F3_first,2)
    
        G1G1_F3_G1G1(k,:)=abs(G1G1_F3_out_first(k,:,i)-ind_G1G1_F3_first(k,:));  
 
        G1G1_F3_G1G2(k,:)=abs(G1G2_F3_second(k,:)-ind_G1G1_F3_first(k,:));

        G1G1_F3_G2G1(k,:)=abs(G2G1_F3_first(k,:)-ind_G1G1_F3_first(k,:)); 
        
        G1G1_F3_G2G2(k,:)=abs(G2G2_F3_second(k,:)-ind_G1G1_F3_first(k,:)); 
        
        G1G1_F3_G3G1(k,:)=abs(G3G1_F3_first(k,:)-ind_G1G1_F3_first(k,:)); 
           
        G1G1_F3_G3G2(k,:)=abs(G3G2_F3_second(k,:)-ind_G1G1_F3_first(k,:)); 
                    
end   
matrixG1G1(:,1)=sum(G1G1_F3_G1G1,2);
matrixG1G1(:,2)= sum(G1G1_F3_G1G2,2);
matrixG1G1(:,3)= sum(G1G1_F3_G2G1,2);
matrixG1G1(:,4)= sum(G1G1_F3_G2G2,2);
matrixG1G1(:,5)= sum(G1G1_F3_G3G1,2);
matrixG1G1(:,6)= sum(G1G1_F3_G3G2,2);
F3_matrix1(:,:)=CMt_(matrixG1G1);
F3_sum=sum(F3_matrix1,1);

[r c]=max(F3_sum);

c
if c==1
    color=1; % turns circle red
    width=2; % with a width of 5
else
    color=2; % turns circle black
    width=2; % with a width of 5
end   

circle(2,25,2,color,width); 
end

