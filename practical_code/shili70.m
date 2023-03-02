h0=figure('toolbar','none',...
    'position',[198 56 350 468],...
    'name','�����任');
h1=axes('parent',h0,...
    'position',[0.25 0.45 0.5 0.5],...
    'visible','off');
I=imread('cameraman.tif');
imshow(I)
b1=uicontrol('parent',h0,...
    'units','points',...
    'tag','b1',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','ͼ��ѹ��',...
    'position',[30 100 50 20],...
    'callback',[...
        'cla,',...
        'I=imread(''cameraman.tif'');,',...
        'I2=im2double(I);,',...
        'imshow(I2)']);
b2=uicontrol('parent',h0,...
    'units','points',...
    'tag','b2',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','ͼ���ѹ',...
    'position',[100 100 50 20],...
    'callback',[...
        'cla,',...
        'I=imread(''cameraman.tif'');,',...
        'I=im2double(I);,',...
        'T=dctmtx(8);,',...
        'B=blkproc(I,[8 8],''P1*x*P2'',T,T'');,',...
        'mask=[1 1 1 1 0 0 0 0;,',...
              '1 1 1 0 0 0 0 0;,',...
              '1 1 0 0 0 0 0 0;,',...
              '1 0 0 0 0 0 0 0;,',...
              '0 0 0 0 0 0 0 0;,',...
              '0 0 0 0 0 0 0 0;,',...
              '0 0 0 0 0 0 0 0;,',...
              '0 0 0 0 0 0 0 0];,',...
        'B2=blkproc(B,[8 8],''P1.*x'',mask);,',...
        'I2=blkproc(B2,[8 8],''P1*x*P2'',T'',T);,',...
        'imshow(I2)']);
b3=uicontrol('parent',h0,...
    'units','points',...
    'tag','b3',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','��������',...
    'position',[170 100 50 20],...
    'callback',[...
        'cla,',...
        'I=imread(''cameraman.tif'');,',...
        'BW=edge(I);,',...
        'imshow(BW)']);
b4=uicontrol('parent',h0,...
    'units','points',...
    'tag','b4',...
    'backgroundcolor',[0.75 0.75 0.75],...
    'style','pushbutton',...
    'string','�ر�',...
    'fontsize',15,...
    'position',[80 50 80 30],...
    'callback','close');