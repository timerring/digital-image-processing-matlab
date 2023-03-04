- [图像的滤波与图像增强的Matlab实现](#图像的滤波与图像增强的matlab实现)
	- [目的](#目的)
	- [内容](#内容)
		- [A. 用滤波器祛除图象噪声](#a-用滤波器祛除图象噪声)
		- [B. 空间噪声滤波器](#b-空间噪声滤波器)
		- [C.用滤波器祛除图象噪声](#c用滤波器祛除图象噪声)


# 图像的滤波与图像增强的Matlab实现

## 目的

1. 了解 MATLAB 工具箱中的滤波器。
2. 掌握空间滤波
3. 学会对图像的空间变换

## 内容

### A. 用滤波器祛除图象噪声

在数字图像处理中，常常会遇到图像中混杂有许多的噪声。因此，在进行图像处理中，有时要先进行祛除噪声的工作。最常用的祛除噪声的方法是用滤波器进行滤波处理。MATLAB 的图像处理工具箱里也设计了许多的滤波器。如均值滤波器、中值滤波器、维纳滤波器等。

（分别用均值滤波，中值滤波，及维纳滤波器祛除加入高斯噪声的图象）

```matlab
I=imread('D:\pic\DIP3E_CH04\FigP0438(left).tif ');
J=imnoise(I,'gaussian',0,0.002);
%进行均值滤波
h=fspecial('average',3);
I2=uint8(round(filter2(h,I)));
%进行中值滤波
I3=medfilt2(J,[3,3]);
%进行维纳滤波
I4=wiener2(J,[3,3]); %进行一次维纳滤波
I5=wiener2(I4,[3,3]);%进行二次维纳滤波
subplot(2,3,1),imshow(I),title('原图象')
subplot(2,3,2),imshow(J),title('加噪声图象')
subplot(2,3,3),imshow(I2),title('均值滤波后图象')
subplot(2,3,4),imshow(I3),title('中值滤波后图象')
subplot(2,3,5),imshow(I4),title('维纳滤波后图象')
subplot(2,3,6),imshow(I5),title('两次维纳滤波后图象')
```

### B. 空间噪声滤波器

```matlab
%用函数imnoise2 生成具有表5.1 中的CDF 的随机数
function R=imnoise2(type,M,N,a,b)
if nargin ==1
	a=0;b=1;
	M=1;N=1;
elseif nargin ==3
	a=0;b=1;
end
switch lower(type)
	case 'uniform'
		R=a+(b-a)*rand(M,N);
	case 'gaussian'
		R=a+b*randn(M,N);
	case 'salt & pepper'
		if nargin <=3
			a=0.05;b=0.05;
		end
		if (a+b)>1;
			error('The sum Pa+Pb must not exceed 1.')
		end
		R(1:M, 1:N) = 0.5;
		X=rand(M,N);
		c=find(X<=a);
		R(c)=0;
		u=a+b;
		c=find(X>a & X<=u);
		R(c)=1;
	case 'rayleigh'
		R=a+(-b*log(1-rand(M,N))).^0.5;
	case 'exponential'
		if nargin <=3;
			a=1;
		end
		if a<=0
			error('Parameter a must be positive for exponential type.')
		end
		k=-1/a;
		R=k*log(1-rand(M,N));
	case 'erlang'
		if nargin<=3
			a=2;b=5;
		end
		if (b~=round(b)|b<=0)
			error('Parameter b must be a positive integer for Erlang')
		end
		k=-1/a;
		R=zeros(M,N);
		for j=1:b
			R=R+k*log(1-rand(M,N));
		end
	otherwise
		error('unknown distribution type.')
end

function image=changeclass(class,varargin)
switch class
	case 'uint8'
		image=im2uint8(varargin{:});
	case 'uint16'
		image=im2uint16(varargin{:});
	case 'double'
		image=im2double(varargin{:});
	otherwise
		error('Unsupported IPT data class.');
end
%%%%% spfilt 函数与表中列出的任何滤波器在空间域执行滤波。
function f = spfilt(g,type,m,n,parameter)
if nargin ==2
	m=3;n=3;Q=1.5;d=2;
elseif nargin == 5
	Q=parameter;d=parameter;
elseif nargin== 4
	Q=1.5; d=2;
else
	error ('wrong number of inputs');
end
switch type
	case 'amean'
	w=fspecial('average',[m,n]);
	f=imfilter(g,w, 'replicate');
	case 'gmean'
	f=gmean(g,m,n);
	case 'hmean'
	f=harmean(g,m,n);
	case 'chmean'
	%f=charmean(g,m,n,Q);
	f=charmean(g,m,n,Q);
	case 'median'
	f=medfilt2(g,[m n], 'symmetric');
	case 'max'
	f=ordfilt2(g,m*n,ones(m,n),'symmetric');
	case 'min'
	f=ordfilt2(g,1,ones(m,n), 'symmetric');
	case 'midpoint'
	f1=ordfilt2(g,1,ones(m,n), 'symmetric');
	f2=ordfilt2(g,m*n,ones(m,n), 'symmetric');
	f=imlincomb(0.5,f1,0.5,f2);
	case 'atrimmed'
	if(d<0)|(d/2~=round(d/2))
		error('d must be a nonnegative, even integer.')
	end
	f=alphatrim(g,m,n,d);
	otherwise
		error('Unknown filter type.')
end


function f=gmean(g,m,n)
inclass =class (g);
g=im2double(g);
warning off;
f=exp(imfilter(log(g),ones(m,n),'replicate')).^(1/m/n);
warning on;
f=changeclass(inclass, f);


function f=harmean(g,m,n)
inclass=class(g);
g=im2double(g);
f=m*n./imfilter(1./(g+eps),ones(m,n),'replicate');
f=changeclass(inclass,f);

function f=charmean(g,m,n,q)
inclass=class(g);
g=im2double(g);
f= imfilter(g.^(q+1),ones(m,n),'replicate');
f=f./ (imfilter(g.^q,ones(m,n),'replicate')+eps);
f=changeclass(inclass,f);

function f=alphatrim(g,m,n,d)
inclass = class(g);
g=im2double(g);
f=imfilter(g,ones(m,n),'symmetric');
for k=1:d/2
	f=imsubtract(f,ordfilt2(g,k,ones(m,n),'symmetric'));
end
for k=(m*n – (d/2)+1):m*n
	f=imsubtract(f,ordfilt2(g,k,ones(m,n),'symmetric'));
end
f=f/(m*n-d);
f=changeclass(inclass,f);

%使用函数spfilt
clear all
clc
f=imread('D:\pic\DIP3E_CH04\FigP0438(left).tif');
[M,N]=size(f);
R=imnoise2('salt & pepper',M,N,0.1,0);%被概率只有0.1 的胡椒噪声污染
c=find(R==0);
gp=f;
gp(c)=0;
figure, imshow(gp);

R=imnoise2('salt & pepper',M,N,0,0.1);
c=find(R==1);
gs=f;
gs(c)=255;
figure,imshow(gs)

fp=spfilt(gp,'chmean',3,3,1.5);%使用Q 为正值的反调和滤波器
figure, imshow(gp);
fs=spfilt(gs,'chmean',3,3,-1.5);
figure, imshow(gs);

fpmax=spfilt(gp,'max',3,3); %使用最大最小滤波器
figure, imshow(gp);
fsmin=spfilt(gs,'min',3,3);
figure, imshow(gs);
```

### C.用滤波器祛除图象噪声

```matlab
%产生一个等角变换用于测试图像
f=checkerboard(50);
s=0.8;
theta=pi/6;
T=[s*cos(theta) s*sin(theta) 0; -s*sin(theta) s*cos(theta) 0; 0 0 1];
tform=maketform('affine',T);
g=imtransform(f,tform);
figure, imshow(g);

g2=imtransform(f,tform,'nearest');
figure, imshow(g2);

g3=imtransform(f,tform,'FillValue',0.5);
figure, imshow(g3);

T2=[1 0 0;0 1 0; 50 50 1];
tform2=maketform('affine',T2);
g4=imtransform(f,tform2);
figure, imshow(g4);

g5=imtransform(f,tform2,'XData',[1 400],'YData',[1
400],'FillValue',0.5);
figure, imshow(g5);
```



参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）\[M\]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）\[M\]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)



[返回首页](https://github.com/timerring/digital-image-processing-matlab)
