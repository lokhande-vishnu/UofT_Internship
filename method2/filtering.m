function [train_filtered,ilogic]= filtering(pretraining)
p=0;q=0;
train_filtered=pretraining;
% Only valid for specific vlaues of indices
for k=1:6*8
    
    base=zeros(7,1000);logic=[];
    for j=1:size(pretraining,1)/(6*8)
        val=(size(pretraining,1)/(6*8))*(k-1)+j;
        base=base+pretraining{val,1}(:,4:1003);
        p=p+1;
    end
    
    baseT=max(base,[],2);
    for i=1:7
        logic(i,:)=base(i,:)>baseT(i,1);
    end
    logic=[ones(7,3),logic];
    
    for j=1:size(pretraining,1)/(6*8)
        val=(size(pretraining,1)/(6*8))*(k-1)+j;
        train_filtered{val,1}(~logic)=0;
        q=q+1;
    end
    a=floor((k-1)/8)+1; b=mod(k,8);
    if b==0
        b=8;
    end
    ilogic{a,b}=~logic;   
    
    
end

