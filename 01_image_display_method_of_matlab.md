- [MATLAB的图像显示方法](#matlab的图像显示方法)
    - [目的](#目的)
    - [内容](#内容)
      - [(1)单位冲击响应序列](#1单位冲击响应序列)
      - [(2)单位阶跃序列](#2单位阶跃序列)
      - [(3)正弦序列](#3正弦序列)
      - [(4)指数序列](#4指数序列)
      - [(5)复指数序列](#5复指数序列)
    - [1.图像的读](#1图像的读)
    - [2.图像显示](#2图像显示)
      - [(1)图像显示](#1图像显示)
      - [(2)同屏显示多个图像](#2同屏显示多个图像)
    - [3.数字图像处理中常用到的MATLAB函数](#3数字图像处理中常用到的matlab函数)


# MATLAB的图像显示方法

### 目的

1. 了解 MATLAB 的基本功能及操作方法。
2. 掌握典型离散信号的 Matlab 产生和显示。 

### 内容

在 MATLAB 中, 序列是用矩阵向量表示, 但它没有包含采样信息, 即序列位置信息, 为 此, 要表示一个序列需要建立两个向量; 一是时间序列  n , 或称位置序列, 另一个为取值序 列  x  ，表示如下:  $n=[\cdots,-3,-2,-1,0,1,2,3, \cdots]$ ，$\mathrm{x}=[\cdots, 6,3,5,2,1,7,9, \cdots]$

一般程序都从 0 位置起始, 则  $x=[x(0), x(1), x(2), \cdots]$  对于多维信号需要建立矩阵来表示, 矩阵的每个列向量代表一维信号。

数字信号处理中常用的信号有指数信号、正弦信号、余弦信号、方波信号、锯齿波信号 等, 在 MATLAB 语言中分别由 exp, sin, cos, square, sawtooth 等函数来实现。

1.用 MATLAB 编制程序, 分别产生长度为  $\mathrm{N}$  (由输入确定) 的序列:

#### (1)单位冲击响应序列

可用 MATLAB 中 zeros 函数来实现;

```matlab
t=-20:1:20;
X=zeros(size (t)) ;
X(21)=1;
plot(t,x);
```

#### (2)单位阶跃序列

U(n)  可用 MATLAB 中 ones 函数来实现;

```matlab
t=-20:1:20;
X=zeros (size (t)) ;
x (21:41)=ones (1,21);
plot(t,x);
```

#### (3)正弦序列

$\quad x(n)=\sin (\omega n)$  ；

```matlab
N0=20;
w=0.5;
n=-N0:0.5:N0;
y=sin (w*n);
plot (n, y);
```

#### (4)指数序列

$x(n)=a^{n},-\infty<n<+\infty$ 

```matlab
N0=20 ;
a=1.1;
n=-N0:2:N0 ;
X=a.^n;
plot (n,x);
```

#### (5)复指数序列

用  exp  函数实现  $K_{0} e^{(a+j b) n}$ , 并给出该复指数序列的实部、虚部、幅 值和相位的图形。(其中  a=-0.2 ; b=0.5 ; K0=4 ; N=40.)


$K_{0} e^{(a+j b) n}=K_{0} e^{a n}(\cos (b n)+j \sin (b n))$

```matlab
a=-0.2;
b=0.5;
K0=4;
N=40;
n=-N:1:N;
t=K0*exp.^(a+j*b)*n ;
```

流程图：

![](https://raw.githubusercontent.com/timerring/picgo/master/picbed/image-20230301094157686.png)

在计算机上实现正弦序列 $x(n)=A_{0} \sin (2 \pi f n+\varphi)$

```matlab
A0=-0.2;
f=0.05;
pi=3.14;
K0=2/3*pi;
N=40;
n=-N:1:N;
x=A0*sin(2*pi*f*n+K0);
plot(n,x)
```


1.练习图像读写和显示函数的使用方法

2.掌握MATLAB支持的五类图像显示方法

3.数字图像处理中常用到的MATLAB函数



### 1.图像的读

```matlab
RGB=imread('D:\pic\DIP3E_CHO1\Fig0101(1921 digital image).tif);
```

### 2.图像显示

#### (1)图像显示

```matlab
f=imread('D:\pic\DIP3E_CHO1\Fig0101(1921 digital image).tif');
whos f
imshow(f)
[m,n]=size(f)%显示图像的大小
```

#### (2)同屏显示多个图像

可用subplot(m,n)将图形窗分为m*n个子窗口，然后取第一、第二...子窗口显示不同的图像，实现同屏显示多个图像。例如:

```matlab
figure(1);
%取2×2个子屏中的第一个子屏
subplot (2,2,1);
%显示第一个图像
imshow(Il);
%取2×2个子屏中的第四个子屏
subplot(2,2,4);
%显示第四个图像
imshow(I4);
```

### 3.数字图像处理中常用到的MATLAB函数

size ()函数

Zeros ()函数

Fft2(), ifft2()函数

Imhist()函数

Histeq()函数

Imrotate()函数

Imnoise()函数

Edge()函数

Title()函数

Xlable(), Ylable()函数





参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）\[M\]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）\[M\]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)

