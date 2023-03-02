function shili29
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ÊµÀý29');
[x,y,z]=meshgrid(-2:0.1:2,...
    -2:0.1:2,...
    -2:0.1:2);
v=x.*exp(-x.^2-y.^2-z.^2);
grid on
for i=-2:0.5:2;
    h1=surf(linspace(-2,2,20),...
        linspace(-2,2,20),...
        zeros(20)+i);
    rotate(h1,[1 -1 1],30)
    dx=get(h1,'xdata');
    dy=get(h1,'ydata');
    dz=get(h1,'zdata');
    delete(h1)
    slice(x,y,z,v,[-2 2],2,-2)
    hold on
    slice(x,y,z,v,dx,dy,dz)
    hold off
    axis tight
    view(-5,10)
    drawnow
end