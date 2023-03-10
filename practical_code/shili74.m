h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','实例74');
h1=axes('parent',h0,...
    'position',[0.25 0.45 0.5 0.5],...
    'visible','off');
I=imread('trees.tif');
imshow(I)
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'style','pushbutton',...
    'string','区域过滤一',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[30 100 50 20],...
    'callback',[...
        'cla,',...
        'I=imread(''trees.tif'');,',...
        'imshow(I),',...
        'BW=roipoly;,',...
        'h=fspecial(''unsharp'');,',...
        'I2=roifilt2(h,I,BW);,',...
        'imshow(I2)']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'style','pushbutton',...
    'string','区域过滤二',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[100 100 50 20],...
    'callback',[...
        'cla,',...
        'BW=imread(''text.tif'');,',...
        'f=inline(''imadjust(x,[],[],0.01)'');,',...
        'I2=roifilt2(I,BW,f);,',...
        'imshow(I2)']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'style','pushbutton',...
    'string','区域填充',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[170 100 50 20],...
    'callback',[...
        'cla,',...
        'load trees,',...
        'I=ind2gray(X,map);,',...
        'imshow(I),',...
        'I2=roifill;,',...
        'imshow(I2)']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'style','pushbutton',...
    'string','关闭',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[90 50 70 30],...
    'callback','close');