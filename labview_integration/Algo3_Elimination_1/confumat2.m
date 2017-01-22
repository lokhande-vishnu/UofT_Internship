function bookrow = confumat2(d,y)
bookrow(1) = sum(y==d)/size(y,1)*100;

index = (d~=0);
bookrow(2) = sum(y(index)==d(index))/sum(index)*100;

index = (d==0);
bookrow(3) = sum(y(index)==d(index))/sum(index)*100;

end