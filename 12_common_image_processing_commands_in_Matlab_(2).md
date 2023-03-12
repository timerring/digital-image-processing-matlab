# Matlab常用图像处理命令108例（二）

## 11.bwselect

功能：在二进制图像中选择对象。语法： 

```matlab
BW2 = bwselect(BW1,c,r,n) 

BW2 = bwselect(BW1,n) 

[BW2,idx] = bwselect(...) 
```

举例 

```matlab
BW1 = imread('text.tif');

c = [16 90 144];

r = [85 197 247];

BW2 = bwselect(BW1,c,r,4);

imshow(BW1)

figure, imshow(BW2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-21-47-14-1678542432.png)

相关命令： 

bwfill, bwlabel, impixel, roipoly, roifill

## 12.cmpermute

功能：调整颜色映像表中的颜色。

语法： 

```matlab
[Y,newmap] = cmpermute(X,map) 

[Y,newmap] = cmpermute(X,map,index)
```

举例 

```matlab
To order a colormap by luminance, use:

ntsc = rgb2ntsc(map);

[dum,index] = sort(ntsc(:,1));

[Y,newmap] = cmpermute(X,map,index);
```

相关命令： randperm

## 13.cmunique

功能：查找颜色映像表中特定的颜色及相应的图像。语法：

```matlab
[Y,newmap] = cmunique(X,map) 

[Y,newmap] = cmunique(RGB) 

[Y,newmap] = cmunique(I)
```

相关命令： 
gray2ind, rgb2ind

## 14.col2im

功能：将矩阵的列重新组织到块中。语法： 

```matlab
A = col2im(B,[m n],[mm nn],block_type)
A = col2im(B,[m n],[mm nn])
```

相关命令： 
blkproc, colfilt, im2col, nlfilter

## 15.colfilt

利用列相关函数进行边沿操作。语法： 

```matlab
B = colfilt(A,[m n],block_type,fun)
B = colfilt(A,[m n],block_type,fun,P1,P2,...)
B = colfilt(A,[m n],[mblock nblock],block_type,fun,...) 
B = colfilt(A,'indexed',...)
```

相关命令： 
blkproc, col2im, im2col, nlfilter

## 16.colorbar

功能：显示颜色条。语法：

```matlab
colorbar('vert') 

colorbar('horiz') 

colorbar(h) 

colorbar
h = colorbar(...)
```

举例 

```matlab
I = imread('blood1.tif'); 

h = fspecial('log');
I2 = filter2(h,I);
imshow(I2,[]), colormap(jet(64)), colorbar
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-21-51-45-1678542704.png)

## 17.conv2

功能：进行二维卷积操作。语法：

```matlab
C = conv2(A,B)
C = conv2(hcol,hrow,A) 
C = conv2(...,shape)
```

举例 

```matlab
A = magic(5)

A =
17 24 1 8 15

23 5 7 14 16
4 6 13 20 22
10 12 19 21 3
11 18 25 2 9
B = [1 2 1;0 2 0;3 1 3] 

B =
1 2 1
0 2 0
3 1 3
C = conv2(A,B) 

C =
17 58 66 34 32 38 15
23 85 88 35 67 76 16
55 149 117 163 159 135 67
79 78 160 161 187 129 51
23 82 153 199 205 108 75
30 68 135 168 91 84 9
33 65 126 85 104 15 27
```

相关命令： 
filter2

## 18.convmtx2

功能：计算二维卷积矩阵。语法： 

```matlab
T = convmtx2(H,m,n) 

T = convmtx2(H,[m n])
```

相关命令： 
conv2

## 19.convn

功能：计算n 维卷积。

语法： 

```matlab
C = convn(A,B)
C = convn(A,B,shape) 
```

相关命令： conv2

## 20.corr2

功能：计算两个矩阵的二维相关系数。

语法： 

```matlab
r = corr2(A,B) 
```

相关命令： std2

## 21.dct2

功能：进行二维离散余弦变换。语法： 

```matlab
B = dct2(A)
B = dct2(A,m,n)
B = dct2(A,[m n])
```

举例 

```matlab
RGB = imread('autumn.tif'); 
I = rgb2gray(RGB);
J = dct2(I);
imshow(log(abs(J)),[]), colormap(jet(64)), colorbar
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-21-54-41-1678542880.png)

```matlab
J(abs(J) < 10) = 0;
K = idct2(J)/255; 
imshow(K)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-21-55-13-1678542912.png)

相关命令： 
fft2, idct2, ifft2

## 22.dctmtx

功能：计算离散余弦变换矩阵。
语法： 

```matlab
D = dctmtx(n) 
```

相关命令： dct2

## 23.dilate

功能：放大二进制图像。语法： 

```matlab
BW2 = dilate(BW1,SE)
BW2 = dilate(BW1,SE,alg) BW2 = dilate(BW1,SE,...,n)
```

举例 

```matlab
BW1 = imread('text.tif'); 
SE = ones(6,2);
BW2 = dilate(BW1,SE); 
imshow(BW1)
figure, imshow(BW2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-21-56-56-1678543010.png)

相关命令： 
bwmorph, erode

## 24.dither

功能：通过抖动增加外观颜色分辨率，转换图像。
语法：

```matlab
X = dither(RGB,map) 
BW = dither(I)
```

相关命令： 
rgb2ind

## 25.double

功能：转换数据为双精度型。
语法： 

```matlab
B = double(A)
```

举例 

```matlab
A = imread('saturn.tif'); 
B = sqrt(double(A));
```

相关命令：
im2double, im2uint, uint8

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
