close all; 
clear all;
load('individual_avg_1out_allin.mat')

CMt_=@confusion_matrix_time;    % returns a matrix containing probability of ..
ID_=@id_max;                   % identify the maximum value reached



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE C1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_C1_first,3) 
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

end
C1_matrix1=(sum(C1_matrix1,3))./i;
[max_1, c] = ID_(C1_matrix1);
if c~=1
con_matC1(:,1) = 0;
end
con_matC1(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_C1_second,3) 
    for k=1:size(ind_G1G2_C1_second,2) 
        
        G1G2_C1_G1G1(k,:,i)=abs(G1G1_C1_first(k,:)-ind_G1G2_C1_second(k,:,i));  
 
        G1G2_C1_G1G2(k,:,i)=abs(G1G2_C1_out_second(k,:,i)-ind_G1G2_C1_second(k,:,i));

        G1G2_C1_G2G1(k,:,i)=abs(G2G1_C1_first(k,:)-ind_G1G2_C1_second(k,:,i)); 
        
        G1G2_C1_G2G2(k,:,i)=abs(G2G2_C1_second(k,:)-ind_G1G2_C1_second(k,:,i)); 
        
        G1G2_C1_G3G1(k,:,i)=abs(G3G1_C1_first(k,:)-ind_G1G2_C1_second(k,:,i)); 
           
        G1G2_C1_G3G2(k,:,i)=abs(G3G2_C1_second(k,:)-ind_G1G2_C1_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_C1_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_C1_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_C1_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_C1_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_C1_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_C1_G3G2(:,:,i),2);

C1_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
C1_matrix2=(sum(C1_matrix2,3))./i;
[max_2, c] = ID_(C1_matrix2);
if c~=2
con_matC1(:,2) = 0;
end
con_matC1(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_C1_first,3) 
    for k=1:size(ind_G2G1_C1_first,2) 
        
        G2G1_C1_G1G1(k,:,i)=abs(G1G1_C1_first(k,:)-ind_G2G1_C1_first(k,:,i));  
 
        G2G1_C1_G1G2(k,:,i)=abs(G1G2_C1_second(k,:)-ind_G2G1_C1_first(k,:,i));

        G2G1_C1_G2G1(k,:,i)=abs(G2G1_C1_out_first(k,:,i)-ind_G2G1_C1_first(k,:,i)); 
        
        G2G1_C1_G2G2(k,:,i)=abs(G2G2_C1_second(k,:)-ind_G2G1_C1_first(k,:,i)); 
        
        G2G1_C1_G3G1(k,:,i)=abs(G3G1_C1_first(k,:)-ind_G2G1_C1_first(k,:,i)); 
           
        G2G1_C1_G3G2(k,:,i)=abs(G3G2_C1_second(k,:)-ind_G2G1_C1_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_C1_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_C1_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_C1_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_C1_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_C1_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_C1_G3G2(:,:,i),2);

C1_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
C1_matrix3=(sum(C1_matrix3,3))./i;
[max_3, c] = ID_(C1_matrix3);
if c~=3
con_matC1(:,3) = 0;
end
con_matC1(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_C1_second,3) 
    for k=1:size(ind_G2G2_C1_second,2) 
        
        G2G2_C1_G1G1(k,:,i)=abs(G1G1_C1_first(k,:)-ind_G2G2_C1_second(k,:,i));  
 
        G2G2_C1_G1G2(k,:,i)=abs(G1G2_C1_second(k,:)-ind_G2G2_C1_second(k,:,i));

        G2G2_C1_G2G1(k,:,i)=abs(G2G1_C1_first(k,:)-ind_G2G2_C1_second(k,:,i)); 
        
        G2G2_C1_G2G2(k,:,i)=abs(G2G2_C1_out_second(k,:,i)-ind_G2G2_C1_second(k,:,i)); 
        
        G2G2_C1_G3G1(k,:,i)=abs(G3G1_C1_first(k,:)-ind_G2G2_C1_second(k,:,i)); 
           
        G2G2_C1_G3G2(k,:,i)=abs(G3G2_C1_second(k,:)-ind_G2G2_C1_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_C1_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_C1_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_C1_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_C1_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_C1_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_C1_G3G2(:,:,i),2);

C1_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
C1_matrix4=(sum(C1_matrix4,3))./i;
[max_4, c] = ID_(C1_matrix4);
if c~=4
con_matC1(:,4) = 0;
end
con_matC1(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_C1_first,3) 
    for k=1:size(ind_G3G1_C1_first,2) 
        
        G3G1_C1_G1G1(k,:,i)=abs(G1G1_C1_first(k,:)-ind_G3G1_C1_first(k,:,i));  
 
        G3G1_C1_G1G2(k,:,i)=abs(G1G2_C1_second(k,:)-ind_G3G1_C1_first(k,:,i));

        G3G1_C1_G2G1(k,:,i)=abs(G2G1_C1_first(k,:)-ind_G3G1_C1_first(k,:,i)); 
        
        G3G1_C1_G2G2(k,:,i)=abs(G2G2_C1_second(k,:)-ind_G3G1_C1_first(k,:,i)); 
        
        G3G1_C1_G3G1(k,:,i)=abs(G3G1_C1_out_first(k,:,i)-ind_G3G1_C1_first(k,:,i)); 
           
        G3G1_C1_G3G2(k,:,i)=abs(G3G2_C1_second(k,:)-ind_G3G1_C1_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_C1_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_C1_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_C1_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_C1_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_C1_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_C1_G3G2(:,:,i),2);

C1_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
C1_matrix5=(sum(C1_matrix5,3))./i;
[max_5, c] = ID_(C1_matrix5);
if c~=5
con_matC1(:,5) = 0;
end
con_matC1(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of C1 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_C1_second,3) 
    for k=1:size(ind_G3G2_C1_second,2) 
        
        G3G2_C1_G1G1(k,:,i)=abs(G1G1_C1_first(k,:)-ind_G3G2_C1_second(k,:,i));  
 
        G3G2_C1_G1G2(k,:,i)=abs(G1G2_C1_second(k,:)-ind_G3G2_C1_second(k,:,i));

        G3G2_C1_G2G1(k,:,i)=abs(G2G1_C1_first(k,:)-ind_G3G2_C1_second(k,:,i)); 
        
        G3G2_C1_G2G2(k,:,i)=abs(G2G2_C1_second(k,:)-ind_G3G2_C1_second(k,:,i)); 
        
        G3G2_C1_G3G1(k,:,i)=abs(G3G1_C1_first(k,:)-ind_G3G2_C1_second(k,:,i)); 
           
        G3G2_C1_G3G2(k,:,i)=abs(G3G2_C1_out_second(k,:,i)-ind_G3G2_C1_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_C1_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_C1_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_C1_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_C1_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_C1_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_C1_G3G2(:,:,i),2);

C1_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
C1_matrix6=(sum(C1_matrix6,3))./i;
[max_6, c] = ID_(C1_matrix6);
if c~=6
con_matC1(:,6) = 0;
end
con_matC1(6,c) = max_6;
con_mat(:,:,1)=con_matC1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE C2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_C2_first,3) 
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

end
C2_matrix1=(sum(C2_matrix1,3))./i;
[max_1, c] = ID_(C2_matrix1);
if c~=1
con_matC2(:,1) = 0;
end
con_matC2(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_C2_second,3) 
    for k=1:size(ind_G1G2_C2_second,2) 
        
        G1G2_C2_G1G1(k,:,i)=abs(G1G1_C2_first(k,:)-ind_G1G2_C2_second(k,:,i));  
 
        G1G2_C2_G1G2(k,:,i)=abs(G1G2_C2_out_second(k,:,i)-ind_G1G2_C2_second(k,:,i));

        G1G2_C2_G2G1(k,:,i)=abs(G2G1_C2_first(k,:)-ind_G1G2_C2_second(k,:,i)); 
        
        G1G2_C2_G2G2(k,:,i)=abs(G2G2_C2_second(k,:)-ind_G1G2_C2_second(k,:,i)); 
        
        G1G2_C2_G3G1(k,:,i)=abs(G3G1_C2_first(k,:)-ind_G1G2_C2_second(k,:,i)); 
           
        G1G2_C2_G3G2(k,:,i)=abs(G3G2_C2_second(k,:)-ind_G1G2_C2_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_C2_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_C2_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_C2_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_C2_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_C2_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_C2_G3G2(:,:,i),2);

