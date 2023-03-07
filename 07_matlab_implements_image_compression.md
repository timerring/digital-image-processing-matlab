- [Matlab实现图像压缩](#matlab实现图像压缩)
  - [目的](#目的)
  - [原理](#原理)
    - [图像压缩原理](#图像压缩原理)
    - [离散余弦变换(DCT)图像压缩原理](#离散余弦变换dct图像压缩原理)
    - [行程编码（RLE）原理](#行程编码rle原理)
  - [步骤](#步骤)
    - [MATLAB 中的变长码映射](#matlab-中的变长码映射)
    - [离散余弦变换（DCT）图像压缩](#离散余弦变换dct图像压缩)
    - [利用离散余弦变换进行JPEG 图像压缩](#利用离散余弦变换进行jpeg-图像压缩)


# Matlab实现图像压缩

## 目的

1． 理解图像压缩的相关概念及图像压缩的主要原则和目的；
2． 掌握霍夫曼编码
3． 掌握几种常见的图像压缩编码方法
4． 利用 MATLAB 程序进行图像压缩

## 原理

### 图像压缩原理

图像压缩主要目的是为了节省存储空间，增加传输速度。图像压缩的理想标准是信息丢失最少，压缩比例最大。不损失图像质量的压缩称为无损压缩，无损压缩不可能达到很高的压缩比；损失图像质量的压缩称为有损压缩，高的压缩比是以牺牲图像质量为代价的。压缩的实现方法是对图像重新进行编码，希望用更少的数据表示图像。

信息的冗余量有许多种，如空间冗余，时间冗余，结构冗余，知识冗余，视觉冗余等，数据压缩实质上是减少这些冗余量。高效编码的主要方法是尽可能去除图像中的冗余成分，从而以最小的码元包含最大的图像信息。

编码压缩方法有许多种，从不同的角度出发有不同的分类方法，从信息论角度出发可分为两大类。

（1）冗余度压缩方法，也称无损压缩、信息保持编码或嫡编码。具体说就是解码图像和压缩编码前的图像严格相同，没有失真，从数学上讲是一种可逆运算。

（2）信息量压缩方法，也称有损压缩、失真度编码或烟压缩编码。也就是说解码图像和原始图像是有差别的，允许有一定的失真。

应用在多媒体中的图像压缩编码方法，从压缩编码算法原理上可以分为以下 3 类：

（1）无损压缩编码种类
哈夫曼（Huffman）编码，算术编码，行程（RLE）编码，Lempel zev 编码。

（2）有损压缩编码种类

+ 预测编码，DPCM，运动补偿

+ 频率域方法：正交变换编码(如DCT)，子带编码；

+ 空间域方法：统计分块编码；

+ 模型方法：分形编码，模型基编码；

+ 基于重要性：滤波，子采样，比特分配，向量量化；

（3）混合编码。 有 JBIG，H261，JPEG，MPEG 等技术标准。

### 离散余弦变换(DCT)图像压缩原理

离散余弦变换 DCT 在图像压缩中具有广泛的应用，它是JPEG、MPEG 等数据压缩标准的
重要数学基础。

和相同图像质量的其他常用文件格式(如GIF(可交换的图像文件格式)，TIFF(标签图像文件格式)，PCX(图形文件格式))相比，JPEG 是目前静态图像中压缩比最高的。JPEG 比其他几种压缩比要高得多，而图像质量都差不多(JPEG 处理的图像只有真彩图和灰度图)。正是由于其高压缩比，使得JPEG 被广泛地应用于多媒体和网络程序中。JPEG 有几种模式，其中最常用的是基于DCT 变换的顺序型模式，又称为基本系统(Baseline)。

用DCT 压缩图像的过程为：

(1)首先将输入图像分解为8×8 或16×16 的块，然后对每个子块进行二维DCT变换。
(2)将变换后得到的量化的DCT 系数进行编码和传送，形成压缩后的图像格式。

用 DCT 解压的过程为：

(1)对每个8×8 或16×16 块进行二维DCT 反变换。
(2)将反变换的矩阵的块合成一个单一的图像。

余弦变换具有把高度相关数据能量集中的趋势，DCT 变换后矩阵的能量集中在矩阵的
左上角，右下的大多数的DCT 系数值非常接近于0。对于通常的图像来说，舍弃这些接近
于0 的DCT 的系数值，并不会对重构图像的画面质量带来显著的下降。所以，利用DCT
变换进行图像压缩可以节约大量的存储空间。压缩应该在最合理地近似原图像的情况下使用
最少的系数。使用系数的多少也决定了压缩比的大小。

在压缩过程的第 2 步中，可以合理地舍弃一些系数，从而得到压缩的目的。在压缩
过程的第2 步，还可以采用RLE 和Huffman 编码来进一步压缩。

### 行程编码（RLE）原理

例如如下这幅的二值图像，

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/06-22-37-56-1678113475.png)

如果采用行程编码可以按如下格式保存

![](https://raw.githubusercontent.com/timerring/scratchpad2023/main/2023/03/06-22-38-11-1678113490.png)

其中10 和8 表示图像的宽和高。在这个小例子中行程编码并没有起到压缩图像的作用。这是由于这个图的尺寸过小，当图像尺寸较大时行程编码还是不错的无损压缩方法。对于灰度图像和二值图像，用行程编码—般都有很高的压缩率。行程编码方法实现起来很容易，对于具有长重复值的串的压缩编码很有效，例如：对于有大面积的阴影或颜色相同的图像，使用这种方法压缩效果很好。很多位图文件格式都采用行程编码，如TIFF，PCX，GEM，BMP等。

## 步骤

### MATLAB 中的变长码映射

```matlab
clear all
clc


f2=uint8([2 3 4 2;3 2 4 4;2 2 1 2;1 1 2 2])
whos('f2')
c=huffman(hist(double(f2(:)),4))
h1f2=c(f2(:))'
whos('h1f2')
%h2f2=char(h1f2)'
h2f2=[1 0 1 0 0 1 1 0 0 0 0 1 1 0 1 1;...
' ' 1 ' ' 1 1 ' ' 1 0 0 1 ' ' 0 ' ';...
' ' 0 ' ' 1 0 ' ' 1 ' ' 1 ' ']
whos('h2f2')

h2f2=h2f2(:);
h2f2(h2f2==' ')=[];
whos('h2f2')

h3f2=mat2huff(f2)
whos('h3f2')

hcode=h3f2.code;
whos('hcode')
dec2bin(double(hcode))

%-----------------------------------------%
function CODE=huffman(p)

error(nargchk(1,1,nargin));
if(ndims(p)~=2)|(min(size(p))>1)|~isreal(p)|~isnumeric(p)
    error('p must be a real numeric vector');
end

global CODE
CODE=cell(length(p),1);%init the global cell array
if (length(p)>1) %when more than one symbol....
    p=p/sum(p);%Normalize the input probabilities
    s=reduce(p);%Do Huffman source symbol reductions
    makecode(s,[]);%Recursively(递归) generate the code
else
    CODE={'1'};%else, trivial(普通的) one symbol case
end;
%---------------------------------------------------------%

function s=reduce(p);
s=cell(length(p),1);
for i=1:length(p)
    s{i}=i;
end

while size(s)>2
    [p,i]=sort(p);%sort the symbol probabilities
    p(2)=p(1)+p(2);%Merge the 2 lowest probabilities
    p(1)=[];% and prune(,剪除、删除) the lowest one

    s=s(i);
    s{2}={s{1},s{2}};
    s(1)=[];
end
%------------------------------------------------------------%
function makecode(sc,codeword)

global CODE
if isa(sc,'cell')
    makecode(sc{1},[codeword 0]);
    makecode(sc{2},[codeword 1]);
else
    CODE{sc}=char('0'+codeword);
End
%-----------------------------------------------------------%
function y=mat2huff(x)

if ndims(x)~=2|~isreal(x)|(~isnumeric(x) & ~islogical(x))
    error('x must be a 2-D real numeric or logical matrix');
end

y.size=uint32(size(x));
x=round(double(x));
xmin=min(x(:));
xmax=max(x(:));
pmin=double(int16(xmin));
pmin=uint16(pmin+32768);%
y.min=pmin;
x=x(:)';
h=histc(x,xmin:xmax);
if max(h)>65535
    h=65535*h/max(h);
end
h=uint16(h);
y.hist=h;

%code the input matrix and store the result
map=huffman(double(h));
hx=map(x(:)-xmin+1)
hx = ['1' ' ' '1' '0' ' ' '1' '1' '0' ' ' ' '...
    '0' '1' '1' ' ' '1' '1']';
%hx=char(hx);
hx=hx(:)';
hx(hx==' ')=[];
ysize=ceil(length(hx)/16);
hx16=repmat('0',1,ysize*16);
hx16(1:length(hx))=hx;
hx16=reshape(hx16,16,ysize);
hx16=hx16' - '0';
twos=pow2(15:-1:0);
y.code=uint16(sum(hx16.*twos(ones(ysize,1),:),2))';
%-----------------------------------------------------------------------%
```

### 离散余弦变换（DCT）图像压缩

在图像的变换和压缩中，常常用到离散余弦变换（DCT）。DCT 具有能使图像的最重要的信息集中在DCT 的几个系数上的性能。正是基于此，DCT 通常应用于图像的压缩。

```matlab
clear all
clc
I=imread('D:\pic\DIP3E_CH11_Original_Images\Fig1137(b)(painting_translated_padded).tif','tif');

I=im2double(I);
T=dctmtx(8);
B=blkproc(I,[8,8],'P1*x*P2',T,T');
mask=[1 1 1 1 0 0 0 0;1 1 1 0 0 0 0 0;1 1 0 0 0 0 0 0;...
        1 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0];
B2=blkproc(B,[8,8],'P1.*x',mask);
I2=blkproc(B2,[8,8],'P1*x*P2',T',T);
imshow(I),title('原图象');
figure,imshow(I2),title('变换后的图象');
```

### 利用离散余弦变换进行JPEG 图像压缩

```matlab
clear all
clc
I=imread('D:\pic\DIP3E_CH11_Original_Images\Fig1137(b)(painting_translated_padded).tif'); %读入原图像；
I=im2double(I); %将原图像转为双精度数据类型；
T=dctmtx(8); %产生二维DCT 变换矩阵
B=blkproc(I,[8 8],'P1*x*P2',T,T'); %计算二维DCT，矩阵T 及其转置T’是DCT 函数
%P1*x*P2 的参数
mask=[ 1 1 1 1 0 0 0 0;1 1 1 0 0 0 0 0;1 1 0 0 0 0 0 0;1 0 0 0 0 0 0 0;...
    0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0];
%二值掩膜，用来压缩DCT 系数，只留下DCT 系数中左上角的10 个
B2=blkproc(B,[8 8],'P1.*x',mask); %只保留DCT 变换的10 个系数
I2= blkproc(B2,[8,8],'P1*x*P2',T',T); %逆DCT，重构图像
Subplot(1,2,1);
Imshow(I);title('原图像');%显示原图像
Subplot(1,2,2);
Imshow(I2);title('压缩图像');%显示压缩后的图像。对比原始图像和压缩后的图像，虽然
%舍弃了85%的DCT 系数，但图像仍然清晰（当然有一些质量损失）
```

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)
