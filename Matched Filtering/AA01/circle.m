function h = circle(x,y,r,color,width)
char col;

if color==1
    col='r';

else
    col='k';

end
% hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,col,'LineWidth',width);
% hold off