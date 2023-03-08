- [Matlab实现形态学图像处理](#matlab实现形态学图像处理)
  - [目的](#目的)
  - [内容](#内容)
    - [膨胀的简单应用](#膨胀的简单应用)
    - [函数imopen 和imclose 的应用](#函数imopen-和imclose-的应用)
    - [灰度图像形态学开运算和闭运算](#灰度图像形态学开运算和闭运算)
    - [灰度图像形态学使用重构删除复杂图像的背景](#灰度图像形态学使用重构删除复杂图像的背景)


# Matlab实现形态学图像处理

## 目的

1. 膨胀的简单应用、使用 strel 函数、腐蚀的说明

2. 函数imopen 和imclose 的应用、使用IPT函数bwhitmiss

3. 灰度图像形态学开运算和闭运算

4. 灰度图像形态学使用重构删除复杂图像的背景

## 内容

### 膨胀的简单应用

```matlab
A=imread('D:\pic\DIP3E_CH04\Fig0419(a)(text_gaps_of_1_and_2_pixels).tif');
figure, imshow(A)
B=[0 1 0;1 1 1;0 1 0];
A2=imdilate(A,B);
figure,imshow(A2)
```

使用 strel 函数分解结构元素的说明

```matlab
se=strel('diamond',5)
decomp=getsequence(se);
whos
decomp(1)
decomp(2)
decomp(3)
decomp(4)
```

腐蚀的说明

```matlab
A=imread('D:\pic\DIP3E_CH09\Fig0905(a)(wirebond-mask).tif');
figure, imshow(A)%原图像
se=strel('disk',10)
A2=imerode(A,se)
figure, imshow(A2)%半径为10 的圆盘腐蚀后的图像
se=strel('disk',5)
A3=imerode(A,se)
figure, imshow(A3)%半径为5 的圆盘腐蚀后的图像
A4=imerode(A,strel('disk',20))
figure, imshow(A4)%半径为20 的圆盘腐蚀后的图像
```

### 函数imopen 和imclose 的应用

```matlab
f=imread('D:\pic\DIP3E_CH09\Fig0905(a)(wirebond-mask).tif');
figure, imshow(f)%原图像
se=strel('square',20);
fo=imopen(f,se);
figure, imshow(fo)%开运算后的图像
fc=imclose(f,se);
figure, imshow(fc)%闭运算后的图像
foc=imclose(fo,se);
figure, imshow(foc)%图像A2 经闭运算后的图像
```

使用 IPT 函数bwhitmiss

```matlab
f=imread('D:\pic\DIP3E_CH09\FigP0918(left).tif')
figure,imshow(f)
B1=strel([0 0 0;0 1 1;0 1 0]);
B2=strel([1 1 1;1 0 0;1 0 0]);
g=bwhitmiss(f,B1,B2);
figure,imshow(g)
```

### 灰度图像形态学开运算和闭运算

```matlab
%%%%%%%%%使用开运算和闭运算做形态学平滑%%%%%%%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH09\Fig0941(a)(wood_dowels).tif');
figure, imshow(f)%原图像
se=strel('disk',5);
fo=imopen(f,se);
figure, imshow(fo)%开运算后的图像
foc=imclose(fo,se);
figure, imshow(foc)%图像A2 经闭运算后的图像

fasf=f;
for k=2:5
    se=strel('disk',k);
    fasf=imclose(imopen(fasf,se),se);
end
figure,imshow(fasf) %%%%%% 交替顺序滤波后的图像

%%%%%%%%%%使用顶帽变换%%%%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH09\Fig0940(a)(rice_image_with_intensity_gradient).tif');
figure, imshow(f)%原图像
se=strel('disk',10);
fo=imopen(f,se);
figure, imshow(fo)%经开运算处理后的图像

f2=imsubtract(f,fo);
figure, imshow(f2)

f2=imtophat(f,se);
figure, imshow(f2)

se=strel('disk',3);
g=imsubtract(imadd(f,imtophat(f,se)),imbothat(f,se));%低帽、顶帽
figure, imshow(g)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%颗粒分析%%%%%%%%%%%%%%
clear all
clc
f=imread('D:\pic\DIP3E_CH09\Fig0940(a)(rice_image_with_intensity_gradient).tif');
sumpixels=zeros(1,36);
for k=0:35
    se=strel('disk',k);
    fo=imopen(f,se);
    sumpixels(k+1)=sum(fo(:));
end
figure,plot(0:35,sumpixels);
xlabel('k');
ylabel('surface area')

figure, plot(-diff(sumpixels))
xlabel('k');
ylabel('surface area reduction')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```

### 灰度图像形态学使用重构删除复杂图像的背景

```matlab
%灰度图像形态学使用重构删除复杂图像的背景
clear all
clc
f=imread('D:\pic\DIP3E_CH09\Fig0944(a)(calculator).tif');
figure, imshow(f)%原图像
f_obr=imreconstruct(imerode(f,ones(1,71)),f);
figure, imshow(f_obr)

f_o=imopen(f,ones(1,71));%for comparison
figure, imshow(f_o)

f_thr=imsubtract(f,f_obr);
figure, imshow(f_thr)
f_th=imsubtract(f,f_o);%or imtophat(f,ones(1,71))
figure, imshow(f_th)

g_obr=imreconstruct(imerode(f_thr,ones(1,11)),f_thr);
figure, imshow(g_obr)

g_obrd=imdilate(g_obr,ones(1,21));
figure, imshow(g_obrd)

f2=imreconstruct(min(g_obrd,f_thr),f_thr);
figure, imshow(f2)
```

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)