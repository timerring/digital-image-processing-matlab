h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','ʵ??82');
h1=axes('parent',h0,...
    'position',[0.2 0.45 0.5 0.5],...
    'visible','off');
load earth
clims = [10 60];
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'style','pushbutton',...
    'string','ǿ??ͼ??',...
    'position',[30 120 50 20],...
    'callback',[...
        'cla,',...
        'imagesc(X,clims),',...
        'colormap(gray)']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'style','pushbutton',...
    'string','????ͼ??',...
    'position',[100 120 50 20],...
    'callback',[...
        'cla,',...
        'image(X),',...
        'colormap(map),',...
        'axis image']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'style','pushbutton',...
    'string','????ͼ??',...
    'position',[170 120 50 20],...
    'callback',[...
        'cla,',...
        'image(X),',...
        'axis image']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'style','pushbutton',...
    'string','?ر?',...
    'position',[100 50 50 20],...
    'callback','close');
