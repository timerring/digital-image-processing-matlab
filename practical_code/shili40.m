h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例40');
h1=uimenu(gcf,'label','函数');
h11=uimenu(h1,'label','轮廓图',...
    'callback',[...
        'set(h31,''checked'',''on''),',...
        'set(h32,''checked'',''off''),',...
        '[x,y,z]=peaks;,',...
        'contour3(x,y,z,30)']);
h12=uimenu(h1,'label','高斯分布',...
    'callback',[...
        'set(h31,''checked'',''on''),',...
        'set(h32,''checked'',''off''),',...
        'mesh(peaks);,',...
        'axis tight']);
h13=uimenu(h1,'label','Sinc函数',...
    'callback',[...
        'set(h31,''checked'',''on''),',...
        'set(h32,''checked'',''off''),',...
        '[x,y]=meshgrid(-8:0.5:8);,',...
        'r=sqrt(x.^2+y.^2)+eps;,',...
        'z=sin(r)./r;,',...
        'mesh(x,y,z)']);
h2=uimenu(gcf,'label','色彩');
hl2(1)=uimenu(h2,'label','Default',...
    'checked','on',...
    'callback',...
    [...
        'set(hl2,''checked'',''off''),',...
        'set(hl2(1),''checked'',''on''),',...
        'colormap(''default'')']);
hl2(2)=uimenu(h2,'label','spring',...
    'callback',...
    [...
        'set(hl2,''checked'',''off''),',...
        'set(hl2(2),''checked'',''on''),',...
        'colormap(spring)']);
hl2(3)=uimenu(h2,'label','Summer',...
    'callback',...
    [...
        'set(hl2,''checked'',''off''),',...
        'set(hl2(3),''checked'',''on''),',...
        'colormap(summer)']);
hl2(4)=uimenu(h2,'label','Autumn',...
    'callback',...
    [...
        'set(hl2,''checked'',''off''),',...
        'set(hl2(4),''checked'',''on''),',...
        'colormap(autumn)']);
hl2(5)=uimenu(h2,'label','Winter',...
    'callback',...
    [...
        'set(hl2,''checked'',''off''),',...
        'set(hl2(5),''checked'',''on''),',...
        'colormap(winter)']);
h3=uimenu(gcf,'label','坐标选项');
h31=uimenu(h3,'label','Axis on',...
    'callback',...
    [...
        'axis on,',...
        'set(h31,''checked'',''on''),',...
        'set(h32,''checked'',''off'')']);
h32=uimenu(h3,'label','Axis off',...
    'callback',...
    [...
        'axis off,',...
        'set(h32,''checked'',''on''),',...
        'set(h31,''checked'',''off'')']);