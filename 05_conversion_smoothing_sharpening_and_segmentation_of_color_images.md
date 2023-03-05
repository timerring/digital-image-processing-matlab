- [Matlab实现彩色图像的转换、平滑、锐化与分割](#matlab实现彩色图像的转换平滑锐化与分割)
  - [目的](#目的)
  - [内容](#内容)
    - [1.使用 RGB、索引和灰度级图像间转换的函数](#1使用-rgb索引和灰度级图像间转换的函数)
    - [2.掌握彩色图像平滑的MATLAB 仿真](#2掌握彩色图像平滑的matlab-仿真)
    - [3.彩色图像锐化](#3彩色图像锐化)
    - [4.RGB 彩色图像分割](#4rgb-彩色图像分割)


# Matlab实现彩色图像的转换、平滑、锐化与分割

## 目的

1. 使用 RGB、索引和灰度级图像间转换的函数
2. 掌握彩色图像平滑的MATLAB 仿真
3. 彩色图像锐化
4. RGB 彩色图像分割

## 内容

### 1.使用 RGB、索引和灰度级图像间转换的函数

```matlab
clc
f=imread('D:\pic\DIP3E_CH06\Fig0651(a)(flower_no_compression).tif');
imshow(f)
title('原图像');

[X1,map1]=rgb2ind(f,8,'nodither');
figure
imshow(X1,map1);%无抖动处理的颜色数减少到8 的图像
title('无抖动处理的颜色数减少到8 的图像');

[X2,map2]=rgb2ind(f,8,'dither');
figure
imshow(X2,map2)%有抖动处理的颜色数减少到8 的图像
title('有抖动处理的颜色数减少到8 的图像');

g=rgb2gray(f);
g1=dither(g);
figure,imshow(g);
title('使用函数rgb2gray 得到的原图像的灰度级图像');
figure,imshow(g1);
title('经抖动处理后的灰度图像（这是一幅二值图像）');
```

### 2.掌握彩色图像平滑的MATLAB 仿真

```matlab
function hsi = rgb2hsi(rgb)

rgb=im2double(rgb);
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);

num=0.5*((r-g)+(r-b));
den=sqrt((r-g).^2+(r-b).*(g-b));
theta=acos(num./(den+eps));

H=theta;
H(b>g)=2*pi-H(b>g);
H=H/(2*pi);

num=min(min(r,g),b);
den=r+g+b;
den(den==0)=eps;
S=1-3.*num./den;

H(S==0)=0;
I=(r+g+b)/3;

hsi=cat(3,H,S,I);

function rgb=hsi2rgb(hsi)
H=hsi(:,:,1)*2*pi;
S=hsi(:,:,2);
I=hsi(:,:,3);

R=zeros(size(hsi,1),size(hsi,2));
G=zeros(size(hsi,1),size(hsi,2));
B=zeros(size(hsi,1),size(hsi,2));

idx=find((0<=H)&(H<2*pi/3));
B(idx)=I(idx).*(1-S(idx));
R(idx)=I(idx).*(1-S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
G(idx)=3*I(idx)-(R(idx)+B(idx));

idx=find((2*pi/3<=H)&(H<4*pi/3));
R(idx)=I(idx).*(1-S(idx));
G(idx)=I(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
B(idx)=3*I(idx)-(R(idx)+G(idx));

idx=find((4*pi/3<=H)&(H<=2*pi));
G(idx)=I(idx).*(1-S(idx));
B(idx)=I(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
R(idx)=3*I(idx)-(G(idx)+B(idx));

rgb=cat(3,R,G,B);
rgb=max(min(rgb,1),0);

%%%%%%%%%%%主函数——图像平滑

clear all
clc
fc=imread('D:\pic\DIP3E_CH06\Fig0637(a)(caster_stand_original).tif');
imshow(fc)
h=rgb2hsi(fc);
H=h(:,:,1);%显示h 分量图像
figure,imshow(H)
title('H 分量')
S=h(:,:,2);
title('S 分量')
figure,imshow(S)
I=h(:,:,3);
figure,imshow(I)
title('I 分量')
w=fspecial('average',25);
I_filtered=imfilter(I,w,'replicate');
h=cat(3,H,S,I_filtered);
f=hsi2rgb(h);
figure,imshow(f)
f=min(f,1);%RGB images must have values in the range[0,1]
figure,imshow(f)
```

### 3.彩色图像锐化

```matlab
clear all
clc
fc=imread('D:\pic\DIP3E_CH06\Fig0637(a)(caster_stand_original).tif');
imshow(fc)

lapmask=[1 1 1;1 -8 1;1 1 1];
fen=imsubtract(fc,imfilter(fc,lapmask,'replicate'));
figure,imshow(fen)
```

### 4.RGB 彩色图像分割

```matlab
function [C,m]=covmatrix(X)

[K,n]=size(X);
X=double(X);
if n==1
    C=0; m=x;
else
    m=sum(X,1)/K;
    X=X-m(ones(K,1),:);
    C=(X'*X)/(K-1);
    m=m';
end

function I=colorseg(varargin)

f=varargin{2};
if(ndims(f)~=3)|(size(f,3)~=3)
    error('Input image must be RGB!');
end
M=size(f,1); N=size(f,2);
[f,L]=imstack2vectors(f);
f=double(f);
I=zeros(M*N,1);
T=varargin{3};
m=varargin{4};
m=m(:)';%make sure that m is a row vetor
if length(varargin)==4
    method='euclidean';
elseif length(varargin)==5
    method='mahalanobis';
else
    error('wrong number of inputs!');
end
switch method
    case 'euclidean'
        p=length(f);
        D=sqrt(sum(abs(f-repmat(m,p,1)).^2,2));
    case 'mahalanobis'
        C=varargin{5};
        D=mahalanobis(f,C,m);
    otherwise
        error('Unknown segmentation method!');
end

J=find(D<=T);
I(J)=1;
I=reshape(I,M,N);

function [X,R]=imstack2vectors(S,MASK)
[M,N,n]=size(S);
if nargin==1
    MASK=true(M,N);
else
    MASK=MASK~=0;
end
[I,J]=find(MASK);
R=[I,J];
Q=M*N;
X=reshape(S,Q,n);
MASK=reshape(MASK,Q,1);
X=X(MASK,:);


%%%%%%RGB 图像分割主程序
clear all
clc
f=imread('D:\pic\DIP3E_CH06\Fig0637(a)(caster_stand_original).tif');
mask=roipoly(f);
figure,imshow(mask)%mask 是一幅2 值图像（大小与f 相同）
red=immultiply(mask,f(:,:,1));
figure,imshow(red)
title('red 分量');

green=immultiply(mask,f(:,:,2));
figure,imshow(green)
title('green 分量');

blue=immultiply(mask,f(:,:,3));
figure,imshow(blue)
title('blue 分量');
g=cat(3,red,green,blue);
figure,imshow(g)

%计算ROI 中的点的均值向量和协方差矩阵
[M,N,K]=size(g);
I=reshape(g,M*N,3);
idx=find(mask);
I=double(I(idx,1:3));
[C,m]=covmatrix(I);

d=diag(C);
sd=sqrt(d)'
E25=colorseg('euclidean',f,25,m);
%colorseg('m',f,T,m)T 值可取的值为25 的倍数时得到的不同结果
```



参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）\[M\]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）\[M\]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)





[返回首页](https://github.com/timerring/digital-image-processing-matlab)
