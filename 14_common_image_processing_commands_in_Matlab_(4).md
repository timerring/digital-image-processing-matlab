# Matlab常用图像处理命令108例（四）

## 37.fwind1

功能：用一维窗口方法设计二维FIR 过滤器。
语法： 

```
h = fwind1(Hd,win)
h = fwind1(Hd,win1,win2) 
h = fwind1(f1,f2,Hd,...) 
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
conv2, filter2, fsamp2, freqspace, ftrans2, fwind2

## 38.fwind2

功能：用二维窗口方法设计二维FIR 过滤器。
语法： 

```matlab
h = fwind2(Hd,win)
h = fwind2(f1,f2,Hd,win)
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
conv2, filter2, fsamp2, freqspace, ftrans2, fwind1

## 39.getimage

功能：从坐标轴取得图像数据。
语法： 

```matlab
A = getimage(h) 
[x,y,A] = getimage(h)
[...,A,flag] = getimage(h) 
[...] = getimage
```

举例

```matlab
imshow rice.tif I = getimage;
```

## 40.gray2ind

功能：转换灰度图像为索引图像。
语法： 

```matlab
[X,map] = gray2ind(I,n) 
```

相关命令： ind2gray

## 41.grayslice

功能：从灰度图像创建索引图像。
语法： 

```matlab
X = grayslice(I,n) 
X = grayslice(I,v) 
```

举例 

```matlab
I = imread('ngc4024m.tif');
X = grayslice(I,16); 
imshow(I)
figure, imshow(X,jet(16))
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-29-15-1678544950.png)

相关命令： gray2ind

## 42.histeq

功能：用柱状图均等化增强对比。
语法： 

```matlab
J = histeq(I,hgram) 
J = histeq(I,n) 
[J,T] = histeq(I,...) 
```

举例 

```matlab
I = imread('tire.tif');
J = histeq(I); 
imshow(I)
figure, imshow(J)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-30-05-1678545004.png)

```matlab
imhist(I,64)
figure; imhist(J,64)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-30-17-1678545014.png)

相关命令： 
brighten, imadjust, imhist

## 43.hsv2rgb

功能：转换HSV 值为RGB 颜色空间。
语法： 

```matlab
rgbmap = hsv2rgb(hsvmap) 
RGB = hsv2rgb(HSV)
```

相关命令： rgb2hsv, rgbplot

## 44.idct2

功能：计算二维离散反余弦变换。
语法： 

```matlab
B = idct2(A)
B = idct2(A,m,n) 
B = idct2(A,[m n])
```

相关命令： 
dct2, dctmtx, fft2, ifft2

## 45.ifft2

功能：计算二维快速傅里叶反变换。
语法： 

```matlab
B = ifft2(A)
B = ifft2(A,m,n)
```

相关命令： 
fft2, fftshift, idct2

## 46.ifftn

功能：计算n 维快速傅里叶反变换。
语法： 

```matlab
B = ifftn(A)
B = ifftn(A,siz) 
```

相关命令： fft2, fftn, ifft2

## 47.sim2bw

功能：转换图像为二进制图像。
语法： 

```matlab
BW = im2bw(I,level)
BW = im2bw(X,map,level) 
BW = im2bw(RGB,level) 
```

举例 

load trees
BW = im2bw(X,map,0.4); 
imshow(X,map)
figure, imshow(BW)

相关命令： 
ind2gray, rgb2gray

## 48.im2col

功能：重调图像块为列。语法： 

```matlab
B = im2col(A,[m n],block_type) 
B = im2col(A,[m n])
B = im2col(A,'indexed',...)
```

相关命令： 
blkproc, col2im, colfilt, nlfilter

## 49.im2double

功能：转换图像矩阵为双精度型。 
语法： 

```matlab
I2 = im2double(I1)
RGB2 = im2double(RGB1) 
BW2 = im2double(BW1)
X2 = im2double(X1,'indexed')
```

相关命令： 
double, im2uint8, uint8

## 50.im2uint8

功能：转换图像阵列为8 位无符号整型。
语法： 

```matlab
I2 = im2uint8(I1)
RGB2 = im2uint8(RGB1) 
BW2 = im2uint8(BW1)
X2 = im2uint8(X1,'indexed')
```

相关命令： 
im2uint16, double, im2double, uint8, imapprox, uint16

## 51.im2uint16

功能：转换图像阵列为16 位无符号整型。
语法： 

```matlab
I2 = im2uint16(I1)
RGB2 = im2uint16(RGB1) 
X2 = im2uint16(X1,'indexed')
```

相关命令： 
im2uint8, double, im2double, uint8, uint16, imapprox

## 52.imadjust

功能：调整图像灰度值或颜色映像表。
语法： 

```matlab
J = imadjust(I,[low high],[bottom top],gamma)
newmap = imadjust(map,[low high],[bottom top],gamma) 
RGB2 = imadjust(RGB1,...)
```

举例 

```matlab
I = imread('pout.tif');
J = imadjust(I,[0.3 0.7],[]); imshow(I)
figure, imshow(J)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-32-27-1678545144.png)

相关命令： brighten, histeq

## 53.imapprox

功能：对索引图像进行近似处理。
语法： 

```matlab
[Y,newmap] = imapprox(X,map,n) 
[Y,newmap] = imapprox(X,map,tol) 
Y = imapprox(X,map,newmap)
[...] = imapprox(...,dither_option)
```

相关命令： 
cmunique, dither, rgb2ind

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