C2_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
C2_matrix2=(sum(C2_matrix2,3))./i;
[max_2, c] = ID_(C2_matrix2);
if c~=2
con_matC2(:,2) = 0;
end
con_matC2(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_C2_first,3) 
    for k=1:size(ind_G2G1_C2_first,2) 
        
        G2G1_C2_G1G1(k,:,i)=abs(G1G1_C2_first(k,:)-ind_G2G1_C2_first(k,:,i));  
 
        G2G1_C2_G1G2(k,:,i)=abs(G1G2_C2_second(k,:)-ind_G2G1_C2_first(k,:,i));

        G2G1_C2_G2G1(k,:,i)=abs(G2G1_C2_out_first(k,:,i)-ind_G2G1_C2_first(k,:,i)); 
        
        G2G1_C2_G2G2(k,:,i)=abs(G2G2_C2_second(k,:)-ind_G2G1_C2_first(k,:,i)); 
        
        G2G1_C2_G3G1(k,:,i)=abs(G3G1_C2_first(k,:)-ind_G2G1_C2_first(k,:,i)); 
           
        G2G1_C2_G3G2(k,:,i)=abs(G3G2_C2_second(k,:)-ind_G2G1_C2_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_C2_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_C2_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_C2_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_C2_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_C2_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_C2_G3G2(:,:,i),2);

C2_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
C2_matrix3=(sum(C2_matrix3,3))./i;
[max_3, c] = ID_(C2_matrix3);
if c~=3
con_matC2(:,3) = 0;
end
con_matC2(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_C2_second,3) 
    for k=1:size(ind_G2G2_C2_second,2) 
        
        G2G2_C2_G1G1(k,:,i)=abs(G1G1_C2_first(k,:)-ind_G2G2_C2_second(k,:,i));  
 
        G2G2_C2_G1G2(k,:,i)=abs(G1G2_C2_second(k,:)-ind_G2G2_C2_second(k,:,i));

        G2G2_C2_G2G1(k,:,i)=abs(G2G1_C2_first(k,:)-ind_G2G2_C2_second(k,:,i)); 
        
        G2G2_C2_G2G2(k,:,i)=abs(G2G2_C2_out_second(k,:,i)-ind_G2G2_C2_second(k,:,i)); 
        
        G2G2_C2_G3G1(k,:,i)=abs(G3G1_C2_first(k,:)-ind_G2G2_C2_second(k,:,i)); 
           
        G2G2_C2_G3G2(k,:,i)=abs(G3G2_C2_second(k,:)-ind_G2G2_C2_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_C2_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_C2_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_C2_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_C2_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_C2_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_C2_G3G2(:,:,i),2);

C2_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
C2_matrix4=(sum(C2_matrix4,3))./i;
[max_4, c] = ID_(C2_matrix4);
if c~=4
con_matC2(:,4) = 0;
end
con_matC2(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_C2_first,3) 
    for k=1:size(ind_G3G1_C2_first,2) 
        
        G3G1_C2_G1G1(k,:,i)=abs(G1G1_C2_first(k,:)-ind_G3G1_C2_first(k,:,i));  
 
        G3G1_C2_G1G2(k,:,i)=abs(G1G2_C2_second(k,:)-ind_G3G1_C2_first(k,:,i));

        G3G1_C2_G2G1(k,:,i)=abs(G2G1_C2_first(k,:)-ind_G3G1_C2_first(k,:,i)); 
        
        G3G1_C2_G2G2(k,:,i)=abs(G2G2_C2_second(k,:)-ind_G3G1_C2_first(k,:,i)); 
        
        G3G1_C2_G3G1(k,:,i)=abs(G3G1_C2_out_first(k,:,i)-ind_G3G1_C2_first(k,:,i)); 
           
        G3G1_C2_G3G2(k,:,i)=abs(G3G2_C2_second(k,:)-ind_G3G1_C2_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_C2_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_C2_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_C2_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_C2_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_C2_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_C2_G3G2(:,:,i),2);

C2_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
C2_matrix5=(sum(C2_matrix5,3))./i;
[max_5, c] = ID_(C2_matrix5);
if c~=5
con_matC2(:,5) = 0;
end
con_matC2(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of C2 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_C2_second,3) 
    for k=1:size(ind_G3G2_C2_second,2) 
        
        G3G2_C2_G1G1(k,:,i)=abs(G1G1_C2_first(k,:)-ind_G3G2_C2_second(k,:,i));  
 
        G3G2_C2_G1G2(k,:,i)=abs(G1G2_C2_second(k,:)-ind_G3G2_C2_second(k,:,i));

        G3G2_C2_G2G1(k,:,i)=abs(G2G1_C2_first(k,:)-ind_G3G2_C2_second(k,:,i)); 
        
        G3G2_C2_G2G2(k,:,i)=abs(G2G2_C2_second(k,:)-ind_G3G2_C2_second(k,:,i)); 
        
        G3G2_C2_G3G1(k,:,i)=abs(G3G1_C2_first(k,:)-ind_G3G2_C2_second(k,:,i)); 
           
        G3G2_C2_G3G2(k,:,i)=abs(G3G2_C2_out_second(k,:,i)-ind_G3G2_C2_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_C2_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_C2_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_C2_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_C2_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_C2_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_C2_G3G2(:,:,i),2);

C2_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
C2_matrix6=(sum(C2_matrix6,3))./i;
[max_6, c] = ID_(C2_matrix6);
if c~=6
con_matC2(:,6) = 0;
end
con_matC2(6,c) = max_6;
con_mat(:,:,2)=con_matC2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE C3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_C3_first,3) 
    for k=1:size(ind_G1G1_C3_first,2) 
        
        G1G1_C3_G1G1(k,:,i)=abs(G1G1_C3_out_first(k,:,i)-ind_G1G1_C3_first(k,:,i));  
 
        G1G1_C3_G1G2(k,:,i)=abs(G1G2_C3_second(k,:)-ind_G1G1_C3_first(k,:,i));

        G1G1_C3_G2G1(k,:,i)=abs(G2G1_C3_first(k,:)-ind_G1G1_C3_first(k,:,i)); 
        
        G1G1_C3_G2G2(k,:,i)=abs(G2G2_C3_second(k,:)-ind_G1G1_C3_first(k,:,i)); 
        
        G1G1_C3_G3G1(k,:,i)=abs(G3G1_C3_first(k,:)-ind_G1G1_C3_first(k,:,i)); 
           
        G1G1_C3_G3G2(k,:,i)=abs(G3G2_C3_second(k,:)-ind_G1G1_C3_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_C3_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_C3_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_C3_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_C3_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_C3_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_C3_G3G2(:,:,i),2);

C3_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
C3_matrix1=(sum(C3_matrix1,3))./i;
[max_1, c] = ID_(C3_matrix1);
if c~=1
con_matC3(:,1) = 0;
end
con_matC3(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_C3_second,3) 
    for k=1:size(ind_G1G2_C3_second,2) 
        
        G1G2_C3_G1G1(k,:,i)=abs(G1G1_C3_first(k,:)-ind_G1G2_C3_second(k,:,i));  
 
        G1G2_C3_G1G2(k,:,i)=abs(G1G2_C3_out_second(k,:,i)-ind_G1G2_C3_second(k,:,i));

        G1G2_C3_G2G1(k,:,i)=abs(G2G1_C3_first(k,:)-ind_G1G2_C3_second(k,:,i)); 
        
        G1G2_C3_G2G2(k,:,i)=abs(G2G2_C3_second(k,:)-ind_G1G2_C3_second(k,:,i)); 
        
        G1G2_C3_G3G1(k,:,i)=abs(G3G1_C3_first(k,:)-ind_G1G2_C3_second(k,:,i)); 
           
        G1G2_C3_G3G2(k,:,i)=abs(G3G2_C3_second(k,:)-ind_G1G2_C3_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_C3_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_C3_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_C3_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_C3_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_C3_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_C3_G3G2(:,:,i),2);

