function shili15
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ÊµÀý15');
axis equal
m=moviein(20,gcf);
set(gca,'nextplot','replacechildren')
h=uicontrol('style','slider','position',...
    [100 10 500 20],'min',1,'max',20)
for j=1:20
    plot(fft(eye(j+16)))
    set(h,'value',j)
    m(:,j)=getframe(gcf);
end
clf;
axes('position',[0 0 1 1]);
movie(m,30)