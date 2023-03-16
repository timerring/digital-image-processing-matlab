- [Matlab常用图像处理命令108例（六）](#matlab常用图像处理命令108例六)
  - [66.imshow](#66imshow)
  - [67.imwrite](#67imwrite)
  - [68.ind2gray](#68ind2gray)
  - [69.ind2rgb](#69ind2rgb)
  - [70.iptgetpref](#70iptgetpref)
  - [71.iptsetpref](#71iptsetpref)
  - [72.Iradon](#72iradon)
  - [73.isbw](#73isbw)
  - [74.isgray](#74isgray)
  - [75.isind](#75isind)
  - [76.isrgb](#76isrgb)
  - [77.makelut](#77makelut)
  - [78.mat2gray](#78mat2gray)
  - [79.mean2](#79mean2)
  - [80.medfilt2](#80medfilt2)
  - [81.montage](#81montage)
  - [82.nlfilter](#82nlfilter)
  - [83.ntsc2rgb](#83ntsc2rgb)
  - [84.ordfilt2](#84ordfilt2)
  - [85.phantom](#85phantom)


# Matlab常用图像处理命令108例（六）

## 66.imshow

功能：显示图像。
语法： 

```matlab
imshow(I,n) 
imshow(I,[low high]) 
imshow(BW) 
imshow(X,map) 
imshow(RGB)
imshow(...,display_option) 
imshow(x,y,A,...)
imshow filename 
h = imshow(...) 
```

相关命令： 
getimage, imread, iptgetpref, iptsetpref, subimage, truesize, warp

## 67.imwrite

功能：把图像写入图形文件中。
语法： 

```matlab
imwrite(A,filename,fmt) 
imwrite(X,map,filename,fmt) 
imwrite(...,filename) 
imwrite(...,Param1,Val1,Param2,Val2...) 
```

举例 

```matlab
imwrite(X,map,'flowers.hdf','Compression','none',...
'WriteMode','append') 
```

相关命令： imfinfo, imread

## 68.ind2gray

功能：把检索图像转化为灰度图像。
语法： 

```matlab
I = ind2gray(X,map)
```

举例 

```matlab
load trees
I = ind2gray(X,map); 
imshow(X,map) 
figure,imshow(I)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-51-28-1678546285.png)

相关命令： 
gray2ind, imshow, rgb2ntsc

## 69.ind2rgb

功能：转化索引图像为RGB 真彩图像。
语法： 

```matlab
RGB = ind2rgb(X,map) 
```

相关命令： ind2gray, rgb2ind

## 70.iptgetpref

功能：获取图像处理工具箱参数设置。
语法： 

```matlab
value = iptgetpref(prefname)
```

举例 

```matlab
value = iptgetpref('ImshowAxesVisible') 
value =
off
```

相关命令： 
imshow, iptsetpref

## 71.iptsetpref

功能：设置图像处理工具箱参数。
语法： 

```matlab
iptsetpref(prefname,value)
```

举例

```matlab
iptsetpref('ImshowBorder','tight') 
```

相关命令： 
imshow, iptgetpref, truesize

## 72.Iradon

功能：进行反Radon 变换。
语法： 

```matlab
I = iradon(P,theta)
I = iradon(P,theta,interp,filter,d,n) 
[I,h] = iradon(...)
```

举例 

```matlab
P = phantom(128); 
R = radon(P,0:179);
I = iradon(R,0:179,'nearest','Hann'); 
imshow(P)
figure, imshow(I) 
```

相关命令： radon, phantom

## 73.isbw

功能：判断是否为二进制图像。
语法： 

```matlab
flag = isbw(A)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-51-38-1678546295.png)

相关命令： 
isind, isgray, isrgb

## 74.isgray

功能：判断是否为灰度图像。
语法： 

```matlab
flag = isgray(A)
```

相关命令： 
isbw, isind, isrgb

## 75.isind

功能：判断是否为索引图像。
语法： 

```matlab
flag = isind(A)
```

相关命令： 
isbw, isgray, isrgb

## 76.isrgb

功能：判读是否为RGB真彩图像。 
语法： 

```matlab
flag = isrgb(A)
```

相关命令： 
isbw, isgray, isind

## 77.makelut

功能：创建一个用于applylut 函数的lookup 表。
语法： 

```matlab
lut = makelut(fun,n)
lut = makelut(fun,n,P1,P2,...)
```

举例 

```matlab
f = inline('sum(x(:)) >= 2'); lut = makelut(f,2)
lut = 0
0
0
1
0
1
1
1
0
1
1
1
1
1
1
1
```

相关命令： 
applylut

## 78.mat2gray

功能：转化矩阵为灰度图像。
语法： 

```matlab
I = mat2gray(A,[amin amax]) 
I = mat2gray(A)
```

举例 

```matlab
I = imread('rice.tif');
J = filter2(fspecial('sobel'),I);
K = mat2gray(J);
imshow(I)
figure, imshow(K)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-51-51-1678546307.png)

相关命令： 
gray2ind

## 79.mean2

功能：计算矩阵元素的平均值。
语法： 

```matlab
b = mean2(A) 
```

相关命令： std2, mean, std

## 80.medfilt2

功能：进行二维中值过滤。
语法： 

```matlab
B = medfilt2(A,[m n]) 
B = medfilt2(A)
B = medfilt2(A,'indexed',...)
```

举例 

```matlab
I = imread('eight.tif');
J = imnoise(I,'salt & pepper',0.02);
K = medfilt2(J);
imshow(J)
figure, imshow(K)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-52-01-1678546318.png)

相关命令： 
filter2, ordfilt2, wiener2

## 81.montage

功能：在矩形框中同时显示多幅图像。
语法： 

```matlab
montage(I) 
montage(BW) 
montage(X,map) 
montage(RGB) 
h = montage(...)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-52-11-1678546327.png)

举例 

```matlab
load mri montage(D,map)
```

相关命令： 

immovie

## 82.nlfilter

功能：进行边沿操作。
语法： 

```matlab
B = nlfilter(A,[m n],fun)
B = nlfilter(A,[m n],fun,P1,P2,...)
B = nlfilter(A,'indexed',...)
```

举例 

```matlab
B = nlfilter(A,[3 3],'median(x(:))');
```

相关命令： 
blkproc, colfilt

## 83.ntsc2rgb

功能：转换NTSC 的值为RGB 颜色空间。
语法： 

```matlab
rgbmap = ntsc2rgb(yiqmap) 
RGB = ntsc2rgb(YIQ)
```

相关命令： 
rgb2ntsc, rgb2ind, ind2rgb, ind2gray

## 84.ordfilt2

功能：进行二维统计顺序过滤。
语法： 

```matlab
B = ordfilt2(A,order,domain) 
B = ordfilt2(A,order,domain,S) 
B = ordfilt2(...,padopt)
```

相关命令： 
medfilt2

## 85.phantom

功能：产生一个头部幻影图像。
语法： 

```matlab
P = phantom(def,n) 
P = phantom(E,n) 
[P,E] = phantom(...) 
```

举例 

```matlab
P = phantom('Modified Shepp-Logan',200);
imshow(P)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-52-24-1678546342.png)

相关命令： 
radon, iradon



参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)


[返回首页](https://github.com/timerring/digital-image-processing-matlab)