C3_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
C3_matrix2=(sum(C3_matrix2,3))./i;
[max_2, c] = ID_(C3_matrix2);
if c~=2
con_matC3(:,2) = 0;
end
con_matC3(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_C3_first,3) 
    for k=1:size(ind_G2G1_C3_first,2) 
        
        G2G1_C3_G1G1(k,:,i)=abs(G1G1_C3_first(k,:)-ind_G2G1_C3_first(k,:,i));  
 
        G2G1_C3_G1G2(k,:,i)=abs(G1G2_C3_second(k,:)-ind_G2G1_C3_first(k,:,i));

        G2G1_C3_G2G1(k,:,i)=abs(G2G1_C3_out_first(k,:,i)-ind_G2G1_C3_first(k,:,i)); 
        
        G2G1_C3_G2G2(k,:,i)=abs(G2G2_C3_second(k,:)-ind_G2G1_C3_first(k,:,i)); 
        
        G2G1_C3_G3G1(k,:,i)=abs(G3G1_C3_first(k,:)-ind_G2G1_C3_first(k,:,i)); 
           
        G2G1_C3_G3G2(k,:,i)=abs(G3G2_C3_second(k,:)-ind_G2G1_C3_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_C3_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_C3_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_C3_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_C3_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_C3_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_C3_G3G2(:,:,i),2);

C3_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
C3_matrix3=(sum(C3_matrix3,3))./i;
[max_3, c] = ID_(C3_matrix3);
if c~=3
con_matC3(:,3) = 0;
end
con_matC3(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_C3_second,3) 
    for k=1:size(ind_G2G2_C3_second,2) 
        
        G2G2_C3_G1G1(k,:,i)=abs(G1G1_C3_first(k,:)-ind_G2G2_C3_second(k,:,i));  
 
        G2G2_C3_G1G2(k,:,i)=abs(G1G2_C3_second(k,:)-ind_G2G2_C3_second(k,:,i));

        G2G2_C3_G2G1(k,:,i)=abs(G2G1_C3_first(k,:)-ind_G2G2_C3_second(k,:,i)); 
        
        G2G2_C3_G2G2(k,:,i)=abs(G2G2_C3_out_second(k,:,i)-ind_G2G2_C3_second(k,:,i)); 
        
        G2G2_C3_G3G1(k,:,i)=abs(G3G1_C3_first(k,:)-ind_G2G2_C3_second(k,:,i)); 
           
        G2G2_C3_G3G2(k,:,i)=abs(G3G2_C3_second(k,:)-ind_G2G2_C3_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_C3_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_C3_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_C3_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_C3_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_C3_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_C3_G3G2(:,:,i),2);

C3_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
C3_matrix4=(sum(C3_matrix4,3))./i;
[max_4, c] = ID_(C3_matrix4);
if c~=4
con_matC3(:,4) = 0;
end
con_matC3(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_C3_first,3) 
    for k=1:size(ind_G3G1_C3_first,2) 
        
        G3G1_C3_G1G1(k,:,i)=abs(G1G1_C3_first(k,:)-ind_G3G1_C3_first(k,:,i));  
 
        G3G1_C3_G1G2(k,:,i)=abs(G1G2_C3_second(k,:)-ind_G3G1_C3_first(k,:,i));

        G3G1_C3_G2G1(k,:,i)=abs(G2G1_C3_first(k,:)-ind_G3G1_C3_first(k,:,i)); 
        
        G3G1_C3_G2G2(k,:,i)=abs(G2G2_C3_second(k,:)-ind_G3G1_C3_first(k,:,i)); 
        
        G3G1_C3_G3G1(k,:,i)=abs(G3G1_C3_out_first(k,:,i)-ind_G3G1_C3_first(k,:,i)); 
           
        G3G1_C3_G3G2(k,:,i)=abs(G3G2_C3_second(k,:)-ind_G3G1_C3_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_C3_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_C3_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_C3_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_C3_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_C3_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_C3_G3G2(:,:,i),2);

C3_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
C3_matrix5=(sum(C3_matrix5,3))./i;
[max_5, c] = ID_(C3_matrix5);
if c~=5
con_matC3(:,5) = 0;
end
con_matC3(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of C3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_C3_second,3) 
    for k=1:size(ind_G3G2_C3_second,2) 
        
        G3G2_C3_G1G1(k,:,i)=abs(G1G1_C3_first(k,:)-ind_G3G2_C3_second(k,:,i));  
 
        G3G2_C3_G1G2(k,:,i)=abs(G1G2_C3_second(k,:)-ind_G3G2_C3_second(k,:,i));

        G3G2_C3_G2G1(k,:,i)=abs(G2G1_C3_first(k,:)-ind_G3G2_C3_second(k,:,i)); 
        
        G3G2_C3_G2G2(k,:,i)=abs(G2G2_C3_second(k,:)-ind_G3G2_C3_second(k,:,i)); 
        
        G3G2_C3_G3G1(k,:,i)=abs(G3G1_C3_first(k,:)-ind_G3G2_C3_second(k,:,i)); 
           
        G3G2_C3_G3G2(k,:,i)=abs(G3G2_C3_out_second(k,:,i)-ind_G3G2_C3_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_C3_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_C3_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_C3_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_C3_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_C3_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_C3_G3G2(:,:,i),2);

C3_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
C3_matrix6=(sum(C3_matrix6,3))./i;
[max_6, c] = ID_(C3_matrix6);
if c~=6
con_matC3(:,6) = 0;
end
con_matC3(6,c) = max_6;
con_mat(:,:,3)=con_matC3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE C4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_C4_first,3) 
    for k=1:size(ind_G1G1_C4_first,2) 
        
        G1G1_C4_G1G1(k,:,i)=abs(G1G1_C4_out_first(k,:,i)-ind_G1G1_C4_first(k,:,i));  
 
        G1G1_C4_G1G2(k,:,i)=abs(G1G2_C4_second(k,:)-ind_G1G1_C4_first(k,:,i));

        G1G1_C4_G2G1(k,:,i)=abs(G2G1_C4_first(k,:)-ind_G1G1_C4_first(k,:,i)); 
        
        G1G1_C4_G2G2(k,:,i)=abs(G2G2_C4_second(k,:)-ind_G1G1_C4_first(k,:,i)); 
        
        G1G1_C4_G3G1(k,:,i)=abs(G3G1_C4_first(k,:)-ind_G1G1_C4_first(k,:,i)); 
           
        G1G1_C4_G3G2(k,:,i)=abs(G3G2_C4_second(k,:)-ind_G1G1_C4_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_C4_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_C4_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_C4_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_C4_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_C4_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_C4_G3G2(:,:,i),2);

C4_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
C4_matrix1=(sum(C4_matrix1,3))./i;
[max_1, c] = ID_(C4_matrix1);
if c~=1
con_matC4(:,1) = 0;
end
con_matC4(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_C4_second,3) 
    for k=1:size(ind_G1G2_C4_second,2) 
        
        G1G2_C4_G1G1(k,:,i)=abs(G1G1_C4_first(k,:)-ind_G1G2_C4_second(k,:,i));  
 
        G1G2_C4_G1G2(k,:,i)=abs(G1G2_C4_out_second(k,:,i)-ind_G1G2_C4_second(k,:,i));

        G1G2_C4_G2G1(k,:,i)=abs(G2G1_C4_first(k,:)-ind_G1G2_C4_second(k,:,i)); 
        
        G1G2_C4_G2G2(k,:,i)=abs(G2G2_C4_second(k,:)-ind_G1G2_C4_second(k,:,i)); 
        
        G1G2_C4_G3G1(k,:,i)=abs(G3G1_C4_first(k,:)-ind_G1G2_C4_second(k,:,i)); 
           
        G1G2_C4_G3G2(k,:,i)=abs(G3G2_C4_second(k,:)-ind_G1G2_C4_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_C4_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_C4_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_C4_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_C4_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_C4_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_C4_G3G2(:,:,i),2);

