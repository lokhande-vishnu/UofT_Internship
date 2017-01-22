function [vector,store1] = corr_faster(erd, data)

for k=5:30
    for n=1:50
        [R P]=corrcoef(erd,data(n,k:k+20));
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        
        
        % threshold 1
        if(r_ERD(n,k-4)>=0.6 && p_ERD(n,k-4)<=0.05)
            store1(n,k-4)=1;           
        else
            store1(n,k-4)=0;
        end
        
        % threshold 2
        if(r_ERD(n,k-4)>=0.65 && p_ERD(n,k-4)<=0.05)
            store2(n,k-4)=1;            
        else
            store2(n,k-4)=0;
        end
        
        % threshold 3
        if(r_ERD(n,k-4)>=0.70 && p_ERD(n,k-4)<=0.05 )
            store3(n,k-4)=1;            
        else
            store3(n,k-4)=0;
        end
        
        % threshold 4
        if(r_ERD(n,k-4)>=0.75 && p_ERD(n,k-4)<=0.05 )
            store4(n,k-4)=1;            
        else
            store4(n,k-4)=0;
        end
        
        % threshold 5
        if(r_ERD(n,k-4)>=0.80 && p_ERD(n,k-4)<=0.05 )
            store5(n,k-4)=1;            
        else
            store5(n,k-4)=0;
        end
        
        % threshold 6
        if(r_ERD(n,k-4)>=0.85 && p_ERD(n,k-4)<=0.05 )
            store6(n,k-4)=1;            
        else
            store6(n,k-4)=0;
        end
        
        % threshold 7
        if(r_ERD(n,k-4)>=0.90 && p_ERD(n,k-4)<=0.05 )
            store7(n,k-4)=1;            
        else
            store7(n,k-4)=0;
        end    
        
    end
    if sum(store1(:,k-4))~=0
        store1(:,k-4)= store1(:,k-4)/sum(store1(:,k-4));
    end
    if sum(store2(:,k-4))~=0
        store2(:,k-4)= store2(:,k-4)/sum(store2(:,k-4));
    end
    if sum(store3(:,k-4))~=0
        store3(:,k-4)= store3(:,k-4)/sum(store3(:,k-4));
    end
    if sum(store4(:,k-4))~=0
        store4(:,k-4)= store4(:,k-4)/sum(store4(:,k-4));
    end
    if sum(store5(:,k-4))~=0
        store5(:,k-4)= store5(:,k-4)/sum(store5(:,k-4));
    end
    if sum(store6(:,k-4))~=0
        store6(:,k-4)= store6(:,k-4)/sum(store6(:,k-4));
    end
    if sum(store7(:,k-4))~=0
        store7(:,k-4)= store7(:,k-4)/sum(store7(:,k-4));
    end
    
end
vector{1}=[];vector{2}=[];vector{3}=[];vector{4}=[];vector{5}=[];vector{6}=[];vector{7}=[];
for j=1:50
    vector{1}=[vector{1},store1(j,1:20) ];
    vector{2}=[vector{2},store2(j,1:20) ];
    vector{3}=[vector{3},store3(j,1:20) ];
    vector{4}=[vector{4},store4(j,1:20) ];
    vector{5}=[vector{5},store5(j,1:20) ];
    vector{6}=[vector{6},store6(j,1:20) ];
    vector{7}=[vector{7},store7(j,1:20) ];
end

end