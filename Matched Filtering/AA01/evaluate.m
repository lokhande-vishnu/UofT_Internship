% This functions classifies individual EEG trials recorded durring hand
% grapsing
% When called, this function takes the 4 seconds of data prior to movement
% and transforms it into a representation of SNR values using a matched
% filter and target signal "erd_curve"

% This function is called by GUI and calls the follwoing functions:

% confusion_matrix_time(); Returns the grasp type with the minimum distance
% from the individiual trial, for each output of the matched filter 
                                        
% Spec_Smooth_Normailze(); Returns the normalized spectral components for
% each individual trial with FFT and the following specifications: 
% Window Length: 256, Overlap: 120, Frequecy Range: 1-30 Hz, Freq Resolution: 1 Hz Sampling Freq: 1K Hz;


function[color] = evaluate(data,trial,grasp)

load('avg_allin_1out.mat');

trial=trial+5;

CMt_=@confusion_matrix_time;    % returns a matrix containing probability of ..
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data


handles.t = -5:0.1:2.1;
handles.sample=-(tanh(handles.t/0.25)/3)+0.5;
handles.erd_curve=(handles.sample(43:63))';
handles.u = handles.erd_curve.'*handles.erd_curve;
handles.thresh = 0.9;
handles.n = 1:50;
% Create a matched filter based on the template
handles.b = flipud(handles.erd_curve(:));

[C1_first,T] = SSN_(data(1:4001,trial));

for f=1:30
x(f,:)=C1_first(f,:);
y(f,:) = filter(handles.b,1,x(f,:));
% Find matches
matches = handles.n(y(f,:)>handles.thresh*handles.u);
ind(f,handles.n(matches))=1;
end
if grasp==1
for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_out_first(k,:,trial)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_second(k,:)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind(k,:)); 
end  
elseif grasp ==2
 for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_out_second(k,:,trial)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind(k,:)); 
 end       

 elseif grasp ==3
 for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_second(k,:)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_out_first(k,:,trial)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind(k,:)); 
 end 
  elseif grasp ==4
 for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_second(k,:)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_out_second(k,:,trial)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind(k,:)); 
 end 
   elseif grasp ==5
 for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_second(k,:)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_out_first(k,:,trial)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_second(k,:)-ind(k,:)); 
 end 
   elseif grasp ==6
 for k=1:size(ind,2)
    
        G1G1_G1G1(k,:)=abs(G1G1_C1_first(k,:)-ind(k,:));  
 
        G1G1_G1G2(k,:)=abs(G1G2_C1_second(k,:)-ind(k,:));

        G1G1_G2G1(k,:)=abs(G2G1_C1_first(k,:)-ind(k,:)); 
        
        G1G1_G2G2(k,:)=abs(G2G2_C1_second(k,:)-ind(k,:)); 
        
        G1G1_G3G1(k,:)=abs(G3G1_C1_first(k,:)-ind(k,:)); 
           
        G1G1_G3G2(k,:)=abs(G3G2_C1_out_second(k,:,trial)-ind(k,:)); 
 end 

end

matrixG1G1(:,1)=sum(G1G1_G1G1,2);
matrixG1G1(:,2)= sum(G1G1_G1G2,2);
matrixG1G1(:,3)= sum(G1G1_G2G1,2);
matrixG1G1(:,4)= sum(G1G1_G2G2,2);
matrixG1G1(:,5)= sum(G1G1_G3G1,2);
matrixG1G1(:,6)= sum(G1G1_G3G2,2);
C1_matrix1(:,:)=CMt_(matrixG1G1);
C1_sum=sum(C1_matrix1,1);

[r c]=max(C1_sum); 
% grasp
% c
if c==grasp
    color=1; % turns circle red
else
    color=2; % turns circle black
end   

end