C4_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
C4_matrix2=(sum(C4_matrix2,3))./i;
[max_2, c] = ID_(C4_matrix2);
if c~=2
con_matC4(:,2) = 0;
end
con_matC4(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_C4_first,3) 
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

C4_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
C4_matrix3=(sum(C4_matrix3,3))./i;
[max_3, c] = ID_(C4_matrix3);
if c~=3
con_matC4(:,3) = 0;
end
con_matC4(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_C4_second,3) 
    for k=1:size(ind_G2G2_C4_second,2) 
        
        G2G2_C4_G1G1(k,:,i)=abs(G1G1_C4_first(k,:)-ind_G2G2_C4_second(k,:,i));  
 
        G2G2_C4_G1G2(k,:,i)=abs(G1G2_C4_second(k,:)-ind_G2G2_C4_second(k,:,i));

        G2G2_C4_G2G1(k,:,i)=abs(G2G1_C4_first(k,:)-ind_G2G2_C4_second(k,:,i)); 
        
        G2G2_C4_G2G2(k,:,i)=abs(G2G2_C4_out_second(k,:,i)-ind_G2G2_C4_second(k,:,i)); 
        
        G2G2_C4_G3G1(k,:,i)=abs(G3G1_C4_first(k,:)-ind_G2G2_C4_second(k,:,i)); 
           
        G2G2_C4_G3G2(k,:,i)=abs(G3G2_C4_second(k,:)-ind_G2G2_C4_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_C4_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_C4_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_C4_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_C4_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_C4_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_C4_G3G2(:,:,i),2);

C4_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
C4_matrix4=(sum(C4_matrix4,3))./i;
[max_4, c] = ID_(C4_matrix4);
if c~=4
con_matC4(:,4) = 0;
end
con_matC4(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_C4_first,3) 
    for k=1:size(ind_G3G1_C4_first,2) 
        
        G3G1_C4_G1G1(k,:,i)=abs(G1G1_C4_first(k,:)-ind_G3G1_C4_first(k,:,i));  
 
        G3G1_C4_G1G2(k,:,i)=abs(G1G2_C4_second(k,:)-ind_G3G1_C4_first(k,:,i));

        G3G1_C4_G2G1(k,:,i)=abs(G2G1_C4_first(k,:)-ind_G3G1_C4_first(k,:,i)); 
        
        G3G1_C4_G2G2(k,:,i)=abs(G2G2_C4_second(k,:)-ind_G3G1_C4_first(k,:,i)); 
        
        G3G1_C4_G3G1(k,:,i)=abs(G3G1_C4_out_first(k,:,i)-ind_G3G1_C4_first(k,:,i)); 
           
        G3G1_C4_G3G2(k,:,i)=abs(G3G2_C4_second(k,:)-ind_G3G1_C4_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_C4_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_C4_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_C4_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_C4_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_C4_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_C4_G3G2(:,:,i),2);

C4_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
C4_matrix5=(sum(C4_matrix5,3))./i;
[max_5, c] = ID_(C4_matrix5);
if c~=5
con_matC4(:,5) = 0;
end
con_matC4(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of C4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_C4_second,3) 
    for k=1:size(ind_G3G2_C4_second,2) 
        
        G3G2_C4_G1G1(k,:,i)=abs(G1G1_C4_first(k,:)-ind_G3G2_C4_second(k,:,i));  
 
        G3G2_C4_G1G2(k,:,i)=abs(G1G2_C4_second(k,:)-ind_G3G2_C4_second(k,:,i));

        G3G2_C4_G2G1(k,:,i)=abs(G2G1_C4_first(k,:)-ind_G3G2_C4_second(k,:,i)); 
        
        G3G2_C4_G2G2(k,:,i)=abs(G2G2_C4_second(k,:)-ind_G3G2_C4_second(k,:,i)); 
        
        G3G2_C4_G3G1(k,:,i)=abs(G3G1_C4_first(k,:)-ind_G3G2_C4_second(k,:,i)); 
           
        G3G2_C4_G3G2(k,:,i)=abs(G3G2_C4_out_second(k,:,i)-ind_G3G2_C4_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_C4_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_C4_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_C4_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_C4_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_C4_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_C4_G3G2(:,:,i),2);

C4_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
C4_matrix6=(sum(C4_matrix6,3))./i;
[max_6, c] = ID_(C4_matrix6);
if c~=6
con_matC4(:,6) = 0;
end
con_matC4(6,c) = max_6;
con_mat(:,:,4)=con_matC4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE CZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_CZ_first,3) 
    for k=1:size(ind_G1G1_CZ_first,2) 
        
        G1G1_CZ_G1G1(k,:,i)=abs(G1G1_CZ_out_first(k,:,i)-ind_G1G1_CZ_first(k,:,i));  
 
        G1G1_CZ_G1G2(k,:,i)=abs(G1G2_CZ_second(k,:)-ind_G1G1_CZ_first(k,:,i));

        G1G1_CZ_G2G1(k,:,i)=abs(G2G1_CZ_first(k,:)-ind_G1G1_CZ_first(k,:,i)); 
        
        G1G1_CZ_G2G2(k,:,i)=abs(G2G2_CZ_second(k,:)-ind_G1G1_CZ_first(k,:,i)); 
        
        G1G1_CZ_G3G1(k,:,i)=abs(G3G1_CZ_first(k,:)-ind_G1G1_CZ_first(k,:,i)); 
           
        G1G1_CZ_G3G2(k,:,i)=abs(G3G2_CZ_second(k,:)-ind_G1G1_CZ_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_CZ_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_CZ_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_CZ_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_CZ_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_CZ_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_CZ_G3G2(:,:,i),2);

CZ_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
CZ_matrix1=(sum(CZ_matrix1,3))./i;
[max_1, c] = ID_(CZ_matrix1);
if c~=1
con_matCZ(:,1) = 0;
end
con_matCZ(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_CZ_second,3) 
    for k=1:size(ind_G1G2_CZ_second,2) 
        
        G1G2_CZ_G1G1(k,:,i)=abs(G1G1_CZ_first(k,:)-ind_G1G2_CZ_second(k,:,i));  
 
        G1G2_CZ_G1G2(k,:,i)=abs(G1G2_CZ_out_second(k,:,i)-ind_G1G2_CZ_second(k,:,i));

        G1G2_CZ_G2G1(k,:,i)=abs(G2G1_CZ_first(k,:)-ind_G1G2_CZ_second(k,:,i)); 
        
        G1G2_CZ_G2G2(k,:,i)=abs(G2G2_CZ_second(k,:)-ind_G1G2_CZ_second(k,:,i)); 
        
        G1G2_CZ_G3G1(k,:,i)=abs(G3G1_CZ_first(k,:)-ind_G1G2_CZ_second(k,:,i)); 
           
        G1G2_CZ_G3G2(k,:,i)=abs(G3G2_CZ_second(k,:)-ind_G1G2_CZ_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_CZ_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_CZ_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_CZ_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_CZ_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_CZ_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_CZ_G3G2(:,:,i),2);

CZ_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
CZ_matrix2=(sum(CZ_matrix2,3))./i;
[max_2, c] = ID_(CZ_matrix2);
if c~=2
con_matCZ(:,2) = 0;
end
con_matCZ(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_CZ_first,3) 
    for k=1:size(ind_G2G1_CZ_first,2) 
        
        G2G1_CZ_G1G1(k,:,i)=abs(G1G1_CZ_first(k,:)-ind_G2G1_CZ_first(k,:,i));  
 
        G2G1_CZ_G1G2(k,:,i)=abs(G1G2_CZ_second(k,:)-ind_G2G1_CZ_first(k,:,i));

        G2G1_CZ_G2G1(k,:,i)=abs(G2G1_CZ_out_first(k,:,i)-ind_G2G1_CZ_first(k,:,i)); 
        
        G2G1_CZ_G2G2(k,:,i)=abs(G2G2_CZ_second(k,:)-ind_G2G1_CZ_first(k,:,i)); 
        
        G2G1_CZ_G3G1(k,:,i)=abs(G3G1_CZ_first(k,:)-ind_G2G1_CZ_first(k,:,i)); 
           
        G2G1_CZ_G3G2(k,:,i)=abs(G3G2_CZ_second(k,:)-ind_G2G1_CZ_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_CZ_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_CZ_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_CZ_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_CZ_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_CZ_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_CZ_G3G2(:,:,i),2);

