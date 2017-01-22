function [best,p_best,ind_best]=Best_feature(mat,label,sigma)
[m n]=size(mat);T=zeros(1,n);
for i=1:n
[cp]=crossvalsvmlyon(mat(:,i),label,sigma);
T(i)=cp.CorrectRate;
end
[T ind]=sort(T,'descend');
best=mat(:,ind(1));
ind_best=ind(1);
p_best=T(1);
end