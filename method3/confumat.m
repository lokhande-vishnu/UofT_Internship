function bookrow = confumat(d,y)
bookrow(1) = sum(y==d)/size(y,1)*100;

index = (d==1);
bookrow(2) = sum(y(index)==d(index))/sum(index)*100;

index = (d==2);
bookrow(3) = sum(y(index)==d(index))/sum(index)*100;

index = (d==3);
bookrow(4) = sum(y(index)==d(index))/sum(index)*100;

index = (d==4);
bookrow(5) = sum(y(index)==d(index))/sum(index)*100;

index = (d==5);
bookrow(6) = sum(y(index)==d(index))/sum(index)*100;

index = (d==6);
bookrow(7) = sum(y(index)==d(index))/sum(index)*100;

end