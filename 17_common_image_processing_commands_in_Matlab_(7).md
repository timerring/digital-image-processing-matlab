- [Matlab常用图像处理命令108例（七）](#matlab常用图像处理命令108例七)
  - [86.pixval](#86pixval)
  - [87.qtdecomp](#87qtdecomp)
  - [88.qtgetblk](#88qtgetblk)
  - [89.qtsetblk](#89qtsetblk)
  - [90.radon](#90radon)
  - [91.rgb2gray](#91rgb2gray)
  - [92.rgb2hsv](#92rgb2hsv)
  - [93.rgb2ind](#93rgb2ind)
  - [94.rgb2ntsc](#94rgb2ntsc)
  - [95.rgb2ycbcr](#95rgb2ycbcr)
  - [96.rgbplot](#96rgbplot)
  - [97.roicolor](#97roicolor)


# Matlab常用图像处理命令108例（七）

## 86.pixval

功能：显示图像像素信息。
语法： 

```matlab
pixval on pixval off pixval
pixval(fig,option) 
```

相关命令： impixel, improfile

## 87.qtdecomp

功能：进行四叉树分解。
语法： 

```matlab
S = qtdecomp(I)
S = qtdecomp(I,threshold)
S = qtdecomp(I,threshold,mindim)
S = qtdecomp(I,threshold,[mindim maxdim]) 
S = qtdecomp(I,fun)
S = qtdecomp(I,fun,P1,P2,...)
```

举例 

```matlab
I = [1 1 1 1 2 3 6 6
1 1 2 1 4 5 6 8
1 1 1 1 10 15 7 7
1 1 1 1 20 25 7 7
20 22 20 22 1 2 3 4
20 22 22 20 5 6 7 8
20 22 20 20 9 10 11 12
22 22 20 20 13 14 15 16];
S = qtdecomp(I,5); full(S)
ans =
4 0 0 0 2 0 2 0
0 0 0 0 0 0 0 0
0 0 0 0 1 1 2 0
0 0 0 0 1 1 0 0
4 0 0 0 2 0 2 0
0 0 0 0 0 0 0 0
0 0 0 0 2 0 2 0
0 0 0 0 0 0 0 0
```

相关命令： 
qtgetblk, qtsetblk

## 88.qtgetblk

功能：获取四叉树分解中的块值。
语法： 

```matlab
[vals,r,c] = qtgetblk(I,S,dim) 
[vals,idx] = qtgetblk(I,S,dim) 
```

举例 

```matlab
[vals,r,c] = qtgetblk(I,S,4)
vals(:,:,1) = 1 1 1 1
1 1 2 1
1 1 1 1
1 1 1 1
vals(:,:,2) = 20 22 20 22
20 22 22 20

20 22 20 20
22 22 20 20
r = 1
5
c = 1
1
```

相关命令： 
qtdecomp, qtsetblk

## 89.qtsetblk

功能：设置四叉树分解中的块值。
语法： 

```matlab
J = qtsetblk(I,S,dim,vals)
```

举例 

```matlab
newvals = cat(3,zeros(4),ones(4)); 
J = qtsetblk(I,S,4,newvals)
J =
0 0 0 0 2 3 6 6
0 0 0 0 4 5 6 8
0 0 0 0 10 15 7 7
0 0 0 0 20 25 7 7
1 1 1 1 1 2 3 4
1 1 1 1 5 6 7 8
1 1 1 1 9 10 11 12
1 1 1 1 13 14 15 16
```

相关命令： 
qtdecomp, qtgetblk

## 90.radon

功能：计算Radon变换。
语法： 

```matlab
R = radon(I,theta) 
R = radon(I,theta,n) 
[R,xp] = radon(...) 
```

举例 

```matlab
iptsetpref('ImshowAxesVisible','on')
I = zeros(100,100); 
I(25:75,25:75) = 1;
theta = 0:180;
[R,xp] = radon(I,theta);
imshow(theta,xp,R,[]), colormap(hot), colorbar
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-59-29-1678546764.png)

相关命令： 
iradon, phantom

## 91.rgb2gray

功能：转换RGB 图像或颜色映像表为灰度图像。
语法： 

```matlab
I = rgb2gray(RGB) 
newmap = rgb2gray(map) 
```

相关命令： 
ind2gray, ntsc2rgb, rgb2ind, rgb2ntsc

## 92.rgb2hsv

功能： 
转化RGB值为HSV颜色空间。
语法： 

```matlab
hsvmap = rgb2hsv(rgbmap) 
HSV = rgb2hsv(RGB)
```

相关命令： 
hsv2rgb, rgbplot

## 93.rgb2ind

功能：转化RGB图像为索引图像。
语法： 

```matlab
[X,map] = rgb2ind(RGB,tol) 
[X,map] = rgb2ind(RGB,n) 
X = rgb2ind(RGB,map)
[...] = rgb2ind(...,dither_option)
```

举例 

```matlab
RGB = imread('flowers.tif'); 
[X,map] = rgb2ind(RGB,128); 
imshow(X,map)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-59-40-1678546776.png)

相关命令： 
cmunique, dither, imapprox, ind2rgb, rgb2gray

## 94.rgb2ntsc

功能：转化RGB的值为NTSC颜色空间。
语法： 

```matlab
yiqmap = rgb2ntsc(rgbmap) 
YIQ = rgb2ntsc(RGB)
```

相关命令： 
ntsc2rgb, rgb2ind, ind2rgb, ind2gray

## 95.rgb2ycbcr

功能：转化RGB的值为YcbCr 颜色空间。
语法： 

```matlab
ycbcrmap = rgb2ycbcr(rgbmap) 
YCBCR = rgb2ycbcr(RGB)
```

相关命令： 
ntsc2rgb, rgb2ntsc, ycbcr2rgb

## 96.rgbplot

功能：划分颜色映像表。
语法： 

```matlab
rgbplot(map) 
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-22-59-57-1678546792.png)

举例rgbplot(jet)

## 97.roicolor

功能：选择感兴趣的颜色区。
语法： 

```matlab
BW = roicolor(A,low,high) 
BW = roicolor(A,v)
```

举例 

```matlab
I = imread('rice.tif');
BW = roicolor(I,128,255); 
imshow(I);
figure, imshow(BW)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-23-00-07-1678546804.png)

相关命令： roifilt2, roipoly



参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)