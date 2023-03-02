h0=figure('toolbar','none',...
    'position',[200 150 300 250],...
    'name','实例65');
huidiao=[...
        'k=0;,',...
        'fyear=str2num(get(e1,''string''));,',...
        'fmonth=str2num(get(e2,''string''));,',...
        'fday=str2num(get(e3,''string''));,',...
        'syear=str2num(get(e4,''string''));,',...
        'smonth=str2num(get(e5,''string''));,',...
        'sday=str2num(get(e6,''string''));,',...
        'month=[0 31 28 31 30 31 30 31 31 30 31 30 31];,',...
        'k=fix(fyear/4);,',...
        'if rem(fyear,4)==0,',...
        'month(3)=29;,',...
        'else,',...
        'k=k+1;,',...
        'month(3)=28;,',...
        'end,',...
        'sum=0;,',...
        'for i=1:fmonth,',...
        'sum=sum+month(i);,',...
        'end,',...
        'fdday=fyear*365+sum+fday+k;,',...
        'l=fix(syear/4);,',...
        'if rem(syear,4)==0,',...
        'month(3)=29;,',...
        'else,',...
        'l=l+1;,',...
        'month(3)=28;,',...
        'end,',...
        'ssum=0;,',...
        'for i=1:smonth,',...
        'ssum=ssum+month(i);,',...
        'end,',...
        'sdday=syear*365+ssum+sday+l;,',...
        'dday=abs(fdday-sdday);,',...
        'set(e7,''string'',[num2str(dday),''天'']);'];
t0=uicontrol('parent',h0,...
    'units','points',...
    'tag','t0',...
    'style','text',...
    'string','开始日期：',...
    'horizontalalignment','right',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[10 160 80 20]);
t8=uicontrol('parent',h0,...
    'units','points',...
    'tag','t8',...
    'style','text',...
    'string','结束日期：',...
    'horizontalalignment','right',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[115 160 80 20]);
e1=uicontrol('parent',h0,...
    'units','points',...
    'tag','e1',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[20 130 50 20]);
t1=uicontrol('parent',h0,...
    'units','points',...
    'tag','t1',...
    'style','text',...
    'string','年',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[75 130 20 20]);
e2=uicontrol('parent',h0,...
    'units','points',...
    'tag','e2',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[20 100 50 20]);
t2=uicontrol('parent',h0,...
    'units','points',...
    'tag','t2',...
    'style','text',...
    'string','月',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[75 100 20 20]);
e3=uicontrol('parent',h0,...
    'units','points',...
    'tag','e3',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[20 70 50 20]);
t3=uicontrol('parent',h0,...
    'units','points',...
    'tag','t3',...
    'style','text',...
    'string','日',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[75 70 20 20]);
e4=uicontrol('parent',h0,...
    'units','points',...
    'tag','e4',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[120 130 50 20]);
t4=uicontrol('parent',h0,...
    'units','points',...
    'tag','t4',...
    'style','text',...
    'string','年',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[175 130 20 20]);
e5=uicontrol('parent',h0,...
    'units','points',...
    'tag','e5',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[120 100 50 20]);
t5=uicontrol('parent',h0,...
    'units','points',...
    'tag','t5',...
    'style','text',...
    'string','月',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[175 100 20 20]);
e6=uicontrol('parent',h0,...
    'units','points',...
    'tag','e6',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[120 70 50 20]);
t6=uicontrol('parent',h0,...
    'units','points',...
    'tag','t6',...
    'style','text',...
    'string','日',...
    'horizontalalignment','left',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[175 70 20 20]);
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'style','pushbutton',...
    'string','计算日期',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[20 40 50 20],...
    'callback',huidiao);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'style','pushbutton',...
    'string','关闭',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[20 10 50 20],...
    'callback','close');
e7=uicontrol('parent',h0,...
    'units','points',...
    'tag','e7',...
    'style','edit',...
    'horizontalalignment','right',...
    'backgroundcolor',[1 1 1],...
    'position',[120 10 80 20]);
t7=uicontrol('parent',h0,...
    'units','points',...
    'tag','t7',...
    'style','text',...
    'string','两个日期相差：',...
    'horizontalalignment','right',...
    'fontsize',15,...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[100 30 110 20]);