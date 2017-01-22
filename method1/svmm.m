function [results]= svmm(train,trainval2)
target=trainval2;
target(target~=1)=0;
svmstruct=svmtrain(train,target,'kernel_function','rbf','method','LS');
targetpred = svmclassify(svmstruct,train);
ind=target==1;
sum(targetpred(ind))/sum(target(ind))

end
    
% 
% options = optimset('maxiter', 2500, 'largescale','off'); %options settings for SVMTRAIN
%     fea(i)=svmtrain(test_set,y,'boxconstraint',80,'kernel_function','rbf','method','QP','rbf_sigma',0.3,'quadprog_opts' , options);
