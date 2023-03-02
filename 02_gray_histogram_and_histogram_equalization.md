- [灰度直方图及直方图均衡化](#灰度直方图及直方图均衡化)
  - [目的](#目的)
  - [内容](#内容)
    - [1.直方图的显示](#1直方图的显示)
    - [2.计算并绘制图像直方图](#2计算并绘制图像直方图)
    - [3.直方图均衡化](#3直方图均衡化)


# 灰度直方图及直方图均衡化

## 目的

1.直方图的显示

2.计算并绘制图像直方图

3.直方图的均衡化

## 内容

灰度直方图用于显示图像的灰度值分布情况,是数字图像处理中最简单和最实用的工具。

MATLAB中提供了专门绘制直方图的函数 `imhist()` 。

### 1.直方图的显示

```matlab
imshow('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif');
title('原图像')
% 显示原图像
A=imread('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif ','tif');
figure;
imhist(A);
title('对应直方图')
```

### 2.计算并绘制图像直方图

A：用 bar 函数显示

```matlab
A=imread('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif ','tif');
h=imhist(A);
h1=h(1:10:256);
horz=1:10:256;
bar(horz,h1)% 用bar 函数显示
axis([0 255 0 15000])% 设置水平轴和垂直轴的最大值和最小值
set(gca,'xtick',0:50:255)
set(gca,'xtick',0:2000:15000)
```

B：用stem 函数显示

```matlab
A=imread('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif ','tif');
h=imhist(A);
h1=h(1:10:256);
horz=1:10:256;
stem(horz,h1,'fill')% 用stem 函数显示
axis([0 255 0 15000])% 设置水平轴和垂直轴的最大值和最小值
set(gca,'xtick',[0:50:255])
set(gca,'xtick',[0:2000:15000])
```

C：用 `plot` 函数显示

```matlab
A=imread('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif ','tif');
h=imhist(A);
plot(h)
axis([0 255 0 15000])% 设置水平轴和垂直轴的最大值和最小值
set(gca,'xtick',[0:50:255])
set(gca,'xtick',[0:2000:15000])
```

### 3.直方图均衡化

```matlab
imshow('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif');
title('原图像')
I=imread('D:\pic\DIP3E_CH02\Fig0221(a)(ctskull-256).tif ','tif');
figure;
imhist(I),title('对应直方图')
% 从得到的直方图可以看出，图像的对比度很低，灰度级集中在70-160 范围内，如果只取
% 这个范围内的灰度，并扩展到[0,255]，则会明显增强图像对比度
J=imadjust(I,[70/255 160/255],[]);
figure;imshow(J),title('经灰度级调整后的图')
figure;imhist(J),title('灰度级调整后的直方图')
% MATLAB 还提供了histeq 函数（自动直方图均衡化）
K=histeq(I);
figure;
imshow(K),title('经直方图均衡化后的图')
figure;
imhist(K),title('直方图均衡化后的直方图')
```



[返回首页](https://github.com/timerring/digital-image-processing-matlab)



