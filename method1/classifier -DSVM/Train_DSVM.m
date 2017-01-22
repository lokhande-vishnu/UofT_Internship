function [svmstruct,level] = Train_DSVM(train_data,train_label)

% This function trains a multiclass dendogram-based support vector machine
% The details of the classifier are described in Lajnef et al.  and Benani et al.
% This function requires the number of classes to be greater than 2
%
%
% Inputs:
%   train_data: is a 1 by n cell vector which contains the training data correspanding to each class  
%   train_label: is a 1 by n cell vector which contains the training labels that correspand to each classe
%                (labels should be positive numerical values) 
% Output: 
%   svmstruct: an n-1 by 1 cell vector which contains svmstructs resulting from the training phase
%   level: svm level in the dendogram (from racine to root)
% Dependencies and requirements:
%   1)Bioinformatics matlab toolbox is needed in order to run this function  
%   2)linkage and svmtrain parameters can be modified inside this function.
%    
% Author: Tarek Lajnef
% Sfax National Engineering School (ENIS), LETI Lab, University of Sfax, Sfax, Tunisia
% Contact: lajnef.tarek@gmail.com
% Version 1.0 (03/2015)
[s] =size(train_label);
label=zeros(1,s(2));
for i=1:s(2)
label(i)=unique(train_label{i});
end
nb_class=length(label);

for i=1:nb_class
test(i,:)=mean(train_data{i});
end
% Dendogram generation 
Z = linkage(test,'single','correlation');
%cc = cluster(Z,'cutoff',1);
%figure;dendrogram(Z);xlabel('Classes');ylabel('1-''sample correlation''');grid on;
% SVM implementation and training at each node 
M=Z(:,1:2);
n=1;
A1=[];B1=[];C1=[]; %Classes_label=cell(size(M));C=cell(1,4);Classes=cell(size(M));
A2=[];B2=[];C2=[];svmstruct=cell(nb_class-1,1);
for j=1:nb_class-1
   mat=M(j,:);
    if (mat(1)<=nb_class && mat(2)<=nb_class)
        C{n}=mat;
        Classes{n,1}=[train_data{mat(1)}];
        Classes{n,2}=train_data{mat(2)};
        Classes_label{n,1}=train_label{mat(1)};
        Classes_label{n,2}=train_label{mat(2)};
        svmstruct{n}=svmtrain([Classes{n,1};Classes{n,2}],[train_label{mat(1)};train_label{mat(2)}],'Showplot',false, 'Kernel_Function','rbf');
        n=n+1;
    elseif (mat(1)> nb_class && mat(2)> nb_class)
        cluster_ind=mat(mat>nb_class)-nb_class;
        m1=C{cluster_ind(1)};
        m12=C{cluster_ind(2)};
        C{n}=[m1,m12];
       for h=1:length(m1)
         A1=[A1;train_label{m1(h)}];
         A2=[A2;train_data{m1(h)}];
       end
         Classes_label{n,1}=A1;
         Classes{n,1}=A2;
        for p=1:length(m12)
         B1=[B1;train_label{m12(p)}];
         B2=[B2;train_data{m12(p)}];
        end
       Classes_label{n,2}=B1;
       Classes{n,2}=B2;
        [k1,k2]=size(Classes{n,2});
        [f1,f2]=size(Classes{n,1});
       svmstruct{n}=svmtrain([Classes{n,1};Classes{n,2}],[-nb_class*ones(f1,1);-(nb_class+1)*ones(k1,1)],'Showplot',false, 'Kernel_Function','rbf');
        level(cluster_ind(1))=-nb_class;
        level(cluster_ind(2))=-(nb_class+1);
       n=n+1; 
       B1=[];
       B2=[];
       A1=[];
       A2=[];
    else 
        cluster_ind=mat(mat>nb_class)-nb_class;
        C{n}=[mat(mat<=nb_class),C{cluster_ind}];
        m2=C{cluster_ind};
        Classes_label{n,1}=[train_label{mat(mat<=nb_class)}];
        Classes{n,1}=train_data{mat(mat<=nb_class)};
         for h=1:length(m2)
         C1=[C1;train_label{m2(h)}];
         C2=[C2;train_data{m2(h)}];
         end
         Classes_label{n,2}=C1;
         Classes{n,2}=C2;
         [l1,l2]=size(Classes{n,2});
         level(cluster_ind)=-1*cluster_ind;
         svmstruct{n}=svmtrain([Classes{n,1};Classes{n,2}],[train_label{mat(mat<=nb_class)};-1*cluster_ind*ones(l1,1)],'Showplot',false, 'Kernel_Function','rbf');
         n=n+1;
         C1=[];
         C2=[];
    end
end
level=level(end:-1:1);
svmstruct=svmstruct(end:-1:1);