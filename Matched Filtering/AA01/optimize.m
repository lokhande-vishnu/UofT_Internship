function[grasp]=optimize(con_mat,i)

for k=1:8
    m(k)=con_mat(i,i,k);
end

grasp=max(m);
end