function [vector,store] = corr_tabulation(erd, data)

% vector{1}=[];
% for j=1:50
%     vector{1}=[vector{1},data(j,:)];
% end
%  store=1;
%  
 
 
% 
for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.6 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
    end
    
    %         if n==1
    %             vector{1}=store(n,1:20); %data(n,1:30);
    %         else
    %     %         vector{1}=[vector{1},data(n,1:30) ];
    %                     vector{1}=[vector{1},store(n,1:20) ];
    %         end
end
vector{1}=[];
for j=1:50
    vector{1}=[vector{1},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
    end
    
    
    %         if n==1
    %             vector{2}=store(1,1:20);
    %         else
    %             vector{2}=[vector{2},store(n,1:20) ];
    %         end
end
vector{2}=[];
for j=1:50
    vector{2}=[vector{2},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.70 && p_ERD(n,k-4)<=0.05 )
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
        
        
    end
    %         if n==1
    %             vector{3}=store(1,1:20);
    %         else
    %             vector{3}=[vector{3},store(n,1:20) ];
    %         end
end
vector{3}=[];
for j=1:50
    vector{3}=[vector{3},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.75 && p_ERD(n,k-4)<=0.05 )
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
        
        
    end
    %         if n==1
    %             vector{4}=store(1,1:20);
    %         else
    %             vector{4}=[vector{4},store(n,1:20) ];
    %         end
end
vector{4}=[];
for j=1:50
    vector{4}=[vector{4},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.80 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
        
        
    end
    %         if n==1
    %             vector{5}=store(1,1:20);
    %         else
    %             vector{5}=[vector{5},store(n,1:20) ];
    %         end
end
vector{5}=[];
for j=1:50
    vector{5}=[vector{5},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.85 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
        
        
    end
    %         if n==1
    %             vector{6}=store(1,1:20);
    %         else
    %             vector{6}=[vector{6},store(n,1:20) ];
    %         end
end
vector{6}=[];
for j=1:50
    vector{6}=[vector{6},store(j,1:20) ];
end



for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0.90 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
            
        else
            store(n,k-4)=0;
        end
    end
    if sum(store(:,k-4))~=0
        store(:,k-4)= store(:,k-4)/sum(store(:,k-4));
        
        
        
    end
    %         if n==1
    %             vector{7}=store(1,1:20);
    %         else
    %             vector{7}=[vector{7},store(n,1:20) ];
    %         end
end
vector{7}=[];
for j=1:50
    vector{7}=[vector{7},store(j,1:20) ];
end



% % Modified ERD signal
% % for n=1:50
% %     for k=5:24
% %         [R P]=corrcoef(erd(1,7:11),data(n,k:k+4));
% %         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
% %         
% %         if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
% %             store(n,k-4)=r_ERD(n,k-4);
% %             
% %         else
% %             store(n,k-4)=r_ERD(n,k-4);
% %         end
% %     end
% %     
% % end
% % 
% % vector{1}=[];
% % for j=1:50
% %     vector{1}=[vector{1},store(j,:)];
% % end

end