load mri
D = squeeze(D);
h0=figure('toolbar','none',...
    'position',[198 56 450 468],...
    'name','实例81');
h1=axes('parent',h0,...
    'position',[0.3 0.45 0.5 0.5],...
    'visible','off');
image_num = 8;
image(D(:,:,image_num))
axis image
colormap(map)
x = xlim;
y = ylim;
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'style','pushbutton',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[50 100 60 20],...
    'string','二维图',...
    'callback',[...
        'cla,',...
        'contourslice(D,[],[],image_num),',...
        'axis ij,',...
        'xlim(x),',...
        'ylim(y),',...
        'daspect([1,1,1]),',...
        'colormap(''default'')']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'style','pushbutton',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[250 100 60 20],...
    'string','三维图',...
    'callback',[...
        'cla,',...
        'phandles = contourslice(D,[],[],[1,12,19,27],8);,',...
        'view(3);,',...
        'axis tight,',...
        'set(phandles,''LineWidth'',2)']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'style','pushbutton',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[50 50 60 20],...
    'string','立体图',...
    'callback',[...
        'cla,',...
        'Ds = smooth3(D);,',...
        'hiso = patch(isosurface(Ds,5),''FaceColor'',[1,.75,.65],''EdgeColor'',''none'');,',...
        'hcap = patch(isocaps(D,5),''FaceColor'',''interp'',''EdgeColor'',''none'');,',...
        'colormap(map),',...
        'view(45,30),',...
        'axis tight,',...
        'daspect([1,1,.4]),',...
        'lightangle(45,30),',...
        'lighting phong,',...
        'isonormals(Ds,hiso),',...
        'set(hcap,''AmbientStrength'',.6),',...
        'set(hiso,''SpecularColorReflectance'',0,''SpecularExponent'',50)']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'style','pushbutton',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'position',[250 50 60 20],...
    'string','关闭',...
    'callback','close');
