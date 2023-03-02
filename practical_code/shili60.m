h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','实例60');
h1=axes('parent',h0,...
    'position',[0.25 0.45 0.5 0.5],...
    'visible','off');
str1='当前阻尼比＝';
z=0.52;
t=0:0.1:10;
y=step(1,[1 2*z 1],t);
hline=plot(t,y);
grid on
r1=uicontrol('parent',h0,...
    'units','points',...
    'tag','r1',...
    'style','radio',...
    'string','grid on',...
    'position',[30 120 60 20],...
    'backgroundcolor',[0.75 0.75 0.75],...
    'value',1,...
    'callback',[...
        'grid on,',...
        'set(r1,''value'',1);,',...
        'set(r2,''value'',0)']);
r2=uicontrol('parent',h0,...
    'units','points',...
    'tag','r2',...
    'style','radio',...
    'string','grid on',...
    'position',[30 95 60 20],...
     'backgroundcolor',[0.75 0.75 0.75],...
    'value',0,...
    'callback',[...
        'grid off,',...
        'set(r2,''value'',1);,',...
        'set(r1,''value'',0)']);
s1=uicontrol('parent',h0,...
    'units','points',...
    'tag','s1',...
    'style','slider',...
    'value',z,...
    'position',[100 95 150 20],...
     'backgroundcolor',[0.75 0.75 0.75],...
    'max',1,...
    'min',0,...
    'callback',[...
        'z=get(s1,''value'');,',...
        'set(t1,''string'',[str1,sprintf(''%1.4g\'',z)]);,',...
        'delete(hline),',...
        'y=step(1,[1 2*z 1],t);,',...
        'hline=plot(t,y);,',...
        'if get(r1,''value'')==1,',...
        'grid on,',...
        'end,',...
        'if get(r2,''value'')==1,',...
        'grid off,',...
        'end']);
t1=uicontrol('parent',h0,...
    'units','points',...
    'tag','t1',...
    'style','text',...
    'string',[str1,sprintf('%1.4g\',z)],...
    'position',[100 120 150 20],...
    'backgroundcolor',[0.75 0.75 0.75]);
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'style','pushbutton',...
    'string','关闭',...
    'position',[80 50 80 30],...
    'backgroundcolor',[0.75 0.75 0.75],...
    'fontsize',15,...
    'callback','close');