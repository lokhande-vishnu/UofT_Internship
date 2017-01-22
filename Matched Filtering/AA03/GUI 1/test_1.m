% A template is given
close all; 
clear;
load('AA03_group1.mat');
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
%GB_=@graph_bar; 
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C1_first=zeros(30,28,size(EEG_C1_first_al,2));
for k=1:size(EEG_C1_first_al,2)
[C1_first,T] = SSN_(EEG_C1_first_al(1:4001,k));
for i=1:30
x(i,:)=C1_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_C1_first(i,n(matches),k)=1;
end
end
G1G1_C1_out=ind_G1G1_C1_first;   
for j=1:size(G1G1_C1_out,3)
 G1G1_C1_out(:,:,j)=0;
 G1G1_C1_out_first(:,:,j)=sum(G1G1_C1_out,3)./(size(G1G1_C1_out,3)-1);
end
G1G1_C1_first=sum(ind_G1G1_C1_first,3)./size(ind_G1G1_C1_first,3);
%GB_(G1G1_C1_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C2_first=zeros(30,28,size(EEG_C2_first_al,2));
for k=1:size(EEG_C2_first_al,2)
[C2_first,T] = SSN_(EEG_C2_first_al(1:4001,k));
for i=1:30
x(i,:)=C2_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_C2_first(i,n(matches),k)=1;
end
end
G1G1_C2_out=ind_G1G1_C2_first;   
for j=1:size(G1G1_C2_out,3)
 G1G1_C2_out(:,:,j)=0;
 G1G1_C2_out_first(:,:,j)=sum(G1G1_C2_out,3)./(size(G1G1_C2_out,3)-1);
end
G1G1_C2_first=sum(ind_G1G1_C2_first,3)./size(ind_G1G1_C2_first,3);
%GB_(G1G1_C2_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C3_first=zeros(30,28,size(EEG_C3_first_al,2));
for k=1:size(EEG_C3_first_al,2)
[C3_first,T] = SSN_(EEG_C3_first_al(1:4001,k));
for i=1:30
x(i,:)=C3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_C3_first(i,n(matches),k)=1;
end
end
G1G1_C3_out=ind_G1G1_C3_first;   
for j=1:size(G1G1_C3_out,3)
 G1G1_C3_out(:,:,j)=0;
 G1G1_C3_out_first(:,:,j)=sum(G1G1_C3_out,3)./(size(G1G1_C3_out,3)-1);
end
G1G1_C3_first=sum(ind_G1G1_C3_first,3)./size(ind_G1G1_C3_first,3);
%GB_(G1G1_C3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_C4_first=zeros(30,28,size(EEG_C4_first_al,2));
for k=1:size(EEG_C4_first_al,2)
[C4_first,T] = SSN_(EEG_C4_first_al(1:4001,k));
for i=1:30
x(i,:)=C4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_C4_first(i,n(matches),k)=1;
end
end
G1G1_C4_out=ind_G1G1_C4_first;   
for j=1:size(G1G1_C4_out,3)
 G1G1_C4_out(:,:,j)=0;
 G1G1_C4_out_first(:,:,j)=sum(G1G1_C4_out,3)./(size(G1G1_C4_out,3)-1);
end
G1G1_C4_first=sum(ind_G1G1_C4_first,3)./size(ind_G1G1_C4_first,3);
%GB_(G1G1_C4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_CZ_first=zeros(30,28,size(EEG_CZ_first_al,2));
for k=1:size(EEG_CZ_first_al,2)
[CZ_first,T] = SSN_(EEG_CZ_first_al(1:4001,k));
for i=1:30
x(i,:)=CZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_CZ_first(i,n(matches),k)=1;
end
end
G1G1_CZ_out=ind_G1G1_CZ_first;   
for j=1:size(G1G1_CZ_out,3)
 G1G1_CZ_out(:,:,j)=0;
 G1G1_CZ_out_first(:,:,j)=sum(G1G1_CZ_out,3)./(size(G1G1_CZ_out,3)-1);
end
G1G1_CZ_first=sum(ind_G1G1_CZ_first,3)./size(ind_G1G1_CZ_first,3);
%GB_(G1G1_CZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_F3_first=zeros(30,28,size(EEG_F3_first_al,2));
for k=1:size(EEG_F3_first_al,2)
[F3_first,T] = SSN_(EEG_F3_first_al(1:4001,k));
for i=1:30
x(i,:)=F3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_F3_first(i,n(matches),k)=1;
end
end
G1G1_F3_out=ind_G1G1_F3_first;   
for j=1:size(G1G1_F3_out,3)
 G1G1_F3_out(:,:,j)=0;
 G1G1_F3_out_first(:,:,j)=sum(G1G1_F3_out,3)./(size(G1G1_F3_out,3)-1);
end
G1G1_F3_first=sum(ind_G1G1_F3_first,3)./size(ind_G1G1_F3_first,3);
%GB_(G1G1_F3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_F4_first=zeros(30,28,size(EEG_F4_first_al,2));
for k=1:size(EEG_F4_first_al,2)
[F4_first,T] = SSN_(EEG_F4_first_al(1:4001,k));
for i=1:30
x(i,:)=F4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_F4_first(i,n(matches),k)=1;
end
end
G1G1_F4_out=ind_G1G1_F4_first;   
for j=1:size(G1G1_F4_out,3)
 G1G1_F4_out(:,:,j)=0;
 G1G1_F4_out_first(:,:,j)=sum(G1G1_F4_out,3)./(size(G1G1_F4_out,3)-1);
end
G1G1_F4_first=sum(ind_G1G1_F4_first,3)./size(ind_G1G1_F4_first,3);
%GB_(G1G1_F4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G1_FZ_first=zeros(30,28,size(EEG_FZ_first_al,2));
for k=1:size(EEG_FZ_first_al,2)
[FZ_first,T] = SSN_(EEG_FZ_first_al(1:4001,k));
for i=1:30
x(i,:)=FZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G1_FZ_first(i,n(matches),k)=1;
end
end
G1G1_FZ_out=ind_G1G1_FZ_first;   
for j=1:size(G1G1_FZ_out,3)
 G1G1_FZ_out(:,:,j)=0;
 G1G1_FZ_out_first(:,:,j)=sum(G1G1_FZ_out,3)./(size(G1G1_FZ_out,3)-1);
end
G1G1_FZ_first=sum(ind_G1G1_FZ_first,3)./size(ind_G1G1_FZ_first,3);
%GB_(G1G1_FZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP 1 GRASP 2: NF1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_C1_second=zeros(30,28,size(EEG_C1_second_al,2));
for k=1:size(EEG_C1_second_al,2)
[C1_second,T] = SSN_(EEG_C1_second_al(1:4001,k));
for i=1:30
x(i,:)=C1_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_C1_second(i,n(matches),k)=1;
end
end
G1G2_C1_out=ind_G1G2_C1_second;   
for j=1:size(G1G2_C1_out,3)
 G1G2_C1_out(:,:,j)=0;
 G1G2_C1_out_second(:,:,j)=sum(G1G2_C1_out,3)./(size(G1G2_C1_out,3)-1);
end
G1G2_C1_second=sum(ind_G1G2_C1_second,3)./size(ind_G1G2_C1_second,3);
%GB_(G1G2_C1_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_C2_second=zeros(30,28,size(EEG_C2_second_al,2));
for k=1:size(EEG_C2_second_al,2)
[C2_second,T] = SSN_(EEG_C2_second_al(1:4001,k));
for i=1:30
x(i,:)=C2_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_C2_second(i,n(matches),k)=1;
end
end
G1G2_C2_out=ind_G1G2_C2_second;   
for j=1:size(G1G2_C2_out,3)
 G1G2_C2_out(:,:,j)=0;
 G1G2_C2_out_second(:,:,j)=sum(G1G2_C2_out,3)./(size(G1G2_C2_out,3)-1);
end
G1G2_C2_second=sum(ind_G1G2_C2_second,3)./size(ind_G1G2_C2_second,3);
%GB_(G1G2_C2_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_C3_second=zeros(30,28,size(EEG_C3_second_al,2));
for k=1:size(EEG_C3_second_al,2)
[C3_second,T] = SSN_(EEG_C3_second_al(1:4001,k));
for i=1:30
x(i,:)=C3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_C3_second(i,n(matches),k)=1;
end
end
G1G2_C3_out=ind_G1G2_C3_second;   
for j=1:size(G1G2_C3_out,3)
 G1G2_C3_out(:,:,j)=0;
 G1G2_C3_out_second(:,:,j)=sum(G1G2_C3_out,3)./(size(G1G2_C3_out,3)-1);
end
G1G2_C3_second=sum(ind_G1G2_C3_second,3)./size(ind_G1G2_C3_second,3);
%GB_(G1G2_C3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_C4_second=zeros(30,28,size(EEG_C4_second_al,2));
for k=1:size(EEG_C4_second_al,2)
[C4_second,T] = SSN_(EEG_C4_second_al(1:4001,k));
for i=1:30
x(i,:)=C4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_C4_second(i,n(matches),k)=1;
end
end
G1G2_C4_out=ind_G1G2_C4_second;   
for j=1:size(G1G2_C4_out,3)
 G1G2_C4_out(:,:,j)=0;
 G1G2_C4_out_second(:,:,j)=sum(G1G2_C4_out,3)./(size(G1G2_C4_out,3)-1);
end
G1G2_C4_second=sum(ind_G1G2_C4_second,3)./size(ind_G1G2_C4_second,3);
%GB_(G1G2_C4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_CZ_second=zeros(30,28,size(EEG_CZ_second_al,2));
for k=1:size(EEG_CZ_second_al,2)
[CZ_second,T] = SSN_(EEG_CZ_second_al(1:4001,k));
for i=1:30
x(i,:)=CZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_CZ_second(i,n(matches),k)=1;
end
end
G1G2_CZ_out=ind_G1G2_CZ_second;   
for j=1:size(G1G2_CZ_out,3)
 G1G2_CZ_out(:,:,j)=0;
 G1G2_CZ_out_second(:,:,j)=sum(G1G2_CZ_out,3)./(size(G1G2_CZ_out,3)-1);
end
G1G2_CZ_second=sum(ind_G1G2_CZ_second,3)./size(ind_G1G2_CZ_second,3);
%GB_(G1G2_CZ_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_F3_second=zeros(30,28,size(EEG_F3_second_al,2));
for k=1:size(EEG_F3_second_al,2)
[F3_second,T] = SSN_(EEG_F3_second_al(1:4001,k));
for i=1:30
x(i,:)=F3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_F3_second(i,n(matches),k)=1;
end
end
G1G2_F3_out=ind_G1G2_F3_second;   
for j=1:size(G1G2_F3_out,3)
 G1G2_F3_out(:,:,j)=0;
 G1G2_F3_out_second(:,:,j)=sum(G1G2_F3_out,3)./(size(G1G2_F3_out,3)-1);
end
G1G2_F3_second=sum(ind_G1G2_F3_second,3)./size(ind_G1G2_F3_second,3);
%GB_(G1G2_F3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_F4_second=zeros(30,28,size(EEG_F4_second_al,2));
for k=1:size(EEG_F4_second_al,2)
[F4_second,T] = SSN_(EEG_F4_second_al(1:4001,k));
for i=1:30
x(i,:)=F4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_F4_second(i,n(matches),k)=1;
end
end
G1G2_F4_out=ind_G1G2_F4_second;   
for j=1:size(G1G2_F4_out,3)
 G1G2_F4_out(:,:,j)=0;
 G1G2_F4_out_second(:,:,j)=sum(G1G2_F4_out,3)./(size(G1G2_F4_out,3)-1);
end
G1G2_F4_second=sum(ind_G1G2_F4_second,3)./size(ind_G1G2_F4_second,3);
%GB_(G1G2_F4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G1G2_FZ_second=zeros(30,28,size(EEG_FZ_second_al,2));
for k=1:size(EEG_FZ_second_al,2)
[FZ_second,T] = SSN_(EEG_FZ_second_al(1:4001,k));
for i=1:30
x(i,:)=FZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G1G2_FZ_second(i,n(matches),k)=1;
end
end
G1G2_FZ_out=ind_G1G2_FZ_second;   
for j=1:size(G1G2_FZ_out,3)
 G1G2_FZ_out(:,:,j)=0;
 G1G2_FZ_out_second(:,:,j)=sum(G1G2_FZ_out,3)./(size(G1G2_FZ_out,3)-1);
end
G1G2_FZ_second=sum(ind_G1G2_FZ_second,3)./size(ind_G1G2_FZ_second,3);
%GB_(G1G2_FZ_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP 2 GRASP 1: LATERAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_C1_first=zeros(30,28,size(EEG_C1_first_al,2));
for k=1:size(EEG_C1_first_al,2)
[C1_first,T] = SSN_(EEG_C1_first_al(1:4001,k));
for i=1:30
x(i,:)=C1_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_C1_first(i,n(matches),k)=1;
end
end
G2G1_C1_out=ind_G2G1_C1_first;   
for j=1:size(G2G1_C1_out,3)
 G2G1_C1_out(:,:,j)=0;
 G2G1_C1_out_first(:,:,j)=sum(G2G1_C1_out,3)./(size(G2G1_C1_out,3)-1);
end
G2G1_C1_first=sum(ind_G2G1_C1_first,3)./size(ind_G2G1_C1_first,3);
%GB_(G2G1_C1_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_C2_first=zeros(30,28,size(EEG_C2_first_al,2));
for k=1:size(EEG_C2_first_al,2)
[C2_first,T] = SSN_(EEG_C2_first_al(1:4001,k));
for i=1:30
x(i,:)=C2_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_C2_first(i,n(matches),k)=1;
end
end
G2G1_C2_out=ind_G2G1_C2_first;   
for j=1:size(G2G1_C2_out,3)
 G2G1_C2_out(:,:,j)=0;
 G2G1_C2_out_first(:,:,j)=sum(G2G1_C2_out,3)./(size(G2G1_C2_out,3)-1);
end
G2G1_C2_first=sum(ind_G2G1_C2_first,3)./size(ind_G2G1_C2_first,3);
%GB_(G2G1_C2_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_C3_first=zeros(30,28,size(EEG_C3_first_al,2));
for k=1:size(EEG_C3_first_al,2)
[C3_first,T] = SSN_(EEG_C3_first_al(1:4001,k));
for i=1:30
x(i,:)=C3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_C3_first(i,n(matches),k)=1;
end
end
G2G1_C3_out=ind_G2G1_C3_first;   
for j=1:size(G2G1_C3_out,3)
 G2G1_C3_out(:,:,j)=0;
 G2G1_C3_out_first(:,:,j)=sum(G2G1_C3_out,3)./(size(G2G1_C3_out,3)-1);
end
G2G1_C3_first=sum(ind_G2G1_C3_first,3)./size(ind_G2G1_C3_first,3);
%GB_(G2G1_C3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_C4_first=zeros(30,28,size(EEG_C4_first_al,2));
for k=1:size(EEG_C4_first_al,2)
[C4_first,T] = SSN_(EEG_C4_first_al(1:4001,k));
for i=1:30
x(i,:)=C4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_C4_first(i,n(matches),k)=1;
end
end
G2G1_C4_out=ind_G2G1_C4_first;   
for j=1:size(G2G1_C4_out,3)
 G2G1_C4_out(:,:,j)=0;
 G2G1_C4_out_first(:,:,j)=sum(G2G1_C4_out,3)./(size(G2G1_C4_out,3)-1);
end
G2G1_C4_first=sum(ind_G2G1_C4_first,3)./size(ind_G2G1_C4_first,3);
%GB_(G2G1_C4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_CZ_first=zeros(30,28,size(EEG_CZ_first_al,2));
for k=1:size(EEG_CZ_first_al,2)
[CZ_first,T] = SSN_(EEG_CZ_first_al(1:4001,k));
for i=1:30
x(i,:)=CZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_CZ_first(i,n(matches),k)=1;
end
end
G2G1_CZ_out=ind_G2G1_CZ_first;   
for j=1:size(G2G1_CZ_out,3)
 G2G1_CZ_out(:,:,j)=0;
 G2G1_CZ_out_first(:,:,j)=sum(G2G1_CZ_out,3)./(size(G2G1_CZ_out,3)-1);
end
G2G1_CZ_first=sum(ind_G2G1_CZ_first,3)./size(ind_G2G1_CZ_first,3);
%GB_(G2G1_CZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_F3_first=zeros(30,28,size(EEG_F3_first_al,2));
for k=1:size(EEG_F3_first_al,2)
[F3_first,T] = SSN_(EEG_F3_first_al(1:4001,k));
for i=1:30
x(i,:)=F3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_F3_first(i,n(matches),k)=1;
end
end
G2G1_F3_out=ind_G2G1_F3_first;   
for j=1:size(G2G1_F3_out,3)
 G2G1_F3_out(:,:,j)=0;
 G2G1_F3_out_first(:,:,j)=sum(G2G1_F3_out,3)./(size(G2G1_F3_out,3)-1);
end
G2G1_F3_first=sum(ind_G2G1_F3_first,3)./size(ind_G2G1_F3_first,3);
%GB_(G2G1_F3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_F4_first=zeros(30,28,size(EEG_F4_first_al,2));
for k=1:size(EEG_F4_first_al,2)
[F4_first,T] = SSN_(EEG_F4_first_al(1:4001,k));
for i=1:30
x(i,:)=F4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_F4_first(i,n(matches),k)=1;
end
end
G2G1_F4_out=ind_G2G1_F4_first;   
for j=1:size(G2G1_F4_out,3)
 G2G1_F4_out(:,:,j)=0;
 G2G1_F4_out_first(:,:,j)=sum(G2G1_F4_out,3)./(size(G2G1_F4_out,3)-1);
end
G2G1_F4_first=sum(ind_G2G1_F4_first,3)./size(ind_G2G1_F4_first,3);
%GB_(G2G1_F4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G1_FZ_first=zeros(30,28,size(EEG_FZ_first_al,2));
for k=1:size(EEG_FZ_first_al,2)
[FZ_first,T] = SSN_(EEG_FZ_first_al(1:4001,k));
for i=1:30
x(i,:)=FZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G1_FZ_first(i,n(matches),k)=1;
end
end
G2G1_FZ_out=ind_G2G1_FZ_first;   
for j=1:size(G2G1_FZ_out,3)
 G2G1_FZ_out(:,:,j)=0;
 G2G1_FZ_out_first(:,:,j)=sum(G2G1_FZ_out,3)./(size(G2G1_FZ_out,3)-1);
end
G2G1_FZ_first=sum(ind_G2G1_FZ_first,3)./size(ind_G2G1_FZ_first,3);
%GB_(G2G1_FZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP 2 GRASP 2: EXTENSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_C1_second=zeros(30,28,size(EEG_C1_second_al,2));
for k=1:size(EEG_C1_second_al,2)
[C1_second,T] = SSN_(EEG_C1_second_al(1:4001,k));
for i=1:30
x(i,:)=C1_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_C1_second(i,n(matches),k)=1;
end
end
G2G2_C1_out=ind_G2G2_C1_second;   
for j=1:size(G2G2_C1_out,3)
 G2G2_C1_out(:,:,j)=0;
 G2G2_C1_out_second(:,:,j)=sum(G2G2_C1_out,3)./(size(G2G2_C1_out,3)-1);
end
G2G2_C1_second=sum(ind_G2G2_C1_second,3)./size(ind_G2G2_C1_second,3);
%GB_(G2G2_C1_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_C2_second=zeros(30,28,size(EEG_C2_second_al,2));
for k=1:size(EEG_C2_second_al,2)
[C2_second,T] = SSN_(EEG_C2_second_al(1:4001,k));
for i=1:30
x(i,:)=C2_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_C2_second(i,n(matches),k)=1;
end
end
G2G2_C2_out=ind_G2G2_C2_second;   
for j=1:size(G2G2_C2_out,3)
 G2G2_C2_out(:,:,j)=0;
 G2G2_C2_out_second(:,:,j)=sum(G2G2_C2_out,3)./(size(G2G2_C2_out,3)-1);
end
G2G2_C2_second=sum(ind_G2G2_C2_second,3)./size(ind_G2G2_C2_second,3);
%GB_(G2G2_C2_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_C3_second=zeros(30,28,size(EEG_C3_second_al,2));
for k=1:size(EEG_C3_second_al,2)
[C3_second,T] = SSN_(EEG_C3_second_al(1:4001,k));
for i=1:30
x(i,:)=C3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_C3_second(i,n(matches),k)=1;
end
end
G2G2_C3_out=ind_G2G2_C3_second;   
for j=1:size(G2G2_C3_out,3)
 G2G2_C3_out(:,:,j)=0;
 G2G2_C3_out_second(:,:,j)=sum(G2G2_C3_out,3)./(size(G2G2_C3_out,3)-1);
end
G2G2_C3_second=sum(ind_G2G2_C3_second,3)./size(ind_G2G2_C3_second,3);
%GB_(G2G2_C3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_C4_second=zeros(30,28,size(EEG_C4_second_al,2));
for k=1:size(EEG_C4_second_al,2)
[C4_second,T] = SSN_(EEG_C4_second_al(1:4001,k));
for i=1:30
x(i,:)=C4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_C4_second(i,n(matches),k)=1;
end
end
G2G2_C4_out=ind_G2G2_C4_second;   
for j=1:size(G2G2_C4_out,3)
 G2G2_C4_out(:,:,j)=0;
 G2G2_C4_out_second(:,:,j)=sum(G2G2_C4_out,3)./(size(G2G2_C4_out,3)-1);
end
G2G2_C4_second=sum(ind_G2G2_C4_second,3)./size(ind_G2G2_C4_second,3);
%GB_(G2G2_C4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_CZ_second=zeros(30,28,size(EEG_CZ_second_al,2));
for k=1:size(EEG_CZ_second_al,2)
[CZ_second,T] = SSN_(EEG_CZ_second_al(1:4001,k));
for i=1:30
x(i,:)=CZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_CZ_second(i,n(matches),k)=1;
end
end
G2G2_CZ_out=ind_G2G2_CZ_second;   
for j=1:size(G2G2_CZ_out,3)
 G2G2_CZ_out(:,:,j)=0;
 G2G2_CZ_out_second(:,:,j)=sum(G2G2_CZ_out,3)./(size(G2G2_CZ_out,3)-1);
end
G2G2_CZ_second=sum(ind_G2G2_CZ_second,3)./size(ind_G2G2_CZ_second,3);
%GB_(G2G2_CZ_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_F3_second=zeros(30,28,size(EEG_F3_second_al,2));
for k=1:size(EEG_F3_second_al,2)
[F3_second,T] = SSN_(EEG_F3_second_al(1:4001,k));
for i=1:30
x(i,:)=F3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_F3_second(i,n(matches),k)=1;
end
end
G2G2_F3_out=ind_G2G2_F3_second;   
for j=1:size(G2G2_F3_out,3)
 G2G2_F3_out(:,:,j)=0;
 G2G2_F3_out_second(:,:,j)=sum(G2G2_F3_out,3)./(size(G2G2_F3_out,3)-1);
end
G2G2_F3_second=sum(ind_G2G2_F3_second,3)./size(ind_G2G2_F3_second,3);
%GB_(G2G2_F3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_F4_second=zeros(30,28,size(EEG_F4_second_al,2));
for k=1:size(EEG_F4_second_al,2)
[F4_second,T] = SSN_(EEG_F4_second_al(1:4001,k));
for i=1:30
x(i,:)=F4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_F4_second(i,n(matches),k)=1;
end
end
G2G2_F4_out=ind_G2G2_F4_second;   
for j=1:size(G2G2_F4_out,3)
 G2G2_F4_out(:,:,j)=0;
 G2G2_F4_out_second(:,:,j)=sum(G2G2_F4_out,3)./(size(G2G2_F4_out,3)-1);
end
G2G2_F4_second=sum(ind_G2G2_F4_second,3)./size(ind_G2G2_F4_second,3);
%GB_(G2G2_F4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G2G2_FZ_second=zeros(30,28,size(EEG_FZ_second_al,2));
for k=1:size(EEG_FZ_second_al,2)
[FZ_second,T] = SSN_(EEG_FZ_second_al(1:4001,k));
for i=1:30
x(i,:)=FZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G2G2_FZ_second(i,n(matches),k)=1;
end
end
G2G2_FZ_out=ind_G2G2_FZ_second;   
for j=1:size(G2G2_FZ_out,3)
 G2G2_FZ_out(:,:,j)=0;
 G2G2_FZ_out_second(:,:,j)=sum(G2G2_FZ_out,3)./(size(G2G2_FZ_out,3)-1);
end
G2G2_FZ_second=sum(ind_G2G2_FZ_second,3)./size(ind_G2G2_FZ_second,3);
%GB_(G2G2_FZ_second);axis([15.5 28.5 0.5 30.5 0 1])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP 3 GRASP 1: NF2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_C1_first=zeros(30,28,size(EEG_C1_first_al,2));
for k=1:size(EEG_C1_first_al,2)
[C1_first,T] = SSN_(EEG_C1_first_al(1:4001,k));
for i=1:30
x(i,:)=C1_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_C1_first(i,n(matches),k)=1;
end
end
G3G1_C1_out=ind_G3G1_C1_first;   
for j=1:size(G3G1_C1_out,3)
 G3G1_C1_out(:,:,j)=0;
 G3G1_C1_out_first(:,:,j)=sum(G3G1_C1_out,3)./(size(G3G1_C1_out,3)-1);
end
G3G1_C1_first=sum(ind_G3G1_C1_first,3)./size(ind_G3G1_C1_first,3);
%GB_(G3G1_C1_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_C2_first=zeros(30,28,size(EEG_C2_first_al,2));
for k=1:size(EEG_C2_first_al,2)
[C2_first,T] = SSN_(EEG_C2_first_al(1:4001,k));
for i=1:30
x(i,:)=C2_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_C2_first(i,n(matches),k)=1;
end
end
G3G1_C2_out=ind_G3G1_C2_first;   
for j=1:size(G3G1_C2_out,3)
 G3G1_C2_out(:,:,j)=0;
 G3G1_C2_out_first(:,:,j)=sum(G3G1_C2_out,3)./(size(G3G1_C2_out,3)-1);
end
G3G1_C2_first=sum(ind_G3G1_C2_first,3)./size(ind_G3G1_C2_first,3);
%GB_(G3G1_C2_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_C3_first=zeros(30,28,size(EEG_C3_first_al,2));
for k=1:size(EEG_C3_first_al,2)
[C3_first,T] = SSN_(EEG_C3_first_al(1:4001,k));
for i=1:30
x(i,:)=C3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_C3_first(i,n(matches),k)=1;
end
end
G3G1_C3_out=ind_G3G1_C3_first;   
for j=1:size(G3G1_C3_out,3)
 G3G1_C3_out(:,:,j)=0;
 G3G1_C3_out_first(:,:,j)=sum(G3G1_C3_out,3)./(size(G3G1_C3_out,3)-1);
end
G3G1_C3_first=sum(ind_G3G1_C3_first,3)./size(ind_G3G1_C3_first,3);
%GB_(G3G1_C3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_C4_first=zeros(30,28,size(EEG_C4_first_al,2));
for k=1:size(EEG_C4_first_al,2)
[C4_first,T] = SSN_(EEG_C4_first_al(1:4001,k));
for i=1:30
x(i,:)=C4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_C4_first(i,n(matches),k)=1;
end
end
G3G1_C4_out=ind_G3G1_C4_first;   
for j=1:size(G3G1_C4_out,3)
 G3G1_C4_out(:,:,j)=0;
 G3G1_C4_out_first(:,:,j)=sum(G3G1_C4_out,3)./(size(G3G1_C4_out,3)-1);
end
G3G1_C4_first=sum(ind_G3G1_C4_first,3)./size(ind_G3G1_C4_first,3);
%GB_(G3G1_C4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_CZ_first=zeros(30,28,size(EEG_CZ_first_al,2));
for k=1:size(EEG_CZ_first_al,2)
[CZ_first,T] = SSN_(EEG_CZ_first_al(1:4001,k));
for i=1:30
x(i,:)=CZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_CZ_first(i,n(matches),k)=1;
end
end
G3G1_CZ_out=ind_G3G1_CZ_first;   
for j=1:size(G3G1_CZ_out,3)
 G3G1_CZ_out(:,:,j)=0;
 G3G1_CZ_out_first(:,:,j)=sum(G3G1_CZ_out,3)./(size(G3G1_CZ_out,3)-1);
end
G3G1_CZ_first=sum(ind_G3G1_CZ_first,3)./size(ind_G3G1_CZ_first,3);
%GB_(G3G1_CZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_F3_first=zeros(30,28,size(EEG_F3_first_al,2));
for k=1:size(EEG_F3_first_al,2)
[F3_first,T] = SSN_(EEG_F3_first_al(1:4001,k));
for i=1:30
x(i,:)=F3_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_F3_first(i,n(matches),k)=1;
end
end
G3G1_F3_out=ind_G3G1_F3_first;   
for j=1:size(G3G1_F3_out,3)
 G3G1_F3_out(:,:,j)=0;
 G3G1_F3_out_first(:,:,j)=sum(G3G1_F3_out,3)./(size(G3G1_F3_out,3)-1);
end
G3G1_F3_first=sum(ind_G3G1_F3_first,3)./size(ind_G3G1_F3_first,3);
%GB_(G3G1_F3_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_F4_first=zeros(30,28,size(EEG_F4_first_al,2));
for k=1:size(EEG_F4_first_al,2)
[F4_first,T] = SSN_(EEG_F4_first_al(1:4001,k));
for i=1:30
x(i,:)=F4_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_F4_first(i,n(matches),k)=1;
end
end
G3G1_F4_out=ind_G3G1_F4_first;   
for j=1:size(G3G1_F4_out,3)
 G3G1_F4_out(:,:,j)=0;
 G3G1_F4_out_first(:,:,j)=sum(G3G1_F4_out,3)./(size(G3G1_F4_out,3)-1);
end
G3G1_F4_first=sum(ind_G3G1_F4_first,3)./size(ind_G3G1_F4_first,3);
%GB_(G3G1_F4_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G1_FZ_first=zeros(30,28,size(EEG_FZ_first_al,2));
for k=1:size(EEG_FZ_first_al,2)
[FZ_first,T] = SSN_(EEG_FZ_first_al(1:4001,k));
for i=1:30
x(i,:)=FZ_first(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G1_FZ_first(i,n(matches),k)=1;
end
end
G3G1_FZ_out=ind_G3G1_FZ_first;   
for j=1:size(G3G1_FZ_out,3)
 G3G1_FZ_out(:,:,j)=0;
 G3G1_FZ_out_first(:,:,j)=sum(G3G1_FZ_out,3)./(size(G3G1_FZ_out,3)-1);
end
G3G1_FZ_first=sum(ind_G3G1_FZ_first,3)./size(ind_G3G1_FZ_first,3);
%GB_(G3G1_FZ_first);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%              GROUP 3 GRASP 2: PALMAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C1 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_C1_second=zeros(30,28,size(EEG_C1_second_al,2));
for k=1:size(EEG_C1_second_al,2)
[C1_second,T] = SSN_(EEG_C1_second_al(1:4001,k));
for i=1:30
x(i,:)=C1_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_C1_second(i,n(matches),k)=1;
end
end
G3G2_C1_out=ind_G3G2_C1_second;   
for j=1:size(G3G2_C1_out,3)
 G3G2_C1_out(:,:,j)=0;
 G3G2_C1_out_second(:,:,j)=sum(G3G2_C1_out,3)./(size(G3G2_C1_out,3)-1);
end
G3G2_C1_second=sum(ind_G3G2_C1_second,3)./size(ind_G3G2_C1_second,3);
%GB_(G3G2_C1_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C2 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_C2_second=zeros(30,28,size(EEG_C2_second_al,2));
for k=1:size(EEG_C2_second_al,2)
[C2_second,T] = SSN_(EEG_C2_second_al(1:4001,k));
for i=1:30
x(i,:)=C2_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_C2_second(i,n(matches),k)=1;
end
end
G3G2_C2_out=ind_G3G2_C2_second;   
for j=1:size(G3G2_C2_out,3)
 G3G2_C2_out(:,:,j)=0;
 G3G2_C2_out_second(:,:,j)=sum(G3G2_C2_out,3)./(size(G3G2_C2_out,3)-1);
end
G3G2_C2_second=sum(ind_G3G2_C2_second,3)./size(ind_G3G2_C2_second,3);
%GB_(G3G2_C2_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_C3_second=zeros(30,28,size(EEG_C3_second_al,2));
for k=1:size(EEG_C3_second_al,2)
[C3_second,T] = SSN_(EEG_C3_second_al(1:4001,k));
for i=1:30
x(i,:)=C3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_C3_second(i,n(matches),k)=1;
end
end
G3G2_C3_out=ind_G3G2_C3_second;   
for j=1:size(G3G2_C3_out,3)
 G3G2_C3_out(:,:,j)=0;
 G3G2_C3_out_second(:,:,j)=sum(G3G2_C3_out,3)./(size(G3G2_C3_out,3)-1);
end
G3G2_C3_second=sum(ind_G3G2_C3_second,3)./size(ind_G3G2_C3_second,3);
%GB_(G3G2_C3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe C4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_C4_second=zeros(30,28,size(EEG_C4_second_al,2));
for k=1:size(EEG_C4_second_al,2)
[C4_second,T] = SSN_(EEG_C4_second_al(1:4001,k));
for i=1:30
x(i,:)=C4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_C4_second(i,n(matches),k)=1;
end
end
G3G2_C4_out=ind_G3G2_C4_second;   
for j=1:size(G3G2_C4_out,3)
 G3G2_C4_out(:,:,j)=0;
 G3G2_C4_out_second(:,:,j)=sum(G3G2_C4_out,3)./(size(G3G2_C4_out,3)-1);
end
G3G2_C4_second=sum(ind_G3G2_C4_second,3)./size(ind_G3G2_C4_second,3);
%GB_(G3G2_C4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe CZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_CZ_second=zeros(30,28,size(EEG_CZ_second_al,2));
for k=1:size(EEG_CZ_second_al,2)
[CZ_second,T] = SSN_(EEG_CZ_second_al(1:4001,k));
for i=1:30
x(i,:)=CZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_CZ_second(i,n(matches),k)=1;
end
end
G3G2_CZ_out=ind_G3G2_CZ_second;   
for j=1:size(G3G2_CZ_out,3)
 G3G2_CZ_out(:,:,j)=0;
 G3G2_CZ_out_second(:,:,j)=sum(G3G2_CZ_out,3)./(size(G3G2_CZ_out,3)-1);
end
G3G2_CZ_second=sum(ind_G3G2_CZ_second,3)./size(ind_G3G2_CZ_second,3);
%GB_(G3G2_CZ_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F3 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_F3_second=zeros(30,28,size(EEG_F3_second_al,2));
for k=1:size(EEG_F3_second_al,2)
[F3_second,T] = SSN_(EEG_F3_second_al(1:4001,k));
for i=1:30
x(i,:)=F3_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_F3_second(i,n(matches),k)=1;
end
end
G3G2_F3_out=ind_G3G2_F3_second;   
for j=1:size(G3G2_F3_out,3)
 G3G2_F3_out(:,:,j)=0;
 G3G2_F3_out_second(:,:,j)=sum(G3G2_F3_out,3)./(size(G3G2_F3_out,3)-1);
end
G3G2_F3_second=sum(ind_G3G2_F3_second,3)./size(ind_G3G2_F3_second,3);
%GB_(G3G2_F3_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe F4 %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_F4_second=zeros(30,28,size(EEG_F4_second_al,2));
for k=1:size(EEG_F4_second_al,2)
[F4_second,T] = SSN_(EEG_F4_second_al(1:4001,k));
for i=1:30
x(i,:)=F4_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_F4_second(i,n(matches),k)=1;
end
end
G3G2_F4_out=ind_G3G2_F4_second;   
for j=1:size(G3G2_F4_out,3)
 G3G2_F4_out(:,:,j)=0;
 G3G2_F4_out_second(:,:,j)=sum(G3G2_F4_out,3)./(size(G3G2_F4_out,3)-1);
end
G3G2_F4_second=sum(ind_G3G2_F4_second,3)./size(ind_G3G2_F4_second,3);
%GB_(G3G2_F4_second);axis([15.5 28.5 0.5 30.5 0 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Electrdoe FZ %%%%%%%%%%%%%%%%%%%%%%%%

ind_G3G2_FZ_second=zeros(30,28,size(EEG_FZ_second_al,2));
for k=1:size(EEG_FZ_second_al,2)
[FZ_second,T] = SSN_(EEG_FZ_second_al(1:4001,k));
for i=1:30
x(i,:)=FZ_second(i,:);
y(i,:) = filter(b,1,x(i,:));
% Find matches
matches = n(y(i,:)>thresh*u);
% plot(n,y(i,:),'b', n(matches), y(i,matches), 'ro');
ind_G3G2_FZ_second(i,n(matches),k)=1;
end
end
G3G2_FZ_out=ind_G3G2_FZ_second;   
for j=1:size(G3G2_FZ_out,3)
 G3G2_FZ_out(:,:,j)=0;
 G3G2_FZ_out_second(:,:,j)=sum(G3G2_FZ_out,3)./(size(G3G2_FZ_out,3)-1);
end
G3G2_FZ_second=sum(ind_G3G2_FZ_second,3)./size(ind_G3G2_FZ_second,3);
%GB_(G3G2_FZ_second);axis([15.5 28.5 0.5 30.5 0 1])