CZ_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
CZ_matrix3=(sum(CZ_matrix3,3))./i;
[max_3, c] = ID_(CZ_matrix3);
if c~=3
con_matCZ(:,3) = 0;
end
con_matCZ(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_CZ_second,3) 
    for k=1:size(ind_G2G2_CZ_second,2) 
        
        G2G2_CZ_G1G1(k,:,i)=abs(G1G1_CZ_first(k,:)-ind_G2G2_CZ_second(k,:,i));  
 
        G2G2_CZ_G1G2(k,:,i)=abs(G1G2_CZ_second(k,:)-ind_G2G2_CZ_second(k,:,i));

        G2G2_CZ_G2G1(k,:,i)=abs(G2G1_CZ_first(k,:)-ind_G2G2_CZ_second(k,:,i)); 
        
        G2G2_CZ_G2G2(k,:,i)=abs(G2G2_CZ_out_second(k,:,i)-ind_G2G2_CZ_second(k,:,i)); 
        
        G2G2_CZ_G3G1(k,:,i)=abs(G3G1_CZ_first(k,:)-ind_G2G2_CZ_second(k,:,i)); 
           
        G2G2_CZ_G3G2(k,:,i)=abs(G3G2_CZ_second(k,:)-ind_G2G2_CZ_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_CZ_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_CZ_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_CZ_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_CZ_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_CZ_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_CZ_G3G2(:,:,i),2);

CZ_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
CZ_matrix4=(sum(CZ_matrix4,3))./i;
[max_4, c] = ID_(CZ_matrix4);
if c~=4
con_matCZ(:,4) = 0;
end
con_matCZ(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_CZ_first,3) 
    for k=1:size(ind_G3G1_CZ_first,2) 
        
        G3G1_CZ_G1G1(k,:,i)=abs(G1G1_CZ_first(k,:)-ind_G3G1_CZ_first(k,:,i));  
 
        G3G1_CZ_G1G2(k,:,i)=abs(G1G2_CZ_second(k,:)-ind_G3G1_CZ_first(k,:,i));

        G3G1_CZ_G2G1(k,:,i)=abs(G2G1_CZ_first(k,:)-ind_G3G1_CZ_first(k,:,i)); 
        
        G3G1_CZ_G2G2(k,:,i)=abs(G2G2_CZ_second(k,:)-ind_G3G1_CZ_first(k,:,i)); 
        
        G3G1_CZ_G3G1(k,:,i)=abs(G3G1_CZ_out_first(k,:,i)-ind_G3G1_CZ_first(k,:,i)); 
           
        G3G1_CZ_G3G2(k,:,i)=abs(G3G2_CZ_second(k,:)-ind_G3G1_CZ_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_CZ_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_CZ_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_CZ_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_CZ_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_CZ_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_CZ_G3G2(:,:,i),2);

CZ_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
CZ_matrix5=(sum(CZ_matrix5,3))./i;
[max_5, c] = ID_(CZ_matrix5);
if c~=5
con_matCZ(:,5) = 0;
end
con_matCZ(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of CZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_CZ_second,3) 
    for k=1:size(ind_G3G2_CZ_second,2) 
        
        G3G2_CZ_G1G1(k,:,i)=abs(G1G1_CZ_first(k,:)-ind_G3G2_CZ_second(k,:,i));  
 
        G3G2_CZ_G1G2(k,:,i)=abs(G1G2_CZ_second(k,:)-ind_G3G2_CZ_second(k,:,i));

        G3G2_CZ_G2G1(k,:,i)=abs(G2G1_CZ_first(k,:)-ind_G3G2_CZ_second(k,:,i)); 
        
        G3G2_CZ_G2G2(k,:,i)=abs(G2G2_CZ_second(k,:)-ind_G3G2_CZ_second(k,:,i)); 
        
        G3G2_CZ_G3G1(k,:,i)=abs(G3G1_CZ_first(k,:)-ind_G3G2_CZ_second(k,:,i)); 
           
        G3G2_CZ_G3G2(k,:,i)=abs(G3G2_CZ_out_second(k,:,i)-ind_G3G2_CZ_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_CZ_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_CZ_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_CZ_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_CZ_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_CZ_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_CZ_G3G2(:,:,i),2);

CZ_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
CZ_matrix6=(sum(CZ_matrix6,3))./i;
[max_6, c] = ID_(CZ_matrix6);
if c~=6
con_matCZ(:,6) = 0;
end
con_matCZ(6,c) = max_6;
con_mat(:,:,5)=con_matCZ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE F3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_F3_first,3) 
    for k=1:size(ind_G1G1_F3_first,2) 
        
        G1G1_F3_G1G1(k,:,i)=abs(G1G1_F3_out_first(k,:,i)-ind_G1G1_F3_first(k,:,i));  
 
        G1G1_F3_G1G2(k,:,i)=abs(G1G2_F3_second(k,:)-ind_G1G1_F3_first(k,:,i));

        G1G1_F3_G2G1(k,:,i)=abs(G2G1_F3_first(k,:)-ind_G1G1_F3_first(k,:,i)); 
        
        G1G1_F3_G2G2(k,:,i)=abs(G2G2_F3_second(k,:)-ind_G1G1_F3_first(k,:,i)); 
        
        G1G1_F3_G3G1(k,:,i)=abs(G3G1_F3_first(k,:)-ind_G1G1_F3_first(k,:,i)); 
           
        G1G1_F3_G3G2(k,:,i)=abs(G3G2_F3_second(k,:)-ind_G1G1_F3_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_F3_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_F3_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_F3_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_F3_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_F3_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_F3_G3G2(:,:,i),2);

F3_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
F3_matrix1=(sum(F3_matrix1,3))./i;
[max_1, c] = ID_(F3_matrix1);
if c~=1
con_matF3(:,1) = 0;
end
con_matF3(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_F3_second,3) 
    for k=1:size(ind_G1G2_F3_second,2) 
        
        G1G2_F3_G1G1(k,:,i)=abs(G1G1_F3_first(k,:)-ind_G1G2_F3_second(k,:,i));  
 
        G1G2_F3_G1G2(k,:,i)=abs(G1G2_F3_out_second(k,:,i)-ind_G1G2_F3_second(k,:,i));

        G1G2_F3_G2G1(k,:,i)=abs(G2G1_F3_first(k,:)-ind_G1G2_F3_second(k,:,i)); 
        
        G1G2_F3_G2G2(k,:,i)=abs(G2G2_F3_second(k,:)-ind_G1G2_F3_second(k,:,i)); 
        
        G1G2_F3_G3G1(k,:,i)=abs(G3G1_F3_first(k,:)-ind_G1G2_F3_second(k,:,i)); 
           
        G1G2_F3_G3G2(k,:,i)=abs(G3G2_F3_second(k,:)-ind_G1G2_F3_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_F3_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_F3_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_F3_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_F3_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_F3_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_F3_G3G2(:,:,i),2);

