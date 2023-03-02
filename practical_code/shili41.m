h=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例41');
h1=uicontrol(gcf,'style','edit',...
    'position',[80 200 100 20],...
    'HorizontalAlignment','right',...
    'callback',['m=get(h1,''string'');,',...
        'a=str2num(m);']);
h2=uicontrol(gcf,'style','edit',...
    'HorizontalAlignment','right',...
    'position',[80 150 100 20],...
    'callback',['n=get(h2,''string'');,',...
        'b=str2num(n);']);
h3=uicontrol(gcf,'style','text',...
    'string','被除数',...
    'position',[80 230 100 20]);
h4=uicontrol(gcf,'style','edit',...
    'position',[80 50 100 20]);
h5=uicontrol(gcf,'style','pushbutton',...
    'position',[80 100 100 20],...
    'string','=',...
    'callback',[...
        'if b==0,',...
        'h7=errordlg(''除数不能为0！'',''error'',''on'');,',...
        'else,',...
        'k=a/b;,',...
        'c=num2str(k);,',...
        'set(h4,''string'',c),',...
        'end']);
h8=uicontrol(gcf,'style','text',...
    'string','除数',...
    'position',[80 175 100 20]);
h9=uicontrol(gcf,'style','text',...
    'string','商',...
    'position',[80 75 100 20]);