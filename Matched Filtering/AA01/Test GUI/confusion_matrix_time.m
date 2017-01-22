% This function is called by evaluate() and returns the grasp type with the 
% minimum distance from the individiual trial, for each output of the matched filter 

function [matrix] = confusion_matrix_time(data)

matrix=zeros(28,6);


for k=1:28
    [value, index]=min(data(k,:));
    matrix(k,index)=1;
end
