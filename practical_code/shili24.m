function shili24
h0=figure('toolbar','none',...
    'position',[200 150 450 350],...
    'name','ÊµÀý24');
subplot(2,2,1)
z=peaks;
ribbon(z)
title('Figure1')

subplot(2,2,2)
[x,y,z]=peaks(15);
[dx,dy]=gradient(z,0.5,0.5);
contour(x,y,z,10)
hold on
quiver(x,y,dx,dy)
hold off
title('Figure2')

subplot(2,2,3)
[x,y,z]=peaks(15);
[nx,ny,nz]=surfnorm(x,y,z);
surf(x,y,z)
hold on
quiver3(x,y,z,nx,ny,nz)
hold off
title('Figure3')

subplot(2,2,4)
x=rand(3,5);
y=rand(3,5);
z=rand(3,5);
c=rand(3,5);
fill3(x,y,z,c)
grid on
title('Figure4')