function [subset,ind_best, cp_tot] =FWSP_SVM(data,label,sigma,nb_cvfolds)
% This function allows to perform forward selection procedure base on K-fold
% cross validation using SVM classifier
%Inputs: 
%data:N by M feature's matrix  
%label:N by 1 Vector of labels correspanding to data matrix, 
%sigma: RBF_sigma
%nb_cvflods: number of folds to perform cross validation 
%outputs:
%subset=matrix containing the subset of best selected features
%ind_best= index of selected features 
%cp_tot: correct classification rate resulting from fwsp function
%
%
%Author: Tarek Lajnef
%Sfax National Engineering School (ENIS), LETI Lab, University of Sfax, Sfax, Tunisia
%Contact: lajnef.tarek@gmail.com
%Version 1.0 (01/2015)
[m n]=size(data);
test_mat=data;
[best1,cp_tot(1),ind_best(1)]=best_feature(test_mat,label,sigma);
subset=best1;
test_mat(:,ind_best(1))=[];
cond=1;f=2;o=n-1;
while cond==1
  for k=1:o
     test_mat=[subset data(:,k)];
     [cp]=crossval_svm(test_mat,label,sigma,nb_cvfolds);
     T(k)=cp.CorrectRate;
  end
   [T ind]=sort(T,'descend');
   best=data(:,ind(1));
   ind_best(f)=ind(1);
   cp_tot(f)=T(1);
    if  cp_tot(f)< cp_tot(f-1)
       cond=0; 
    end
subset=[subset best];
data(:,ind_best(f))=[];
[p o]=size(data);
  f=f+1;
end
end