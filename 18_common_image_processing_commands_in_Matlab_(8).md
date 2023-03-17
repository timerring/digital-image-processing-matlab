- [Matlab常用图像处理命令108例（八）](#matlab常用图像处理命令108例八)
  - [98.roifill](#98roifill)
  - [99.roifilt2](#99roifilt2)
  - [100.roipoly](#100roipoly)
  - [101.std2](#101std2)
  - [102.subimage](#102subimage)
  - [103.truesize](#103truesize)
  - [104.uint8](#104uint8)
  - [105.uint16](#105uint16)
  - [106.warp](#106warp)
  - [107.wiener2](#107wiener2)
  - [108.zoom](#108zoom)


# Matlab常用图像处理命令108例（八）

## 98.roifill

功能：在图像的任意区域中进行平滑插补。
语法： 

```matlab
J = roifill(I,c,r) 
J = roifill(I)
J = roifill(I,BW) 
[J,BW] = roifill(...) 
J = roifill(x,y,I,xi,yi)
[x,y,J,BW,xi,yi] = roifill(...)
```

举例 

```matlab
I = imread('eight.tif');
c = [222 272 300 270 221 194];
r = [21 21 75 121 121 75];
J = roifill(I,c,r); 
imshow(I)
figure, imshow(J)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-11-59-1678630315.png)

相关命令： 
roifilt2, roipoly

## 99.roifilt2

功能：过滤敏感区域。
语法： 

```matlab
J = roifilt2(h,I,BW)
J = roifilt2(I,BW,fun)
J = roifilt2(I,BW,fun,P1,P2,...)
```

举例 

```matlab
h = fspecial('unsharp'); 
J = roifilt2(h,I,BW); 
imshow(J)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-12-09-1678630326.png)

相关命令： 
filter2, roipoly

## 100.roipoly

功能：选择一个敏感的多边形区域。
语法： 

```matlab
BW = roipoly(I,c,r)
BW = roipoly(I)
BW = roipoly(x,y,I,xi,yi) 
[BW,xi,yi] = roipoly(...)
[x,y,BW,xi,yi] = roipoly(...)
```

举例 

```matlab
I = imread('eight.tif');
c = [222 272 300 270 221 194];
r = [21 21 75 121 121 75];
BW = roipoly(I,c,r); 
imshow(I)
figure, imshow(BW)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-12-21-1678630338.png)

相关命令： 
roifilt2, roicolor, roifill

## 101.std2

功能：计算矩阵元素的标准偏移。
语法： 

```matlab
b = std2(A) 
```

相关命令： corr2, mean2

## 102.subimage

功能：在一幅图中显示多个图像。
语法：

```matlab
subimage(X,map) 
subimage(I) 
subimage(BW) 
subimage(RGB) 
subimage(x,y,...)
h = subimage(...)
```

举例 

```matlab
load trees
[X2,map2] = imread('forest.tif'); 
subplot(1,2,1), subimage(X,map) 
subplot(1,2,2), subimage(X2,map2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-12-35-1678630349.png)

## 103.truesize

功能：调整图像显示尺寸。
语法： 

```matlab
truesize(fig,[mrows mcols]) 
truesize(fig)
```

相关命令： 
imshow, iptsetpref, iptgetpref

## 104.uint8

功能：转换数据为8 位无符号整型。
语法： 

```matlab
B = uint8(A)
```

举例 

```matlab
a = [1 3 5];
b = uint8(a);
whos
Name Size Bytes Class 
a 1x3 24 doublearray
b 1x3 3 uint8 array
```

相关命令：
double, im2double, im2uint8

## 105.uint16

功能：转换数据为16 位无符号整型。
语法： 

```matlab
I = uint16(X)
```

举例 

```matlab
a = [1 3 5];
b = uint16(a); 
whos
Name Size Bytes Class 
a 1x3 24 double array 
b 1x3 6 uint16 array 
```

相关命令： 
double, datatypes, uint8, uint32, int8, int16, int32.

## 106.warp

功能：将图像显示到纹理映射表面。
语法： 

```matlab
warp(X,map) 
warp(I,n) 
warp(BW) 
warp(RGB) 
warp(z,...)
warp(x,y,z,...) 
h = warp(...) 
```

举例 

```matlab
[x,y,z] = cylinder;
I = imread('testpat1.tif'); 
warp(x,y,z,I);
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-12-49-1678630362.png)

相关命令：
imshow

## 107.wiener2

功能：进行二维适应性去噪过滤处理。
语法： 

```matlab
J = wiener2(I,[m n],noise) 
[J,noise] = wiener2(I,[m n]) 
```

举例 

```matlab
I = imread('saturn.tif');
J = imnoise(I,'gaussian',0,0.005); 
K = wiener2(J,[5 5]);
imshow(J)
figure, imshow(K)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/12-22-13-00-1678630376.png)

相关命令： 
filter2, medfilt2

## 108.zoom

功能：缩放图像。
语法： 

```matlab
zoom on 
zoom off 
zoom out 
zoom reset 
zoom 
zoom xon 
zoom yon
zoom(factor) 
zoom(fig,option)
```

相关命令： 
imcrop  

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)