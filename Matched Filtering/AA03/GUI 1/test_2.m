close all; 
clear all;
load('avg_allin_1out.mat')
CMt_=@confusion_matrix_time;    % returns a matrix containing probability of ..
ID_=@id_max;                   % identify the maximum value reached
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
GB_=@graph_bar; 

t = -5:0.1:2.1;
sample=-(tanh(t/0.25)/3)+0.5;
erd_curve=(sample(43:63))';
u = erd_curve.'*erd_curve;
thresh = 0.9;
n = 1:50;
% Create a matched filter based on the template
b = flipud(erd_curve(:));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP1 GRASP 1: PINCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
load('AA03_group1.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C1_first=zeros(30,28,size(EEG_C1_first_al,2));


for i=1:size(EEG_C1_first_al,2)
[C1_first,T] = SSN_(EEG_C1_first_al(1:4001,i));
for f=1:30
x(f,:)=C1_first(f,:);
y(f,:) = filter(b,1,x(f,:));
% Find matches
matches = n(y(f,:)>thresh*u);
ind_G1G1_C1_first(f,n(matches),i)=1;
end

for k=1:size(ind_G1G1_C1_first,2)
        
        G1G1_C1_G1G1(k,:,i)=abs(G1G1_C1_out_first(k,:,i)-ind_G1G1_C1_first(k,:,i));  
 
        G1G1_C1_G1G2(k,:,i)=abs(G1G2_C1_second(k,:)-ind_G1G1_C1_first(k,:,i));

        G1G1_C1_G2G1(k,:,i)=abs(G2G1_C1_first(k,:)-ind_G1G1_C1_first(k,:,i)); 
        
        G1G1_C1_G2G2(k,:,i)=abs(G2G2_C1_second(k,:)-ind_G1G1_C1_first(k,:,i)); 
        
        G1G1_C1_G3G1(k,:,i)=abs(G3G1_C1_first(k,:)-ind_G1G1_C1_first(k,:,i)); 
           
        G1G1_C1_G3G2(k,:,i)=abs(G3G2_C1_second(k,:)-ind_G1G1_C1_first(k,:,i)); 
                    
end 
    
matrixG1G1(:,1,i)=sum(G1G1_C1_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_C1_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_C1_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_C1_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_C1_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_C1_G3G2(:,:,i),2);

C1_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

C1_sum=sum(C1_matrix1(:,:,i),1);
[r c]=max(C1_sum);

str=['Trial ',num2str(i), 'for C1','=',num2str(c)]; 

disp(str)
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C2_first=zeros(30,28,size(EEG_C2_first_al,2));

[C2_first,T] = SSN_(EEG_C2_first_al(1:4001,i));
for f=1:30
x(f,:)=C2_first(f,:);
y(f,:) = filter(b,1,x(f,:));
% Find matches
matches = n(y(f,:)>thresh*u);
ind_G1G1_C2_first(f,n(matches),i)=1;
end

for k=1:size(ind_G1G1_C2_first,2)
        
        G1G1_C2_G1G1(k,:,i)=abs(G1G1_C2_out_first(k,:,i)-ind_G1G1_C2_first(k,:,i));  
 
        G1G1_C2_G1G2(k,:,i)=abs(G1G2_C2_second(k,:)-ind_G1G1_C2_first(k,:,i));

        G1G1_C2_G2G1(k,:,i)=abs(G2G1_C2_first(k,:)-ind_G1G1_C2_first(k,:,i)); 
        
        G1G1_C2_G2G2(k,:,i)=abs(G2G2_C2_second(k,:)-ind_G1G1_C2_first(k,:,i)); 
        
        G1G1_C2_G3G1(k,:,i)=abs(G3G1_C2_first(k,:)-ind_G1G1_C2_first(k,:,i)); 
           
        G1G1_C2_G3G2(k,:,i)=abs(G3G2_C2_second(k,:)-ind_G1G1_C2_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_C2_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_C2_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_C2_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_C2_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_C2_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_C2_G3G2(:,:,i),2);

C2_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

C2_sum=sum(C2_matrix1(:,:,i),1);
[r c]=max(C2_sum);

str=['Trial ',num2str(i), 'for C2','=',num2str(c)]; 

disp(str)
end

