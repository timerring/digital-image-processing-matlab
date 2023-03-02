function shili30
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ÊµÀý30');
[x,y,z]=meshgrid(-2:0.1:2,...
    -2:0.1:2,...
    -2:0.1:2);
v=x.*exp(-x.^2-y.^2-z.^2);
[dx,dy,dz]=cylinder;
slice(x,y,z,v,[-2 2],2,-2)
for i=-2:0.2:2
    h=surface(dx+i,dy,dz);
    rotate(h,[1 0 0],90)
    xp=get(h,'xdata');
    yp=get(h,'ydata');
    zp=get(h,'zdata');
    delete(h)
    hold on
    hs=slice(x,y,z,v,xp,yp,zp);
    axis tight
    xlim([-3 3])
    view(-10,35)
    drawnow
    delete(hs)
    hold off
end