F3_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
F3_matrix2=(sum(F3_matrix2,3))./i;
[max_2, c] = ID_(F3_matrix2);
if c~=2
con_matF3(:,2) = 0;
end
con_matF3(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_F3_first,3) 
    for k=1:size(ind_G2G1_F3_first,2) 
        
        G2G1_F3_G1G1(k,:,i)=abs(G1G1_F3_first(k,:)-ind_G2G1_F3_first(k,:,i));  
 
        G2G1_F3_G1G2(k,:,i)=abs(G1G2_F3_second(k,:)-ind_G2G1_F3_first(k,:,i));

        G2G1_F3_G2G1(k,:,i)=abs(G2G1_F3_out_first(k,:,i)-ind_G2G1_F3_first(k,:,i)); 
        
        G2G1_F3_G2G2(k,:,i)=abs(G2G2_F3_second(k,:)-ind_G2G1_F3_first(k,:,i)); 
        
        G2G1_F3_G3G1(k,:,i)=abs(G3G1_F3_first(k,:)-ind_G2G1_F3_first(k,:,i)); 
           
        G2G1_F3_G3G2(k,:,i)=abs(G3G2_F3_second(k,:)-ind_G2G1_F3_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_F3_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_F3_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_F3_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_F3_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_F3_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_F3_G3G2(:,:,i),2);

F3_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
F3_matrix3=(sum(F3_matrix3,3))./i;
[max_3, c] = ID_(F3_matrix3);
if c~=3
con_matF3(:,3) = 0;
end
con_matF3(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_F3_second,3) 
    for k=1:size(ind_G2G2_F3_second,2) 
        
        G2G2_F3_G1G1(k,:,i)=abs(G1G1_F3_first(k,:)-ind_G2G2_F3_second(k,:,i));  
 
        G2G2_F3_G1G2(k,:,i)=abs(G1G2_F3_second(k,:)-ind_G2G2_F3_second(k,:,i));

        G2G2_F3_G2G1(k,:,i)=abs(G2G1_F3_first(k,:)-ind_G2G2_F3_second(k,:,i)); 
        
        G2G2_F3_G2G2(k,:,i)=abs(G2G2_F3_out_second(k,:,i)-ind_G2G2_F3_second(k,:,i)); 
        
        G2G2_F3_G3G1(k,:,i)=abs(G3G1_F3_first(k,:)-ind_G2G2_F3_second(k,:,i)); 
           
        G2G2_F3_G3G2(k,:,i)=abs(G3G2_F3_second(k,:)-ind_G2G2_F3_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_F3_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_F3_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_F3_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_F3_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_F3_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_F3_G3G2(:,:,i),2);

F3_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
F3_matrix4=(sum(F3_matrix4,3))./i;
[max_4, c] = ID_(F3_matrix4);
if c~=4
con_matF3(:,4) = 0;
end
con_matF3(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_F3_first,3) 
    for k=1:size(ind_G3G1_F3_first,2) 
        
        G3G1_F3_G1G1(k,:,i)=abs(G1G1_F3_first(k,:)-ind_G3G1_F3_first(k,:,i));  
 
        G3G1_F3_G1G2(k,:,i)=abs(G1G2_F3_second(k,:)-ind_G3G1_F3_first(k,:,i));

        G3G1_F3_G2G1(k,:,i)=abs(G2G1_F3_first(k,:)-ind_G3G1_F3_first(k,:,i)); 
        
        G3G1_F3_G2G2(k,:,i)=abs(G2G2_F3_second(k,:)-ind_G3G1_F3_first(k,:,i)); 
        
        G3G1_F3_G3G1(k,:,i)=abs(G3G1_F3_out_first(k,:,i)-ind_G3G1_F3_first(k,:,i)); 
           
        G3G1_F3_G3G2(k,:,i)=abs(G3G2_F3_second(k,:)-ind_G3G1_F3_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_F3_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_F3_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_F3_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_F3_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_F3_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_F3_G3G2(:,:,i),2);

F3_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
F3_matrix5=(sum(F3_matrix5,3))./i;
[max_5, c] = ID_(F3_matrix5);
if c~=5
con_matF3(:,5) = 0;
end
con_matF3(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of F3 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_F3_second,3) 
    for k=1:size(ind_G3G2_F3_second,2) 
        
        G3G2_F3_G1G1(k,:,i)=abs(G1G1_F3_first(k,:)-ind_G3G2_F3_second(k,:,i));  
 
        G3G2_F3_G1G2(k,:,i)=abs(G1G2_F3_second(k,:)-ind_G3G2_F3_second(k,:,i));

        G3G2_F3_G2G1(k,:,i)=abs(G2G1_F3_first(k,:)-ind_G3G2_F3_second(k,:,i)); 
        
        G3G2_F3_G2G2(k,:,i)=abs(G2G2_F3_second(k,:)-ind_G3G2_F3_second(k,:,i)); 
        
        G3G2_F3_G3G1(k,:,i)=abs(G3G1_F3_first(k,:)-ind_G3G2_F3_second(k,:,i)); 
           
        G3G2_F3_G3G2(k,:,i)=abs(G3G2_F3_out_second(k,:,i)-ind_G3G2_F3_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_F3_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_F3_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_F3_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_F3_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_F3_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_F3_G3G2(:,:,i),2);

F3_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
F3_matrix6=(sum(F3_matrix6,3))./i;
[max_6, c] = ID_(F3_matrix6);
if c~=6
con_matF3(:,6) = 0;
end
con_matF3(6,c) = max_6;
con_mat(:,:,6)=con_matF3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE F4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_F4_first,3) 
    for k=1:size(ind_G1G1_F4_first,2) 
        
        G1G1_F4_G1G1(k,:,i)=abs(G1G1_F4_out_first(k,:,i)-ind_G1G1_F4_first(k,:,i));  
 
        G1G1_F4_G1G2(k,:,i)=abs(G1G2_F4_second(k,:)-ind_G1G1_F4_first(k,:,i));

        G1G1_F4_G2G1(k,:,i)=abs(G2G1_F4_first(k,:)-ind_G1G1_F4_first(k,:,i)); 
        
        G1G1_F4_G2G2(k,:,i)=abs(G2G2_F4_second(k,:)-ind_G1G1_F4_first(k,:,i)); 
        
        G1G1_F4_G3G1(k,:,i)=abs(G3G1_F4_first(k,:)-ind_G1G1_F4_first(k,:,i)); 
           
        G1G1_F4_G3G2(k,:,i)=abs(G3G2_F4_second(k,:)-ind_G1G1_F4_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_F4_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_F4_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_F4_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_F4_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_F4_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_F4_G3G2(:,:,i),2);

F4_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
F4_matrix1=(sum(F4_matrix1,3))./i;
[max_1, c] = ID_(F4_matrix1);
if c~=1
con_matF4(:,1) = 0;
end
con_matF4(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_F4_second,3) 
    for k=1:size(ind_G1G2_F4_second,2) 
        
        G1G2_F4_G1G1(k,:,i)=abs(G1G1_F4_first(k,:)-ind_G1G2_F4_second(k,:,i));  
 
        G1G2_F4_G1G2(k,:,i)=abs(G1G2_F4_out_second(k,:,i)-ind_G1G2_F4_second(k,:,i));

        G1G2_F4_G2G1(k,:,i)=abs(G2G1_F4_first(k,:)-ind_G1G2_F4_second(k,:,i)); 
        
        G1G2_F4_G2G2(k,:,i)=abs(G2G2_F4_second(k,:)-ind_G1G2_F4_second(k,:,i)); 
        
        G1G2_F4_G3G1(k,:,i)=abs(G3G1_F4_first(k,:)-ind_G1G2_F4_second(k,:,i)); 
           
        G1G2_F4_G3G2(k,:,i)=abs(G3G2_F4_second(k,:)-ind_G1G2_F4_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_F4_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_F4_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_F4_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_F4_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_F4_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_F4_G3G2(:,:,i),2);

F4_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
F4_matrix2=(sum(F4_matrix2,3))./i;
[max_2, c] = ID_(F4_matrix2);
if c~=2
con_matF4(:,2) = 0;
end
con_matF4(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_F4_first,3) 
    for k=1:size(ind_G2G1_F4_first,2) 
        
        G2G1_F4_G1G1(k,:,i)=abs(G1G1_F4_first(k,:)-ind_G2G1_F4_first(k,:,i));  
 
        G2G1_F4_G1G2(k,:,i)=abs(G1G2_F4_second(k,:)-ind_G2G1_F4_first(k,:,i));

        G2G1_F4_G2G1(k,:,i)=abs(G2G1_F4_out_first(k,:,i)-ind_G2G1_F4_first(k,:,i)); 
        
        G2G1_F4_G2G2(k,:,i)=abs(G2G2_F4_second(k,:)-ind_G2G1_F4_first(k,:,i)); 
        
        G2G1_F4_G3G1(k,:,i)=abs(G3G1_F4_first(k,:)-ind_G2G1_F4_first(k,:,i)); 
           
        G2G1_F4_G3G2(k,:,i)=abs(G3G2_F4_second(k,:)-ind_G2G1_F4_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_F4_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_F4_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_F4_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_F4_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_F4_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_F4_G3G2(:,:,i),2);

