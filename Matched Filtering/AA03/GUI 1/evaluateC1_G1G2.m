function[] = evaluateC1_G1G2(i)

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

[C1_second,T] = SSN_(EEG_C1_second_al(1:4001,i));

for f=1:30
x(f,:)=C1_second(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind_G1G2_C1_second(f,handles.n(matches),1)=1;
end
for k=1:size(ind_G1G2_C1_second,2)
    
        G1G2_C1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind_G1G2_C1_second(k,:));
        
        G1G2_C1_G1G2(k,:)=abs(G1G2_C1_out_second(k,:,i)-ind_G1G2_C1_second(k,:));

        G1G2_C1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind_G1G2_C1_second(k,:)); 
        
        G1G2_C1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind_G1G2_C1_second(k,:)); 
        
        G1G2_C1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind_G1G2_C1_second(k,:)); 
           
        G1G2_C1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind_G1G2_C1_second(k,:));  
                    
end   
matrixG1G2(:,1)=sum(G1G2_C1_G1G1(:,:),2);
matrixG1G2(:,2)= sum(G1G2_C1_G1G2(:,:),2);
matrixG1G2(:,3)= sum(G1G2_C1_G2G1(:,:),2);
matrixG1G2(:,4)= sum(G1G2_C1_G2G2(:,:),2);
matrixG1G2(:,5)= sum(G1G2_C1_G3G1(:,:),2);
matrixG1G2(:,6)= sum(G1G2_C1_G3G2(:,:),2);
C1_matrix1(:,:)=CMt_(matrixG1G2(:,:));
C1_sum=sum(C1_matrix1(:,:),1);

[r c]=max(C1_sum);

c

if c==2
    color=1; % turns circle red
    width=2; % with a width of 5
else
    color=2; % turns circle black
    width=2; % with a width of 5
end   

    circle(4,15,2,color,width);

end

