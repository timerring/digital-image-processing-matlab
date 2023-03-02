function shili14
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例14');
axis([0 10 0 10]);
hold on
x=[];
y=[];
n=0;
disp('单击鼠标左键点取需要的点');
disp('单击鼠标右键点取最后一个点');
but=1;
while but==1
    [xi,yi,but]=ginput(1);
    plot(xi,yi,'bo')
    n=n+1;
    disp('单击鼠标左键点取下一个点');
    x(n,1)=xi;
    y(n,1)=yi;
end
t=1:n;
ts=1:0.1:n;
xs=spline(t,x,ts);
ys=spline(t,y,ts);
plot(xs,ys,'r-');
hold off