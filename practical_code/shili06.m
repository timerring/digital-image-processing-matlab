function shili06
h0=figure('toolbar','none',...
    'position',[200 150 450 400],...
    'name','实例06');
t=0:pi/10:2*pi;
h=plot(t,sin(t));
xlabel('t=0到2\pi','fontsize',16);
ylabel('sin(t)','fontsize',16);
title('\it{从 0to2\pi 的正弦曲线}','fontsize',16)
x=get(h,'xdata');
y=get(h,'ydata');
imin=find(min(y)==y);
imax=find(max(y)==y);
text(x(imin),y(imin),...
    ['\leftarrow最小值=',num2str(y(imin))],...
    'fontsize',16)
text(x(imax),y(imax),...
    ['\leftarrow最大值=',num2str(y(imax))],...
    'fontsize',16)
    