F4_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
F4_matrix3=(sum(F4_matrix3,3))./i;
[max_3, c] = ID_(F4_matrix3);
if c~=3
con_matF4(:,3) = 0;
end
con_matF4(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_F4_second,3) 
    for k=1:size(ind_G2G2_F4_second,2) 
        
        G2G2_F4_G1G1(k,:,i)=abs(G1G1_F4_first(k,:)-ind_G2G2_F4_second(k,:,i));  
 
        G2G2_F4_G1G2(k,:,i)=abs(G1G2_F4_second(k,:)-ind_G2G2_F4_second(k,:,i));

        G2G2_F4_G2G1(k,:,i)=abs(G2G1_F4_first(k,:)-ind_G2G2_F4_second(k,:,i)); 
        
        G2G2_F4_G2G2(k,:,i)=abs(G2G2_F4_out_second(k,:,i)-ind_G2G2_F4_second(k,:,i)); 
        
        G2G2_F4_G3G1(k,:,i)=abs(G3G1_F4_first(k,:)-ind_G2G2_F4_second(k,:,i)); 
           
        G2G2_F4_G3G2(k,:,i)=abs(G3G2_F4_second(k,:)-ind_G2G2_F4_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_F4_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_F4_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_F4_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_F4_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_F4_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_F4_G3G2(:,:,i),2);

F4_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
F4_matrix4=(sum(F4_matrix4,3))./i;
[max_4, c] = ID_(F4_matrix4);
if c~=4
con_matF4(:,4) = 0;
end
con_matF4(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_F4_first,3) 
    for k=1:size(ind_G3G1_F4_first,2) 
        
        G3G1_F4_G1G1(k,:,i)=abs(G1G1_F4_first(k,:)-ind_G3G1_F4_first(k,:,i));  
 
        G3G1_F4_G1G2(k,:,i)=abs(G1G2_F4_second(k,:)-ind_G3G1_F4_first(k,:,i));

        G3G1_F4_G2G1(k,:,i)=abs(G2G1_F4_first(k,:)-ind_G3G1_F4_first(k,:,i)); 
        
        G3G1_F4_G2G2(k,:,i)=abs(G2G2_F4_second(k,:)-ind_G3G1_F4_first(k,:,i)); 
        
        G3G1_F4_G3G1(k,:,i)=abs(G3G1_F4_out_first(k,:,i)-ind_G3G1_F4_first(k,:,i)); 
           
        G3G1_F4_G3G2(k,:,i)=abs(G3G2_F4_second(k,:)-ind_G3G1_F4_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_F4_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_F4_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_F4_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_F4_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_F4_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_F4_G3G2(:,:,i),2);

F4_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
F4_matrix5=(sum(F4_matrix5,3))./i;
[max_5, c] = ID_(F4_matrix5);
if c~=5
con_matF4(:,5) = 0;
end
con_matF4(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of F4 CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_F4_second,3) 
    for k=1:size(ind_G3G2_F4_second,2) 
        
        G3G2_F4_G1G1(k,:,i)=abs(G1G1_F4_first(k,:)-ind_G3G2_F4_second(k,:,i));  
 
        G3G2_F4_G1G2(k,:,i)=abs(G1G2_F4_second(k,:)-ind_G3G2_F4_second(k,:,i));

        G3G2_F4_G2G1(k,:,i)=abs(G2G1_F4_first(k,:)-ind_G3G2_F4_second(k,:,i)); 
        
        G3G2_F4_G2G2(k,:,i)=abs(G2G2_F4_second(k,:)-ind_G3G2_F4_second(k,:,i)); 
        
        G3G2_F4_G3G1(k,:,i)=abs(G3G1_F4_first(k,:)-ind_G3G2_F4_second(k,:,i)); 
           
        G3G2_F4_G3G2(k,:,i)=abs(G3G2_F4_out_second(k,:,i)-ind_G3G2_F4_second(k,:,i)); 
                    
    end 
    
matrixG3G2(:,1,i)=sum(G3G2_F4_G1G1(:,:,i),2);

matrixG3G2(:,2,i)= sum(G3G2_F4_G1G2(:,:,i),2);

matrixG3G2(:,3,i)= sum(G3G2_F4_G2G1(:,:,i),2);

matrixG3G2(:,4,i)= sum(G3G2_F4_G2G2(:,:,i),2);

matrixG3G2(:,5,i)= sum(G3G2_F4_G3G1(:,:,i),2);

matrixG3G2(:,6,i)= sum(G3G2_F4_G3G2(:,:,i),2);

F4_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
F4_matrix6=(sum(F4_matrix6,3))./i;
[max_6, c] = ID_(F4_matrix6);
if c~=6
con_matF4(:,6) = 0;
end
con_matF4(6,c) = max_6;
con_mat(:,:,7)=con_matF4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% ELECTRODE FZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRST ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G1_FZ_first,3) 
    for k=1:size(ind_G1G1_FZ_first,2) 
        
        G1G1_FZ_G1G1(k,:,i)=abs(G1G1_FZ_out_first(k,:,i)-ind_G1G1_FZ_first(k,:,i));  
 
        G1G1_FZ_G1G2(k,:,i)=abs(G1G2_FZ_second(k,:)-ind_G1G1_FZ_first(k,:,i));

        G1G1_FZ_G2G1(k,:,i)=abs(G2G1_FZ_first(k,:)-ind_G1G1_FZ_first(k,:,i)); 
        
        G1G1_FZ_G2G2(k,:,i)=abs(G2G2_FZ_second(k,:)-ind_G1G1_FZ_first(k,:,i)); 
        
        G1G1_FZ_G3G1(k,:,i)=abs(G3G1_FZ_first(k,:)-ind_G1G1_FZ_first(k,:,i)); 
           
        G1G1_FZ_G3G2(k,:,i)=abs(G3G2_FZ_second(k,:)-ind_G1G1_FZ_first(k,:,i)); 
                    
    end 
    
matrixG1G1(:,1,i)=sum(G1G1_FZ_G1G1(:,:,i),2);

matrixG1G1(:,2,i)= sum(G1G1_FZ_G1G2(:,:,i),2);

matrixG1G1(:,3,i)= sum(G1G1_FZ_G2G1(:,:,i),2);

matrixG1G1(:,4,i)= sum(G1G1_FZ_G2G2(:,:,i),2);

matrixG1G1(:,5,i)= sum(G1G1_FZ_G3G1(:,:,i),2);

matrixG1G1(:,6,i)= sum(G1G1_FZ_G3G2(:,:,i),2);

FZ_matrix1(:,:,i)=CMt_(matrixG1G1(:,:,i));

end
FZ_matrix1=(sum(FZ_matrix1,3))./i;
[max_1, c] = ID_(FZ_matrix1);
if c~=1
con_matFZ(:,1) = 0;
end
con_matFZ(1,c) = max_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECOND ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G1G2_FZ_second,3) 
    for k=1:size(ind_G1G2_FZ_second,2) 
        
        G1G2_FZ_G1G1(k,:,i)=abs(G1G1_FZ_first(k,:)-ind_G1G2_FZ_second(k,:,i));  
 
        G1G2_FZ_G1G2(k,:,i)=abs(G1G2_FZ_out_second(k,:,i)-ind_G1G2_FZ_second(k,:,i));

        G1G2_FZ_G2G1(k,:,i)=abs(G2G1_FZ_first(k,:)-ind_G1G2_FZ_second(k,:,i)); 
        
        G1G2_FZ_G2G2(k,:,i)=abs(G2G2_FZ_second(k,:)-ind_G1G2_FZ_second(k,:,i)); 
        
        G1G2_FZ_G3G1(k,:,i)=abs(G3G1_FZ_first(k,:)-ind_G1G2_FZ_second(k,:,i)); 
           
        G1G2_FZ_G3G2(k,:,i)=abs(G3G2_FZ_second(k,:)-ind_G1G2_FZ_second(k,:,i)); 
                    
    end 
    
