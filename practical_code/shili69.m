h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','频率操作');
h1=axes('parent',h0,...
    'position',[0.3 0.45 0.5 0.5],...
    'visible','off');
b=remez(10,[0 0.4 0.6 1],[1 1 0 0]);
h=ftrans2(b);
[H,W]=freqz(b,1,64,'whole');
colormap(jet(64))
plot(W/pi-1,fftshift(abs(H)))
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','频率变换',...
    'position',[30 100 50 20],...
    'callback',[...
        'cla,',...
        'b=remez(10,[0 0.4 0.6 1],[1 1 0 0]);,',...
        'h=ftrans2(b);,',...
        '[H,W]=freqz(b,1,64,''whole'');,',...
        'colormap(jet(64)),',...
        'freqz2(h,[32 32])']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','频率采样一',...
    'position',[100 100 50 20],...
    'callback',[...
        'cla,',...
        'Hd=zeros(11,11);,',...
        'Hd(4:8,4:8)=1;,',...
        '[f1,f2]=freqspace(11,''meshgrid'');,',...
        'mesh(f1,f2,Hd),',...
        'axis([-1 1 -1 1 0 1.2]),',...
        'colormap(jet(64))']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','频率采样二',...
    'position',[170 100 50 20],...
    'callback',[...
        'cla,',...
        'Hd=zeros(11,11);,',...
        'Hd(4:8,4:8)=1;,',...
        'H=fsamp2(Hd);,',...
        'freqz2(h,[32 32]),',...
        'axis([-1 1 -1 1 0 1.2]),',...
        'colormap(jet(64))']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','关闭',...
    'fontsize',15,...
    'position',[80 50 80 30],...
    'callback','close');