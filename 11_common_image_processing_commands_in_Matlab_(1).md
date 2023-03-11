- [Matlab常用图像处理命令108例（一）](#matlab常用图像处理命令108例一)
  - [1.applylut](#1applylut)
  - [2.bestblk](#2bestblk)
  - [3.blkproc](#3blkproc)
  - [4.brighten](#4brighten)
  - [5.bwarea](#5bwarea)
  - [6.bweuler](#6bweuler)
  - [7.bwfill](#7bwfill)
  - [8.bwlabel](#8bwlabel)
  - [9.bwmorph](#9bwmorph)
  - [10.bwperim](#10bwperim)


# Matlab常用图像处理命令108例（一）

## 1.applylut

在二进制图像中利用lookup 表进行边沿操作。 

语法： 

```matlab
A = applylut(BW,lut) 
```

举例

```matlab
lut = makelut('sum(x(:)) == 4',2); 

BW1 = imread('text.tif'); 

BW2 = applylut(BW1,lut); 

imshow(BW1) 

figure, imshow(BW2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-08-57-55-1678496273.png)

相关命令： makelut

## 2.bestblk

功能：确定进行块操作的块大小。 

语法：

```matlab
siz = bestblk([m n],k) 

[mb,nb] = bestblk([m n],k) 
```

举例 

```matlab
siz = bestblk([640 800],72) 

siz = 64 50 
```

相关命令： Blkproc

## 3.blkproc

功能：实现图像的显式块操作。 

语法： 

```matlab
B = blkproc(A,[m n],fun) 

B = blkproc(A,[m n],fun,P1,P2,...)

B = blkproc(A,[m n],[mborder nborder],fun,...)

B = blkproc(A,'indexed',...)
```

举例

```matlab
I = imread('alumgrns.tif');

I2 = blkproc(I,[8 8],'std2(x)*ones(size(x))');

imshow(I)

figure, imshow(I2,[]);
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-00-58-1678496456.png)

相关命令：

colfilt, nlfilter,inline

## 4.brighten

功能：增加或降低颜色映像表的亮度。

语法：

```matlab
brighten(beta)
newmap = brighten(beta)
newmap = brighten(map,beta)
brighten(fig,beta)
```

相关命令：

imadjust, rgbplot

## 5.bwarea

功能：计算二进制图像对象的面积。

语法：

```matlab
total = bwarea(BW)
```

举例

```matlab
BW = imread('circles.tif');
imshow(BW);
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-02-37-1678496556.png)

```matlab
bwarea(BW) 

ans = 

15799 
```

相关命令： bweuler, bwperim

## 6.bweuler

功能：计算二进制图像的欧拉数。 

语法： 

```matlab
eul = bweuler(BW,n) 
```

举例 

```matlab
BW = imread('circles.tif'); 

imshow(BW); 

bweuler(BW) 

ans = –2 
```

相关命令： bwmorph, bwperim

## 7.bwfill

功能：填充二进制图像的背景色。

语法：

```matlab
BW2
= bwfill(BW1,c,r,n) BW2 =
bwfill(BW1,n) [BW2,idx] = bwfill(...)

BW2
= bwfill(x,y,BW1,xi,yi,n) [x,y,BW2,idx,xi,yi]
= bwfill(...) BW2 =
bwfill(BW1,'holes',n) [BW2,idx] = bwfill(BW1,'holes',n)
```

举例

```matlab
BW1 =[1 0 0 0 0 0 0 0

1 1 1 1 1 0 0 0

1 0 0 0 1 0 1 0

1 0 0 0 1 1 1 0

1 1 1 1 0 1 1 1

1 0 0 1 1 0 1 0

1 0 0 0 1 0 1 0

1 0 0 0 1 1 1 0]

BW2 = bwfill(BW1,3,3,8) 

BW2 =

1 0 0 0 0 0 0 0

1 1 1 1 1 0 0 0

1 1 1 1 1 0 1 0

1 1 1 1 1 1 1 0

1 1 1 1 0 1 1 1

1 0 0 1 1 0 1 0

1 0 0 0 1 0 1 0

1 0 0 0 1 1 1 0

I = imread('blood1.tif'); BW3
= ~im2bw(I);

BW4
= bwfill(BW3,'holes'); imshow(BW3)

figure, imshow(BW4)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-06-43-2023-03-11-09-06-33-image.png)

相关命令： 
bwselect, roifill

## 8.bwlabel

功能：标注二进制图像中已连接的部分。

语法： 

```matlab
L = bwlabel(BW,n) [L,num] = bwlabel(BW,n) 举例 
BW = [1 1 1 0 0 0 0 0
1 1 1 0 1 1 0 0
1 1 1 0 1 1 0 0
1 1 1 0 0 0 1 0
1 1 1 0 0 0 1 0
1 1 1 0 0 0 1 0
1 1 1 0 0 1 1 0
1 1 1 0 0 0 0 0]
L = bwlabel(BW,4) L =
1 1 1 0 0 0 0 0
1 1 1 0 2 2 0 0
1 1 1 0 2 2 0 0
1 1 1 0 0 0 3 0
1 1 1 0 0 0 3 0

1 1 1 0 0 0 3 0
1 1 1 0 0 3 3 0
1 1 1 0 0 0 0 0
[r,c] = find(L==2); rc = [r c]
rc = 2 5
3 5
2 6
3 6
```

相关命令： 
bweuler, bwselect

## 9.bwmorph

功能：提取二进制图像的轮廓。

语法： 

```matlab
BW2 = bwmorph(BW1,operation) 
BW2 = bwmorph(BW1,operation,n) 
```

举例 

```matlab
BW1 = imread('circles.tif');
imshow(BW1);
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-08-59-1678496938.png)

```matlab
BW2 = bwmorph(BW1,'remove'); 
BW3 = bwmorph(BW1,'skel',Inf); 
imshow(BW2)
figure, imshow(BW3)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-09-26-1678496964.png)

相关命令： 

bweuler, bwperim, dilate, erode

## 10.bwperim

功能：计算二进制图像中对象的周长。

语法： 

```matlab
BW2 = bwperim(BW1,n)
```

举例 

```matlab
BW1 = imread('circbw.tif'); 

BW2 = bwperim(BW1,8); 

imshow(BW1)

figure, imshow(BW2)
```

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/11-09-10-53-1678497051.png)

相关命令： 

bwarea, bweuler, bwfill

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)