matrixG1G2(:,1,i)=sum(G1G2_FZ_G1G1(:,:,i),2);

matrixG1G2(:,2,i)= sum(G1G2_FZ_G1G2(:,:,i),2);

matrixG1G2(:,3,i)= sum(G1G2_FZ_G2G1(:,:,i),2);

matrixG1G2(:,4,i)= sum(G1G2_FZ_G2G2(:,:,i),2);

matrixG1G2(:,5,i)= sum(G1G2_FZ_G3G1(:,:,i),2);

matrixG1G2(:,6,i)= sum(G1G2_FZ_G3G2(:,:,i),2);

FZ_matrix2(:,:,i)=CMt_(matrixG1G2(:,:,i));

end
FZ_matrix2=(sum(FZ_matrix2,3))./i;
[max_2, c] = ID_(FZ_matrix2);
if c~=2
con_matFZ(:,2) = 0;
end
con_matFZ(2,c) = max_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIRD ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G1_FZ_first,3) 
    for k=1:size(ind_G2G1_FZ_first,2) 
        
        G2G1_FZ_G1G1(k,:,i)=abs(G1G1_FZ_first(k,:)-ind_G2G1_FZ_first(k,:,i));  
 
        G2G1_FZ_G1G2(k,:,i)=abs(G1G2_FZ_second(k,:)-ind_G2G1_FZ_first(k,:,i));

        G2G1_FZ_G2G1(k,:,i)=abs(G2G1_FZ_out_first(k,:,i)-ind_G2G1_FZ_first(k,:,i)); 
        
        G2G1_FZ_G2G2(k,:,i)=abs(G2G2_FZ_second(k,:)-ind_G2G1_FZ_first(k,:,i)); 
        
        G2G1_FZ_G3G1(k,:,i)=abs(G3G1_FZ_first(k,:)-ind_G2G1_FZ_first(k,:,i)); 
           
        G2G1_FZ_G3G2(k,:,i)=abs(G3G2_FZ_second(k,:)-ind_G2G1_FZ_first(k,:,i)); 
                    
    end 
    
matrixG2G1(:,1,i)=sum(G2G1_FZ_G1G1(:,:,i),2);

matrixG2G1(:,2,i)= sum(G2G1_FZ_G1G2(:,:,i),2);

matrixG2G1(:,3,i)= sum(G2G1_FZ_G2G1(:,:,i),2);

matrixG2G1(:,4,i)= sum(G2G1_FZ_G2G2(:,:,i),2);

matrixG2G1(:,5,i)= sum(G2G1_FZ_G3G1(:,:,i),2);

matrixG2G1(:,6,i)= sum(G2G1_FZ_G3G2(:,:,i),2);

FZ_matrix3(:,:,i)=CMt_(matrixG2G1(:,:,i));

end
FZ_matrix3=(sum(FZ_matrix3,3))./i;
[max_3, c] = ID_(FZ_matrix3);
if c~=3
con_matFZ(:,3) = 0;
end
con_matFZ(3,c) = max_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G2G2_FZ_second,3) 
    for k=1:size(ind_G2G2_FZ_second,2) 
        
        G2G2_FZ_G1G1(k,:,i)=abs(G1G1_FZ_first(k,:)-ind_G2G2_FZ_second(k,:,i));  
 
        G2G2_FZ_G1G2(k,:,i)=abs(G1G2_FZ_second(k,:)-ind_G2G2_FZ_second(k,:,i));

        G2G2_FZ_G2G1(k,:,i)=abs(G2G1_FZ_first(k,:)-ind_G2G2_FZ_second(k,:,i)); 
        
        G2G2_FZ_G2G2(k,:,i)=abs(G2G2_FZ_out_second(k,:,i)-ind_G2G2_FZ_second(k,:,i)); 
        
        G2G2_FZ_G3G1(k,:,i)=abs(G3G1_FZ_first(k,:)-ind_G2G2_FZ_second(k,:,i)); 
           
        G2G2_FZ_G3G2(k,:,i)=abs(G3G2_FZ_second(k,:)-ind_G2G2_FZ_second(k,:,i)); 
                    
    end 
    
matrixG2G2(:,1,i)=sum(G2G2_FZ_G1G1(:,:,i),2);

matrixG2G2(:,2,i)= sum(G2G2_FZ_G1G2(:,:,i),2);

matrixG2G2(:,3,i)= sum(G2G2_FZ_G2G1(:,:,i),2);

matrixG2G2(:,4,i)= sum(G2G2_FZ_G2G2(:,:,i),2);

matrixG2G2(:,5,i)= sum(G2G2_FZ_G3G1(:,:,i),2);

matrixG2G2(:,6,i)= sum(G2G2_FZ_G3G2(:,:,i),2);

FZ_matrix4(:,:,i)=CMt_(matrixG2G2(:,:,i));

end
FZ_matrix4=(sum(FZ_matrix4,3))./i;
[max_4, c] = ID_(FZ_matrix4);
if c~=4
con_matFZ(:,4) = 0;
end
con_matFZ(4,c) = max_4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fith ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G1_FZ_first,3) 
    for k=1:size(ind_G3G1_FZ_first,2) 
        
        G3G1_FZ_G1G1(k,:,i)=abs(G1G1_FZ_first(k,:)-ind_G3G1_FZ_first(k,:,i));  
 
        G3G1_FZ_G1G2(k,:,i)=abs(G1G2_FZ_second(k,:)-ind_G3G1_FZ_first(k,:,i));

        G3G1_FZ_G2G1(k,:,i)=abs(G2G1_FZ_first(k,:)-ind_G3G1_FZ_first(k,:,i)); 
        
        G3G1_FZ_G2G2(k,:,i)=abs(G2G2_FZ_second(k,:)-ind_G3G1_FZ_first(k,:,i)); 
        
        G3G1_FZ_G3G1(k,:,i)=abs(G3G1_FZ_out_first(k,:,i)-ind_G3G1_FZ_first(k,:,i)); 
           
        G3G1_FZ_G3G2(k,:,i)=abs(G3G2_FZ_second(k,:)-ind_G3G1_FZ_first(k,:,i)); 
                    
    end 
    
matrixG3G1(:,1,i)=sum(G3G1_FZ_G1G1(:,:,i),2);

matrixG3G1(:,2,i)= sum(G3G1_FZ_G1G2(:,:,i),2);

matrixG3G1(:,3,i)= sum(G3G1_FZ_G2G1(:,:,i),2);

matrixG3G1(:,4,i)= sum(G3G1_FZ_G2G2(:,:,i),2);

matrixG3G1(:,5,i)= sum(G3G1_FZ_G3G1(:,:,i),2);

matrixG3G1(:,6,i)= sum(G3G1_FZ_G3G2(:,:,i),2);

FZ_matrix5(:,:,i)=CMt_(matrixG3G1(:,:,i));

end
FZ_matrix5=(sum(FZ_matrix5,3))./i;
[max_5, c] = ID_(FZ_matrix5);
if c~=5
con_matFZ(:,5) = 0;
end
con_matFZ(5,c) = max_5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIXTH ROW of FZ CONFUSION MATRIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:size(ind_G3G2_FZ_second,3) 
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

FZ_matrix6(:,:,i)=CMt_(matrixG3G2(:,:,i));

end
FZ_matrix6=(sum(FZ_matrix6,3))./i;
[max_6, c] = ID_(FZ_matrix6);
if c~=6
con_matFZ(:,6) = 0;
end
con_matFZ(6,c) = max_6;
con_mat(:,:,8)=con_matFZ;

for i=1:6
grasp(i)=optimize(con_mat,i);
end







