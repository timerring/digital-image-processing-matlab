- [Matlab实现图像分割](#matlab实现图像分割)
  - [目的](#目的)
  - [内容](#内容)
    - [线检测](#线检测)
    - [边缘检测](#边缘检测)
    - [使用梯度的分水岭分割](#使用梯度的分水岭分割)
    - [控制标记符的分水岭分割](#控制标记符的分水岭分割)


# Matlab实现图像分割

## 目的

1. 掌握线检测

2. 边缘检测

3. 使用梯度的分水岭分割

4. 控制标记符的分水岭分割

## 内容

### 线检测

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function B=pixeldup(A, m, n)


if nargin<2;
    error('At least two inputs are required');
end
if nargin==2;
    n=m;
end
u=1:size(A,1);
m=round(m);
u=u(ones(1,m), :);
u=u(:);



v = 1:size(A,1);
n=round(n);
v=v(ones(1,n), :);
v=v(:);
B=A(u,v);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH10\Fig1005(a)(wirebond_mask).tif');
figure,imshow(f);

w=[2 -1 -1;-1 2 -1;-1 -1 2];
g=imfilter(double(f),w);
figure,imshow(g,[])%fig 2

gtop=g(1:120,1:120);
gtop=pixeldup(gtop, 4);
figure,imshow(gtop,[])%fig 3

gbot=g(end-119:end,end-119:end);
gbot=pixeldup(gbot,4);
figure,imshow(gbot,[])%fig 4

g=abs(g);
figure,imshow(g,[])%fig 5

T=max(g(:));
g=g>=T;
figure,imshow(g)%fig 6
%%%%%%%%%%%%%%%%%%%%%%%%
```

### 边缘检测

```matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH10\Fig1016(a)(building_original).tif');
figure,imshow(f);
[gv,t]=edge(f,'sobel','vertical');
figure,imshow(gv);
t

gv=edge(f,'sobel',0.15,'vertical');
figure,imshow(gv);
gboth=edge(f,'sobel',0.15);
figure,imshow(gboth);
w45=[-2 -1 0;-1 0 1;0 1 2]
g45=imfilter(double(f),w45,'replicate');
T=0.3*max(abs(g45(:)));
g45=g45>=T;
figure,imshow(g45);
%%%%%%%%%%%%%%%%%%%%%%%%
%Sobel，LoG 和Canny 边缘检测器的比较

clear all
clc
f=imread('D:\pic\DIP3E_CH10\Fig1016(a)(building_original).tif');
figure,imshow(f);

[g_sobel_default,ts]=edge(f,'sobel');
figure,imshow(g_sobel_default);
[g_log_default,tlog]=edge(f,'log');
figure,imshow(g_log_default);
[g_canny_default,tc]=edge(f,'canny');
figure,imshow(g_canny_default);

[g_sobel_best,ts]=edge(f,'sobel',0.05);
figure,imshow(g_sobel_best);
[g_log_best,tlog]=edge(f,'log',0.003,2.25);
figure,imshow(g_log_best);
[g_canny_best,tc]=edge(f,'canny',[0.04 0.10],1.5);
figure,imshow(g_canny_best);
```

### 使用梯度的分水岭分割

```matlab
clear all
clc
f=imread('D:\pic\DIP3E_CH10\Fig1057(a)(small_blobs-original).tif');
figure,imshow(f);

h=fspecial('sobel');
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+...
    imfilter(fd,h','replicate').^2);
figure,imshow(g);

L=watershed(g);
figure,imshow(L);
wr=L==0;

g2=imclose(imopen(g,ones(3,3)),ones(3,3));
figure,imshow(g2);
L2=watershed(g2);
figure,imshow(L2);
wr2=L2==0;
f2=f;
f2(wr2)=255;
figure,imshow(f2);
```

### 控制标记符的分水岭分割

```matlab
%%%%%%%%%%%%%%%%理解每幅图像的含义%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH10\Fig1057(a)(small_blobs-original).tif');
figure,imshow(f);

h=fspecial('sobel');
fd=double(f);
g=sqrt(imfilter(fd,h,'replicate').^2+...
imfilter(fd,h','replicate').^2);
L=watershed(g);
wr=L==0;

rm=imregionalmin(g);
figure,imshow(rm);
im=imextendedmin(f,2);
figure,imshow(im);
fim=f;
fim(im)=175;
figure,imshow(fim);

Lim=watershed(bwdist(im));
figure,imshow(Lim);
em=Lim==0;

g2=imimposemin(g,im|em);
figure,imshow(g2);

L2=watershed(g2);
figure,imshow(L2);
f2=f;
f2(L2==0)=255;
figure,imshow(f2);
```

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
