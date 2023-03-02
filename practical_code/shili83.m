h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','实例83');
h1=axes('parent',h0,...
    'position',[0.25 0.45 0.5 0.5],...
    'visible','off');
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','颜色条',...
    'position',[30 120 50 20],...
    'callback',[...
        'cla,',...
        'I = imread(''plane.jpg'');,',...
        'imshow(I),',...
        'colorbar']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'position',[100 120 50 20],...
    'string','单帧显示',...
    'callback',[...
        'cla,',...
        'load mri,',...
        'imshow(D(:,:,:,7))']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','动画显示',...
    'position',[30 60 50 20],...
    'callback',[...
        'cla,',...
        'load mri,',...
        'montage(D,map),',...
        'mov=immovie(D,map);,',...
        'colormap(map),',...
        'movie(mov)']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','纹理映射',...
    'position',[170 60 50 20],...
    'callback',[...
        'cla,',...
        '[x,y,z] = cylinder;,',...
        'I = imread(''girls.jpg'');,',...
        'warp(x,z,y,I);']);
b5=uicontrol('parent',h0,...
    'units','points',...
    'tag','b5',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','关闭',...
    'position',[100 60 50 20],...
    'callback','close');
b6=uicontrol('parent',h0,...
    'units','points',...
    'tag','b6',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','多帧显示',...
    'position',[170 120 50 20],...
    'callback',[...
        'cla,',...
        'load mri,',...
        'montage(D,map)']);