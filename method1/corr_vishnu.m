function [vector,store] = corr_vishnu(erd, data)

for k=5:30
    for n=1:50
        [R,P]=corrcoef(erd,data(n,k:k+20));  
        r_ERD(n,k-4)=R(2,1); p_ERD(n,k-4)=P(2,1);
        if(r_ERD(n,k-4)>=0 && p_ERD(n,k-4)<=0.05)
            store(n,k-4)=1;
        else
            store(n,k-4)=0;
        end
        
    end
end

% approach5 The one using the features of the peaks
% p=1;
% for i=1:50
%     % disp(i)
%     [psor,lsor] = findpeaks(store(i,1:20),'SortStr','descend');
%     if isempty(psor)
%         a=store(i,1);b=store(i,20);
%         if a>=b
%             psor=a;lsor=1;
%         else
%             psor=b;lsor=20;
%         end
%     end
%     
%     vector(p)=psor(1);vector(p+1)=lsor(1);
%     p=p+2;
% end

%Approach3
vector=cell(7,1);
vector{1}=[mean(mean(store(8:10,1:3),1)),std(mean(store(8:10,1:3),1)),...
            mean(mean(store(11:13,1:3),1)),std(mean(store(11:13,1:3),1)),...
            mean(mean(store(14:18,1:3),1)),std(mean(store(14:18,1:3),1)),...
            mean(mean(store(19:23,1:3),1)),std(mean(store(19:23,1:3),1)),...
            mean(mean(store(24:28,1:3),1)),std(mean(store(24:28,1:3),1)),...
            ];

vector{2}=[mean(mean(store(8:10,4:6),1)),std(mean(store(8:10,4:6),1)),...
            mean(mean(store(11:13,4:6),1)),std(mean(store(11:13,4:6),1)),...
            mean(mean(store(14:18,4:6),1)),std(mean(store(14:18,4:6),1)),...
            mean(mean(store(19:23,4:6),1)),std(mean(store(19:23,4:6),1)),...
            mean(mean(store(24:28,4:6),1)),std(mean(store(24:28,4:6),1)),...
            ];


vector{3}=[mean(mean(store(8:10,7:9),1)),std(mean(store(8:10,7:9),1)),...
            mean(mean(store(11:13,7:9),1)),std(mean(store(11:13,7:9),1)),...
            mean(mean(store(14:18,7:9),1)),std(mean(store(14:18,7:9),1)),...
            mean(mean(store(19:23,7:9),1)),std(mean(store(19:23,7:9),1)),...
            mean(mean(store(24:28,7:9),1)),std(mean(store(24:28,7:9),1)),...
            ];


vector{4}=[mean(mean(store(8:10,10:12),1)),std(mean(store(8:10,10:12),1)),...
            mean(mean(store(11:13,10:12),1)),std(mean(store(11:13,10:12),1)),...
            mean(mean(store(14:18,10:12),1)),std(mean(store(14:18,10:12),1)),...
            mean(mean(store(19:23,10:12),1)),std(mean(store(19:23,10:12),1)),...
            mean(mean(store(24:28,10:12),1)),std(mean(store(24:28,10:12),1)),...
            ];

vector{5}=[mean(mean(store(8:10,13:15),1)),std(mean(store(8:10,13:15),1)),...
            mean(mean(store(11:13,13:15),1)),std(mean(store(11:13,13:15),1)),...
            mean(mean(store(14:18,13:15),1)),std(mean(store(14:18,13:15),1)),...
            mean(mean(store(19:23,13:15),1)),std(mean(store(19:23,13:15),1)),...
            mean(mean(store(24:28,13:15),1)),std(mean(store(24:28,13:15),1)),...
            ];

