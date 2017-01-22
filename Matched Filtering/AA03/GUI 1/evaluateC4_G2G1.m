function[] = evaluateC4_G2G1(i)

load('avg_allin_1out.mat');
load('AA03_group2.mat');


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

[C4_first,T] = SSN_(EEG_C4_first_al(1:4001,i));

for f=1:30
x(f,:)=C4_first(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind_G2G1_C4_first(f,handles.n(matches),i)=1;
end
for k=1:size(ind_G2G1_C4_first,2)
    
        G2G1_C4_G1G1(k,:,i)=abs(G1G1_C4_first(k,:)-ind_G2G1_C4_first(k,:,i));  
 
        G2G1_C4_G1G2(k,:,i)=abs(G1G2_C4_second(k,:)-ind_G2G1_C4_first(k,:,i));

        G2G1_C4_G2G1(k,:,i)=abs(G2G1_C4_out_first(k,:,i)-ind_G2G1_C4_first(k,:,i)); 
        
        G2G1_C4_G2G2(k,:,i)=abs(G2G2_C4_second(k,:)-ind_G2G1_C4_first(k,:,i)); 
        
        G2G1_C4_G3G1(k,:,i)=abs(G3G1_C4_first(k,:)-ind_G2G1_C4_first(k,:,i)); 
           
        G2G1_C4_G3G2(k,:,i)=abs(G3G2_C4_second(k,:)-ind_G2G1_C4_first(k,:,i));  
end   
matrixG2G1(:,1,i)=sum(G2G1_C4_G1G1(:,:,i),2);
matrixG2G1(:,2,i)= sum(G2G1_C4_G1G2(:,:,i),2);
matrixG2G1(:,3,i)= sum(G2G1_C4_G2G1(:,:,i),2);
matrixG2G1(:,4,i)= sum(G2G1_C4_G2G2(:,:,i),2);
matrixG2G1(:,5,i)= sum(G2G1_C4_G3G1(:,:,i),2);
matrixG2G1(:,6,i)= sum(G2G1_C4_G3G2(:,:,i),2);
C4_matrix1(:,:,i)=CMt_(matrixG2G1(:,:,i));
C4_sum=sum(C4_matrix1(:,:,i),1);

[r c]=max(C4_sum)

if c==3
    color=1; % turns circle red
    width=2; % with a width of 5
else
    color=2; % turns circle black
    width=2; % with a width of 5
end   

    circle(22,15,2,color,width); 

end

