# 图像的傅立叶变换

## 目的

1.掌握二维 DFT 变换及其物理意义

2.掌握二维 DFT 变换的MATLAB 程序

3.空域滤波与频域滤波

## 原理

### 1.应用傅立叶变换进行图像处理

傅里叶变换是线性系统分析的一个有力工具，它能够定量地分析诸如数字化系统、采样点、电子放大器、卷积滤波器、噪音和显示点等的作用。通过实验培养这项技能，将有助于解决大多数图像处理问题。对任何想在工作中有效应用数字图像处理技术的人来说，把时间用在学习和掌握博里叶变换上是很有必要的。

### 2.傅立叶（Fourier）变换的定义

对于二维信号，二维Fourier 变换定义为：
$$
F(u, v)=\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} f(x, y) e^{-j 2 \pi (u x+vy)} d x d y
$$
逆变换：
$$
f(x, y)=\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} F(u d, v) e^{j 2 \pi (u x+vy) } d u d v
$$
二维离散傅立叶变换为：
$$
F(u, v)=\sum_{x=0}^{M-1} \sum_{y=0}^{N-1} f(x, y) e^{-j 2 \pi(\frac{\mathrm{ux}}{\mathrm{M}}+\frac{v y}{N})}
$$
逆变换：
$$
f(x, y)=\frac{1}{M N} \sum_{u=0}^{M-1} \sum_{v=0}^{N-1} F(u, v) e^{j 2 \pi(\frac{\mathrm{ux}}{M}+\frac{v y}{N})}
$$
图像的傅立叶变换与一维信号的傅立叶变换变换一样，有快速算法，具体参见参考书目，有关傅立叶变换的快速算法的程序不难找到。实际上，现在有实现傅立叶变换的芯片，可以实时实现傅立叶变换。

## 利用MATLAB 实现数字图像的傅立叶变换

A．

```matlab
I=imread('D:\pic\DIP3E_CH03\Fig0316(3)(third_from_top).tif'); %读入原图像文件
imshow(I); %显示原图像
fftI=fft2(I); %二维离散傅立叶变换
sfftI=fftshift(fftI); %直流分量移到频谱中心
RR=real(sfftI); %取傅立叶变换的实部
II=imag(sfftI); %取傅立叶变换的虚部
A=sqrt(RR.^2+II.^2);%计算频谱幅值
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225; %归一化
figure %设定窗口
imshow(A); %显示原图像的频谱
```

B．

傅立叶变换在图像处理，特别是在图像增强、复原和压缩中，扮演着非常重要的作用。实际中一般采用一种叫做快速傅立叶变换（FFT）的方法，MATLAB 中的fft2 指令用于得到二维FFT 的结果，ifft2 指令用于得到二维FFT 逆变换的结果。

近似冲击函数的二维快速傅立叶变换（FFT）

```matlab
x=1:99;y=1:99;
[X,Y]=meshgrid(x,y);
A=zeros(99,99);
A(49:51,49:51)=1;
B=fft2(A);
subplot(1,2,1),imshow(A),xlabel('空域图象');
subplot(1,2,2),imshow(B),xlabel('时域图象');
figure
subplot(1,2,1),mesh(X,Y,A),xlabel('空域'),grid on;
subplot(1,2,2),mesh(X,Y,abs(B)),xlabel('时域'),grid on;
```

## 空域滤波与频域滤波

```matlab
% 用于频域滤波的m函数
function g=dftfilt(f,H)
F=fft2(f,size(H,1),size(H,2));
g=real(ifft2(H.*F));
g=g(1:size(f,1),1:size(f,2));

%
function PQ=paddedsize(AB,CD,PARAM)
if nargin==1
PQ=2*AB;
elseif nargin ==2 & ~ischar(CD)
PQ=AB+CD-1;
PQ=2*ceil(PQ/2);
elseif nargin == 2
m=max(AB);
P=2^nextpow2(2*m);
PQ=[P,P];
elseif nargin == 3
m=max([AB CD]);
P=2^nextpow2(2*m);
PQ=[P,P];
else
error('Wrong number of inputs')
end


%图像f的傅里叶频谱
f=imread(' D:\pic\DIP3E_CH04\Fig0438(a)(bld_600by600).tif');
F=fft2(f);
S=fftshift(log(1+abs(F)));
%S=gscale(S);
% gscale 函数参照  function g=gscale(f,varargin)
imshow(S)

%使用函数fspecial生成空间滤波器
h=fspecial(‘sobel’)
freqz2(h) %查看相应频域滤波器图形
PQ=paddedsize(size(f));
H=freqz2(h,PQ(1),PQ(2));
H1=ifftshift(H);

imshow(abs(H),[])
figure,imshow(abs(H1),[])

gs=imfilter(double(f),h);% 生成滤波后的图像，并默认采用了0进行边界填
充
gf=dftfilt(f,H1);

imshow(gs,[])
figure,imshow(gf,[])

figure,imshow(abs(gs),[])
figure,imshow(abs(gf),[])

%创建一幅阀值2值图像
figure,imshow(abs(gs)>0.2*abs(max(gs(:))))
figure,imshow(abs(gf)>0.2*abs(max(gf(:))))
d=abs(gs-gf);
max(d(:))
min(d(:))
```



参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）\[M\]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）\[M\]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
