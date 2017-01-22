function[] = evaluateFZ_G3G2(i)

load('avg_allin_1out.mat');
load('AA03_group3.mat');


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

[FZ_second] = SSN_(EEG_FZ_second_al(1:4001,i));

for f=1:30
x(f,:)=FZ_second(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind_G3G2_FZ_second(f,handles.n(matches),i)=1;
end
for k=1:size(ind_G3G2_FZ_second,2)
    
        G3G2_FZ_G1G1(k,:,i)=abs(G1G1_FZ_first(k,:)-ind_G3G2_FZ_second(k,:,i));  
 
        G3G2_FZ_G1G2(k,:,i)=abs(G1G2_FZ_second(k,:)-ind_G3G2_FZ_second(k,:,i));

        G3G2_FZ_G2G1(k,:,i)=abs(G2G1_FZ_first(k,:)-ind_G3G2_FZ_second(k,:,i)); 
        
        G3G2_FZ_G2G2(k,:,i)=abs(G2G2_FZ_second(k,:)-ind_G3G2_FZ_second(k,:,i)); 
        
        G3G2_FZ_G3G1(k,:,i)=abs(G3G1_FZ_first(k,:)-ind_G3G2_FZ_second(k,:,i)); 
           
        G3G2_FZ_G3G2(k,:,i)=abs(G3G2_FZ_out_second(k,:,i)-ind_G3G2_FZ_second(k,:,i));  
                    
end   
matrixG3G2(:,1,i)=sum(G3G2_FZ_G1G1(:,:,i),2);
matrixG3G2(:,2,i)= sum(G3G2_FZ_G1G2(:,:,i),2);
matrixG3G2(:,3,i)= sum(G3G2_FZ_G2G1(:,:,i),2);
matrixG3G2(:,4,i)= sum(G3G2_FZ_G2G2(:,:,i),2);
matrixG3G2(:,5,i)= sum(G3G2_FZ_G3G1(:,:,i),2);
matrixG3G2(:,6,i)= sum(G3G2_FZ_G3G2(:,:,i),2);
FZ_matrix1(:,:,i)=CMt_(matrixG3G2(:,:,i));
FZ_sum=sum(FZ_matrix1(:,:,i),1);

[r c]=max(FZ_sum);
c

if c==6
    color=1; % turns circle red
    width=2; % with a width of 5
else
    color=2; % turns circle black
    width=2; % with a width of 5
end   

circle(2,25,2,color,width); 
end

