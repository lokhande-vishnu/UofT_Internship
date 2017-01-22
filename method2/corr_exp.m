function [store_pre] = corr_time(erd, data)

for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        if(r_ERD(n,k-4)>=0 && p_ERD(n,k-4)<=0.05)
            store(k-4,n)=1;
        else
            store(k-4,n)=0;
        end        
    end
end
store_pre=store(1:20,:);
% store_pre=data(:,1:30)';

% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{2}=store(1,1:20);
%     else
%         vector{2}=[vector{2},store(n,1:20) ];
%     end
% end
% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.70 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{3}=store(1,1:20);
%     else
%         vector{3}=[vector{3},store(n,1:20) ];
%     end
% end
% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.75 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{4}=store(1,1:20);
%     else
%         vector{4}=[vector{4},store(n,1:20) ];
%     end
% end
% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.80 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{5}=store(1,1:20);
%     else
%         vector{5}=[vector{5},store(n,1:20) ];
%     end
% end
% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.85 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{6}=store(1,1:20);
%     else
%         vector{6}=[vector{6},store(n,1:20) ];
%     end
% end
% 
% for n=1:50
%     for k=5:30
%         [R P]=corrcoef(erd,data(n,k:k+20));
%         r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
%         
%         if(r_ERD(n,k-4)>=0.90 && p_ERD(n,k-4)<=0.05)
%             store(n,k-4)=1;
%         else
%             store(n,k-4)=0;
%         end
%         
%     end
%     if n==1
%         vector{7}=store(1,1:20);
%     else
%         vector{7}=[vector{7},store(n,1:20) ];
%     end
% end
% end