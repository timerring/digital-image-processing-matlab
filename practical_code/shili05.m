function shili05
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ÊµÀý05');
t=0:pi/10:2*pi;
[x,y]=meshgrid(t);
subplot(2,2,1)
plot(sin(t),cos(t))
axis equal

subplot(2,2,2)
z=sin(x)-cos(y);
plot(t,z)
axis([0 2*pi -2 2])

subplot(2,2,3)
h=sin(x)+cos(y);
plot(t,h)
axis([0 2*pi -2 2])

subplot(2,2,4)
g=(sin(x).^2)-(cos(y).^2);
plot(t,g)
axis([0 2*pi -1 1])