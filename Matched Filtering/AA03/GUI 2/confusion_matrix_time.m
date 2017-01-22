function [matrix] = confusion_matrix_time(data)

matrix=zeros(28,6);


for k=1:28
    [value, index]=min(data(k,:));
    matrix(k,index)=1;
end
