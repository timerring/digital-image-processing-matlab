function shili14
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ʵ��14');
axis([0 10 0 10]);
hold on
x=[];
y=[];
n=0;
disp('������������ȡ��Ҫ�ĵ�');
disp('��������Ҽ���ȡ���һ����');
but=1;
while but==1
    [xi,yi,but]=ginput(1);
    plot(xi,yi,'bo')
    n=n+1;
    disp('������������ȡ��һ����');
    x(n,1)=xi;
    y(n,1)=yi;
end
t=1:n;
ts=1:0.1:n;
xs=spline(t,x,ts);
ys=spline(t,y,ts);
plot(xs,ys,'r-');
hold off