vector{6}=[mean(mean(store(8:10,16:18),1)),std(mean(store(8:10,16:18),1)),...
            mean(mean(store(11:13,16:18),1)),std(mean(store(11:13,16:18),1)),...
            mean(mean(store(14:18,16:18),1)),std(mean(store(14:18,16:18),1)),...
            mean(mean(store(19:23,16:18),1)),std(mean(store(19:23,16:18),1)),...
            mean(mean(store(24:28,16:18),1)),std(mean(store(24:28,16:18),1)),...
            ];
vector{7}=[mean(mean(store(8:10,19:20),1)),std(mean(store(8:10,19:20),1)),...
            mean(mean(store(11:13,19:20),1)),std(mean(store(11:13,19:20),1)),...
            mean(mean(store(14:18,19:20),1)),std(mean(store(14:18,19:20),1)),...
            mean(mean(store(19:23,19:20),1)),std(mean(store(19:23,19:20),1)),...
            mean(mean(store(24:28,19:20),1)),std(mean(store(24:28,19:20),1)),...
            ];

        

% Approach2
% alpha=mean(store(8:12,:),1); beta=sum(store(13:30,:),1);
%  tot=[alpha;beta];
% vector{1}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,4:6),1); beta=sum(store(13:30,4:6),1);
% vector{2}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,7:9),1); beta=sum(store(13:30,7:9),1);
% vector{3}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,10:12),1); beta=sum(store(13:30,10:12),1);
% vector{4}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,13:15),1); beta=sum(store(13:30,13:15),1);
% vector{5}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,16:18),1); beta=sum(store(13:30,16:18),1);
% vector{6}=[sum(alpha==0),sum(beta==0)];
% alpha=sum(store(8:12,19:20),1); beta=sum(store(13:30,19:20),1);
% vector{7}=[sum(alpha==0),sum(beta==0)];

% did not try because of NaN
% alpha=sum(store(8:12,1:3),1); beta=sum(store(13:30,1:3),1);
% vector{1}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,4:6),1); beta=sum(store(13:30,4:6),1);
% vector{2}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,7:9),1); beta=sum(store(13:30,7:9),1);
% vector{3}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,10:12),1); beta=sum(store(13:30,10:12),1);
% vector{4}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,13:15),1); beta=sum(store(13:30,13:15),1);
% vector{5}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,16:18),1); beta=sum(store(13:30,16:18),1);
% vector{6}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];
% alpha=sum(store(8:12,19:20),1); beta=sum(store(13:30,19:20),1);
% vector{7}=[sum(alpha==0),mean(alpha(alpha~=0)),sum(beta==0),mean(beta(beta~=0))];


% approach1
% vector{1}= [sum(store(8:12,1:3),1),sum(store(13:30,1:3),1)];
% vector{2}= [sum(store(8:12,4:6),1),sum(store(13:30,4:6),1)];
% vector{3}= [sum(store(8:12,7:9),1),sum(store(13:30,7:9),1)];
% vector{4}= [sum(store(8:12,10:12),1),sum(store(13:30,10:12),1)];
% vector{5}= [sum(store(8:12,13:15),1),sum(store(13:30,13:15),1)];
% vector{6}= [sum(store(8:12,16:18),1),sum(store(13:30,16:18),1)];
% vector{7}= [sum(store(8:12,19:20),1),sum(store(13:30,19:20),1)];

% approach0
% alpha= sum(store(8:12,1:20),1);
% beta= sum(store(13:30,1:20),1);
% theta= sum(store(4:7,:),1);
% delta= sum(store(1:3,:),1);
% gamma= sum(store(31:50,:),1);

%for practice
% vector=[alpha,beta];
% vector(1)=alpha;
% vector(2)=beta;
% vector(3)=sum(theta);
% vector(4)=sum(delta);
% vector(5)=sum(gamma);
%Vertical features
% vector(6)=sum(sum(store(:,1:5),2));
% vector(7)=sum(sum(store(:,6:10),2));
% vector(8)=sum(sum(store(:,11:15),2));
% vector(9)=sum(sum(store(:,16:20),2));
% vector(10)=sum(sum(store(:,21:26),2));

end
