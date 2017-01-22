function [ind]=ttest_selection(features,labels,B)
%This function allows to choose, using ttest procedure, B revelant features
%Input: 
%features: N by M matrix of features 
%labels: N by 1 vector of corresponding labels 
%B: number of best features to select
%output:
%ind:index of B best features
% 
% 
%
%Author: Tarek Lajnef
% Sfax National Engineering School (ENIS), LETI Lab, University of Sfax, Sfax, Tunisia
% Contact: lajnef.tarek@gmail.com
% Version 1.0 (01/2015)

class=unique(labels);
[~,n]=size(features);
comb=nchoosek(class,2); 
for j=1:n
   for m=1: length(comb)
    ind=comb(m,:);
score(j,:)=ttest2(features(labels==ind(1),:),features(labels==ind(2),:),0.05);
   end
end
for k=1:n
    rg(k)=sum(score(:,k));
end
[~,ind]=sort(rg,'descend');
best_feat=ind(1:B);
end