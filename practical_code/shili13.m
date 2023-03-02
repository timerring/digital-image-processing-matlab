function shili13
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例13');
[th,r]=meshgrid((0:10:360)*pi/180,0:0.05:1);
[x,y]=pol2cart(th,r);
z=x+i*y;
f=(z.^4-1).^(0.25);
contour(x,y,abs(f),20)
axis equal
xlabel('实部','fontsize',16);
ylabel('虚部','fontsize',16);
h=polar([0 2*pi],[0 1]);
delete(h)
hold on
contour(x,y,abs(f),20)