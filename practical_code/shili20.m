function shili20
h0=figure('toolbar','none',...
    'position',[200 150 450 300],...
    'name','ÊµÀý20');
subplot(1,2,1)
[x,y,z]=sphere(10);
mesh(x,y,z)
axis off
title('Figure1:Opaque')
hidden on

subplot(1,2,2)
[x,y,z]=sphere(10);
mesh(x,y,z)
axis off
title('Figure2:Transparent')
hidden off