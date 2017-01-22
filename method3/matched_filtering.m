function [ vector,store ] = matched_filtering( erd, data )
n = 1:50;
erd=erd';
u = erd.'*erd;
b = flipud(erd(:));

store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.6*u);
    store(f,n(matches))=1;
end
% vector{1}=store;
vector{1}=[];
for i=1:30
    vector{1}=[vector{1},store(i,1:28)];
end

store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.65*u);
    store(f,n(matches))=1;
end
% vector{2}=store;
vector{2}=[];
for i=1:30
    vector{2}=[vector{2},store(i,1:28)];
end


store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.7*u);
    store(f,n(matches))=1;
end
% vector{3}=store;
vector{3}=[];
for i=1:30
    vector{3}=[vector{3},store(i,1:28)];
end

store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.75*u);
    store(f,n(matches))=1;
end
% vector{4}=store;
vector{4}=[];
for i=1:30
    vector{4}=[vector{4},store(i,1:28)];
end



store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.8*u);
    store(f,n(matches))=1;
end
% vector{5}=store;
vector{5}=[];
for i=1:30
    vector{5}=[vector{5},store(i,1:28)];
end


store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.85*u);
    store(f,n(matches))=1;
end
% vector{6}=store;
vector{6}=[];
for i=1:30
    vector{6}=[vector{6},store(i,1:28)];
end


store=zeros(30,28);
for f=1:30
    y(f,:) = filter(b,1,data(f,:));
    % Find matches
    matches = n(y(f,:)>0.9*u);
    store(f,n(matches))=1;
end
% vector{7}=store;
vector{7}=[];
for i=1:30
    vector{7}=[vector{7},store(i,1:28)];
end
end


