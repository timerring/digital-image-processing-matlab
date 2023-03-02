function shili31
h0=figure('toolbar','none',...
    'position',[200 150 550 250],...
    'name','ÊµÀý31');
subplot(1,2,1)
x=rand(100,1)*16-8;
y=rand(100,1)*16-8;
r=sqrt(x.^2+y.^2)+eps;
z=sin(r)./r;
xlin=linspace(min(x),max(x),33);
ylin=linspace(min(y),max(y),33);
[X,Y]=meshgrid(xlin,ylin);
Z=griddata(x,y,z,X,Y,'cubic');
mesh(X,Y,Z)
axis tight
hold on
plot3(x,y,z,'.','Markersize',20)

subplot(1,2,2)
k=5;
n=2^k-1;
theta=pi*(-n:2:n)/n;
phi=(pi/2)*(-n:2:n)'/n;
X=cos(phi)*cos(theta);
Y=cos(phi)*sin(theta);
Z=sin(phi)*ones(size(theta));
colormap([0 0 0;1 1 1])
C=hadamard(2^k);
surf(X,Y,Z,C)
axis square