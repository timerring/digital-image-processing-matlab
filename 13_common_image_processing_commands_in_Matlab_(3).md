- [Matlab常用图像处理命令108例（三）](#matlab常用图像处理命令108例三)
  - [26.edge](#26edge)
  - [27.erode](#27erode)
  - [28.fft2](#28fft2)
  - [29.fftn](#29fftn)
  - [30.fftshift](#30fftshift)
  - [31.filter2](#31filter2)
  - [32.freqspace](#32freqspace)
  - [33.freqz2](#33freqz2)
  - [34.fsamp2](#34fsamp2)
  - [35.fspecial](#35fspecial)
  - [36.ftrans2](#36ftrans2)


# Matlab常用图像处理命令108例（三）

## 26.edge

功能：识别强度图像中的边界。

语法： 

```matlab
BW = edge(I,'sobel')
BW = edge(I,'sobel',thresh)
BW = edge(I,'sobel',thresh,direction) 
[BW,thresh] = edge(I,'sobel',...)
BW = edge(I,'prewitt')
BW = edge(I,'prewitt',thresh)
BW = edge(I,'prewitt',thresh,direction) 
[BW,thresh] = edge(I,'prewitt',...)
BW = edge(I,'roberts')
BW = edge(I,'roberts',thresh) 
[BW,thresh] = edge(I,'roberts',...) 
BW = edge(I,'log')
BW = edge(I,'log',thresh)
BW = edge(I,'log',thresh,sigma) 
[BW,threshold] = edge(I,'log',...) 
BW = edge(I,'zerocross',thresh,h) 
[BW,thresh] = edge(I,'zerocross',...) 
BW = edge(I,'canny')
BW = edge(I,'canny',thresh)
BW = edge(I,'canny',thresh,sigma) 
[BW,threshold] = edge(I,'canny',...) 
```

举例 

```matlab
I = imread('rice.tif');
BW1 = edge(I,'prewitt'); 
BW2 = edge(I,'canny'); 
imshow(BW1);
figure, imshow(BW2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-16-12-1678544168.png)

## 27.erode

功能：弱化二进制图像的边界。

语法：

```matlab
BW2 = erode(BW1,SE)
BW2 = erode(BW1,SE,alg) 
BW2 = erode(BW1,SE,...,n)
```

举例 

```matlab
BW1 = imread('text.tif'); 
SE = ones(3,1);
BW2 = erode(BW1,SE);
imshow(BW1)
figure, imshow(BW2) 
```

相关命令： bwmorph, dilate

## 28.fft2

功能：进行二维快速傅里叶变换。

语法： 

```matlab
B = fft2(A)
B = fft2(A,m,n)
```

举例 

```matlab
load imdemos saturn2 
imshow(saturn2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-16-56-1678544214.png)

```matlab
B = fftshift(fft2(saturn2));
imshow(log(abs(B)),[]), colormap(jet(64)), colorbar
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-17-25-1678544244.png)

相关命令： 
dct2, fftshift, idct2, ifft2

## 29.fftn

功能：进行n 维快速傅里叶变换。
语法： 

```matlab
B = fftn(A)
B = fftn(A,siz) 相关命令： fft2, ifftn
```

## 30.fftshift

功能：把快速傅里叶变换的DC 组件移到光谱中心。
语法：

```matlab
B = fftshift(A)
```

举例 

```matlab
B = fftn(A);
C = fftshift(B);
```

相关命令： 
fft2, fftn, ifftshift

## 31.filter2

功能：进行二维线性过滤操作。
语法：

```matlab
B = filter2(h,A)
B = filter2(h,A,shape)
```

举例 

```matlab
A = magic(6) 
A =
35 1 6 26 19 24
3 32 7 21 23 25
31 9 2 22 27 20
8 28 33 17 10 15
30 5 34 12 14 16
4 36 29 13 18 11
h = fspecial('sobel') 
h =
1 2 1
0 0 0
–1 –2 –1
B = filter2(h,A,'valid') 
B =
–8 4 4 –8
–23 –44 –5 40
–23 –50 1 40
–8 4 4 –8
```

相关命令： 
conv2, roifilt2

## 32.freqspace

功能：确定二维频率响应的频率空间。
语法： 

```matlab
[f1,f2] = freqspace(n) 
[f1,f2] = freqspace([m n])
[x1,y1] = freqspace(...,'meshgrid') 
f = freqspace(N)
f = freqspace(N,'whole')
```

相关命令： 
fsamp2, fwind1, fwind2

## 33.freqz2

功能：计算二维频率响应。
语法： 

```matlab
[H,f1,f2] = freqz2(h,n1,n2)
[H,f1,f2] = freqz2(h,[n2 n1])
[H,f1,f2] = freqz2(h,f1,f2)
[H,f1,f2] = freqz2(h)
[...] = freqz2(h,...,[dx dy])
[...] = freqz2(h,...,dx) 
freqz2(...)
```

举例 

```matlab
Hd = zeros(16,16); 
Hd(5:12,5:12) = 1;
Hd(7:10,7:10) = 0;
h = fwind1(Hd,bartlett(16)); 
colormap(jet(64))
freqz2(h,[32 32]); 
axis ([–1 1 –1 1 0 1])
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-20-26-1678544423.png)

## 34.fsamp2

功能：用频率采样法设计二维FIR 过滤器。
语法： 

```matlab
h = fsamp2(Hd)
h = fsamp2(f1,f2,Hd,[m n])
```

举例

```matlab
[f1,f2] = freqspace(21,'meshgrid'); 
Hd = ones(21);
r = sqrt(f1.^2 + f2.^2); 
Hd((r<0.1)|(r>0.5)) = 0;
colormap(jet(64)) 
mesh(f1,f2,Hd)
```

相关命令： 
conv2, filter2, freqspace, ftrans2, fwind1, fwind2

## 35.fspecial

功能：创建预定义过滤器。
语法： 

```matlab
h = fspecial(type)
h = fspecial(type,parameters)
```

举例 

```matlab
I = imread('saturn.tif');
h = fspecial('unsharp',0.5); 
I2 = filter2(h,I)/255; 
imshow(I)
figure, imshow(I2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-21-26-1678544485.png)

相关命令： 
conv2, edge, filter2, fsamp2, fwind1, fwind2

## 36.ftrans2

功能：通过频率转换设计二维FIR 过滤器。

语法：

```matlab
h = ftrans2(b,t) h = ftrans2(b) 
```

举例 

```matlab
colormap(jet(64))
b = remez(10,[0 0.05 0.15 0.55 0.65 1],[0 0 1 1 0 0]);
[H,w] = freqz(b,1,128,'whole'); 
plot(w/pi–1,fftshift(abs(H)))
```

相关命令：

conv2, filter2, fsamp2, fwind1, fwind2

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
