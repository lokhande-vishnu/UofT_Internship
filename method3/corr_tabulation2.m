function [vector,store] = corr_tabulation2(erd, data)

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{1}=store(:,1:20);
vector{1}=[];
for i=1:50
    vector{1}=[vector{1},store(i,1:20)];
end

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{2}=store(:,1:20);
vector{2}=[];
for i=1:50
    vector{2}=[vector{2},store(i,1:20)];
end


for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.7 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{3}=store(:,1:20);
vector{3}=[];
for i=1:50
    vector{3}=[vector{3},store(i,1:20)];
end

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.75 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{4}=store(:,1:20);
vector{4}=[];
for i=1:50
    vector{4}=[vector{4},store(i,1:20)];
end

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.8 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{5}=store(:,1:20);
vector{5}=[];
for i=1:50
    vector{5}=[vector{5},store(i,1:20)];
end

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.85 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{6}=store(:,1:20);
vector{6}=[];
for i=1:50
    vector{6}=[vector{6},store(i,1:20)];
end

for k=5:24
   for n=1:50 
        [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.9 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
   end    
end
% vector{7}=store(:,1:20);
vector{7}=[];
for i=1:50
    vector{7}=[vector{7},store(i,1:20)];
end
end



