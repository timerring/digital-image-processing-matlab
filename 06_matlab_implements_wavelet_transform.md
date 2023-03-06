- [Matlab实现小波变换](#matlab实现小波变换)
  - [目的](#目的)
  - [步骤](#步骤)
    - [Haar、尺度和小波函数](#haar尺度和小波函数)
    - [使用haar 滤波器的一个简单FWT](#使用haar-滤波器的一个简单fwt)
    - [比较函数wavefast 和函数wavedec2 的执行时间](#比较函数wavefast-和函数wavedec2-的执行时间)
    - [小波的方向性和边缘检测](#小波的方向性和边缘检测)


# Matlab实现小波变换

## 目的

1. Haar、尺度和小波函数；

2. 比较函数wavefast 和函数wavedec2 的执行时间；

3. 小波的方向性和边缘检测。

## 步骤

### Haar、尺度和小波函数

```matlab
[Lo_D,Hi_D,Lo_R,Hi_R]=wfilters('haar')
%Haar 变换的分解和重构滤波器的长度为2
waveinfo('haar');
[phi,psi,xval]=wavefun('haar',10);
xaxis=zeros(size(xval));
subplot(121);plot(xval,phi,'k',xval,xaxis,'--k');
axis([0 1 -1.5 1.5]);axis square;
title('haar scaling function');
subplot(122);plot(xval,psi,'k',xval,xaxis,'--k');
axis([0 1 -1.5 1.5]);axis square;
title('haar wavelet function');
```

### 使用haar 滤波器的一个简单FWT

```matlab
f=magic(4)%使用Haar 的单尺度小波变换
[c1,s1]=wavedec2(f,1,'haar')
[c2,s2]=wavedec2(f,2,'haar')
```

### 比较函数wavefast 和函数wavedec2 的执行时间

```matlab
function [varargout]=wavefilter(wname,type)

%Check the input and output arguments
error (nargchk(1,2,nargin));
if (nargin==1&nargout~=4)|(nargin==2&nargout~=2)
    error('Invalid number of output arguments');
end
if nargin == 1 & ~ischar(wname)
    error('WNAME must be a string');
end

if nargin == 2 & ~ischar(type)
    error('TYPE must be a string');
end

switch lower(wname)
    case {'haar','db1'}
        ld=[1 1]/sqrt(2); hd=[-1 1]/sqrt(2);
        lr=ld; hr=-hd;
    case 'db4'
        ld=[-1.059740178499728e-002 3.288301166698295e-002 ...
            3.084138183598697e-002 -1.870348117188811e-001 ...
            -2.798376941698385e-002 6.308807679295904e-001 ...
            7.14846575525415e-001 2.303778133088552e-001];
        t=(0:7);
        hd=ld; hd(end:-1:1)=cos(pi*t).*ld;
        lr=ld; lr(end:-1:1)=ld;
        hr=cos(pi*t).*ld;
    case 'sym4'
        ld=[-7.576571478927333e-002 -2.963552764599851e-002 ...
            4.976186676320155e-001 8.03738758059161e-001 ...
            2.978577956052774e-001 -9.921954357684722e-002 ...
            -1.260396726203783e-002 3.222310060404270e-002];
        t=(0:7);
        hd=ld; hd(end:-1:1)=cos(pi*t).*ld;
        lr=ld; lr(end:-1:1)=ld;
        hr=cos(pi*t).*ld;
    case 'bior6.8'
        ld=[0 1.908831736481291e-003 -1.914286129088767e-003 ...
            -1.699063986760234e-002 1.193456527972926e-002 ...
            4.973490349094079e-002 -7.726317316720414e-002 ...
            -9.405920349573646e-002 4.207962846098268e-001 ...
            8.259229974584023e-001 4.207962846098268e-001 ...
            -9.405920349573646e-002 -7.726317316720414e-002 ...
            4.973490349094079e-002 1.193456527972926e-002 ...
            -1.699063986760234e-002 -1.914286129088767e-003 ...
            1.908831736481291e-003];
        hd=[0 0 0 1.442628250562444e-002 -1.446750489679015e-002 ...
            -7.872200106262882e-002 4.036797903033992e-002 ...
            4.178491091502746e-001 -7.589077294536542e-002 ...
            4.178491091502746e-001 4.036797903033992e-002 ...
            -7.872200106262882e-002 -1.446750489679015e-002 ...
            1.442628250562444e-002 0 0 0 0];
        t=(0:17);
        lr=cos(pi*(t+1)).*hd;
        hr=cos(pi*t).*ld;
    case 'jpep9.7'
        ld=[0 0.02674875741080976 -0.01686411844287495 ...
            -0.07822326652898785 0.266861184428732 ...
            0.6029490182363579 0.266861184428732 ...
            -0.07822326652898785 -0.01686411844287495 ...
            0.02674875741080976];
        hd=[0 -0.09127176311424948 0.05754352622849957 ...
            0.5912717631142470 -1.115087052456994 ...
            0.5912717631142470 0.05754352622849957 ...
            -0.09127176311424948 0 0];
        t=(0:9);
        lr=cos(pi*(t+1)).*hd;
        hr=cos(pi*t).*ld;
    otherwise
        error('Unrecognizable wavelet name (WNAME).');
end

%Output the requested filters
if(nargin == 1)
    varargout(1:4)={ld,hd,lr,hr};
else
    switch lower(type(1))
        case 'd'
        varargout={ld,hd};
        case 'r'
        varargout={lr,hr};
        otherwise
            error('Unrecognizable filter TYPE.')
     end
end


function [c,s]=wavefast(x,n,varargin)

error(nargchk(3,4,nargin));
if nargin == 3
    if ischar(varargin{1})
        [lp,hp]=wavefilter(varargin{1},'d');
    else
        error('Missing wavelet name');
    end
else
    lp=varargin{1};hp=varargin{2};
end
f1=length(lp);
sx=size(x);
if (ndims(x)~=2)|(min(sx<2))|~isreal(x)|~isnumeric(x)
    error('X must be a real, numeric matrix');
end

if (ndims(lp)~=2)|~isreal(lp)|~isnumeric(lp) ...
    |(ndims(hp)~=2)|~isreal(hp)|~isnumeric(hp) ...
    |(f1~=length(hp)) | rem(f1,2)~=0
    error(['LP and HP must be even and equal length real ,'...'numeric filter vectors']);
end

if ~isreal(n)|~isnumeric(n)|(n<1)|(n>log2(max(sx)))
    error(['N must be a real scalar between 1 and' ...'log2(max(size(x)))']);
end
c=[];s=sx;app=double(x);

%for each decomposition...
for i=1:n
    [app,keep]=symextend(app,f1);

    rows=symconv(app,hp,'row',f1,keep);
    coefs=symconv(rows,hp,'col',f1,keep);
    c=[coefs(:)' c];
    s=[size(coefs);s];
    coefs=symconv(rows,lp,'col',f1,keep);
    c=[coefs(:)' c];
    rows=symconv(app,lp,'row',f1,keep);
    coefs=symconv(rows,hp,'col',f1,keep);
    c=[coefs(:)' c];
    app=symconv(rows,lp,'col',f1,keep);
end
c=[app(:)' c];
s=[size(app);s];

function [y,keep]=symextend(x,f1)
keep=floor((f1+size(x)-1)/2);
y=padarray(x,[(f1-1) (f1-1)],'symmetric','both');


function [ratio, maxdiff]=fwtcompare(f,n,wname)
tic;
[c1,s1]=wavedec2(f,n,wname);
reftime=toc;
tic;
[c2,s2]=wavefast(f,n,wname);
t2=toc;


%compare the results
ratio=t2/(reftime+eps);
maxdiff=abs(max(c1-c2)); 


function y=symconv(x,h,type,f1,keep)
if strcmp(type,'row')
    y=conv2(x,h);
    y=y(:,1:2:end);
    y=y(:,f1/2+1:f1/2+keep(2));
else
    y=conv2(x,h');
    y=y(1:2:end,:);
    y=y(f1/2+1:f1/2+keep(1),:);
end 

%比较两种方法下的速度
clear all
clc
f=imread('D:\图像库\DIP3E_CH07_Original_Images\Fig0701.tif','tif');
[ratio,maxdifference]=fwtcompare(f,5,'db4')
```

### 小波的方向性和边缘检测

```matlab
clear all
clc
f=imread('D:\图像库\DIP3E_CH07_Original_Images\Fig0701.tif');
imshow(f);
[c,s]=wavefast(f,1,'sym4');
figure;wave2gray(c,s,-6);
[nc,y]=wavecut('a',c,s);
figure;wave2gray(nc,s,-6);
edges=abs(waveback(nc,s,'sym4'));
figure;imshow(mat2gray(edges));
```

```matlab
%子程序
function w=wave2gray(c,s,scale,border)
error(nargchk(2,4,nargin));
if(ndims(c)~=2)|(size(c,1)~=1)
    error('c must be a row vector');
end
if(ndims(s)~=2)|~isreal(s)|~isnumeric(s)|(size(s,2)~=2)
    error('s must be a real,numeric two-column array');
end
elements=prod(s,2);

if (length(c)<elements(end))|...
        ~(elements(1)+3*sum(elements(2:end-1))>=elements(end))
    error(['[c s] must be a standard wavelet' ...'decomposition structure']);
end
if(nargin>2)&(~isreal(scale)|~isnumeric(scale))
    error('scale must be a real,numeric scalar');
end

if(nargin>3)&(~ischar(border))
    error('border must be character string');
end

if nargin==2
    scale=1;%default scale
end
if nargin<4
    border='absord';%default border
end

absflag=scale<0;
scale=abs(scale);
if scale==0
    scale=1;
end

[cd,w]=wavecut('a',c,s);
w=mat2gray(w);
cdx=max(abs(cd(:)))/scale;
if absflag
    cd=mat2gray(abs(cd),[0,cdx]);
    fill=0;
else
    cd=mat2gray(cd,[-cdx,cdx]);
    fill=0.5;
end
%build gray image one decomposition at a time
for i=size(s,1)-2:-1:1
    ws=size(w);
    h=wavecopy('h',cd,s,i);
    pad=ws-size(h);
    frontporch=round(pad/2);
    h=padarray(h,frontporch,fill,'pre');
    h=padarray(h,pad-frontporch,fill,'post');
    v=wavecopy('v',cd,s,i);
    pad=ws-size(v);
    frontporch=round(pad/2);
    v=padarray(v,frontporch,fill,'pre');
    h=padarray(v,pad-frontporch,fill,'post');
    d=wavecopy('d',cd,s,i);
    pad=ws-size(d);
    frontporch=round(pad/2);
    d=padarray(d,frontporch,fill,'pre');
    d=padarray(d,pad-frontporch,fill,'post');

    %Add 1 pixel white border
    switch lower(border)
        case 'append'
            w=padarray(w,[1 1],1,'post');
            h=padarray(h,[1 0],1,'post');
            v=padarray(v,[0 1],1,'post');
        case 'absord'
            w(:,end)=1;
            w(end,:)=1;
            h(end,:)=1;
            v(:,end)=1;
        otherwise
            error('Unrecognized border parameter');
    end
    w=[w h;v d];
end

if nargout==0
    imshow(w);%display result
end


function [varargout]=waveback(c,s,varargin)

error(nargchk(3,5,nargin));
error(nargchk(1,2,nargout));

if (ndims(c)~=2)|(size(c,1)~=1)
    error('c must be a row vector');
end
if(ndims(s)~=2)|~isreal(s)|~isnumeric(s)|(size(s,2)~=2)
    error('s must be a real,numeric two-column array');
end
elements=prod(s,2);

if (length(c)<elements(end))|...
~(elements(1)+3*sum(elements(2:end-1))>=elements(end))
     error(['[c s] must be a standard wavelet' ...
    'decomposition structure']);
end

nmax=size(s,1)-2;
wname=varargin{1};
filterchk=0;
nchk=0;

switch nargin
    case 3
        if ischar(wname)
            [lp,hp]=wavefilter(wname,'r');
            n=nmax;
        else
            error('updefined filter');
        end
        if nargout~=1
            error('wrong number of output arguments');
        end
    case 4
        if ischar(wname)
            [lp,hp]=wavefilter(wname,'r');
            n=varargin{2};
            nchk=1;
        else
            lp=varargin{1};
            hp=varargin{2};
            filterchk=1;
            n=nmax;
            if nargout~=1
                error('wrong number of output arguments');
            end
        end
case 5
    lp=varargin{1};
    hp=varargin{2};
    filterchk=1;
    n=varargin{3};
    nchk=1;
    otherwise
        error('improper number fo input arguments');
end

f1=length(lp);
if filterchk
    if (ndims(lp)~=2)|~isreal(lp)|~isnumeric(lp) ...
        |(ndims(hp)~=2)|~isreal(hp)|~isnumeric(hp) ...
        |(f1~=length(hp)) | rem(f1,2)~=0
    error(['LP and HP must be even and equal length real ,'...
        'numeric filter vectors']);
    end
end

if nchk & (~isnumeric(n)|~isreal(n))
    error('n must be a real numeric');
end
if (n>nmax)|(n<1)
    error('Invalid number (N) of reconstructions requested');
end
if (n~=nmax) & (nargout~=2)
    error('Not enough output arguments');
end

nc=c;
ns=s;
nnmax=nmax;
for i=1:n
    a=symconvup(wavecopy('a',nc,ns),lp,lp,f1,ns(3,:))+ ...
        symconvup(wavecopy('h',nc,ns,nnmax),hp,lp,f1,ns(3,:))+ ...
        symconvup(wavecopy('v',nc,ns,nnmax),lp,hp,f1,ns(3,:))+ ...
        symconvup(wavecopy('d',nc,ns,nnmax),hp,hp,f1,ns(3,:));

        nc=nc(4*prod(ns(1,:))+1:end);
        nc=[a(:)' nc];
        ns=ns(3:end,:);
        ns=[ns(1,:);ns];
        nnmax=size(ns,1)-2;
end

if nargout==1;
    a=nc;
    nc=repmat(0,ns(1,:));
    nc(:)=a;
end
varargout{1}=nc;
if nargout==2
    varargout{2}=ns;
end

function z=symconvup(x,f1,f2,fln,keep)

y=zeros([2 1].*size(x));
y(1:2:end,:)=x;
y=conv2(y,f1');
z=zeros([1 2].*size(y));
z(:,1:2:end)=y;
z=conv2(z,f2);
z=z(fln-1:fln+keep(1)-2,fln-1:fln+keep(2)-2);

function [nc,y]=wavecut(type,c,s,n)
error(nargchk(3,4,nargin));
if nargin==4
    [nc,y]=wavework('cut',type,c,s,n);
else
    [nc,y]=wavework('cut',type,c,s);
End

function y=wavecopy(type,c,s,n)
error(nargchk(3,4,nargin));
if nargin==4
    [nc,y]=wavework('cut',type,c,s,n);
else
    [nc,y]=wavework('cut',type,c,s);
End

function y=wavepaste(type,c,s,n)
error(nargchk(5,5,nargin))
nc=wavework('paste',type,c,s,n,x);

function [varargout]=wavework(opcode,type,c,s,n,x)
error(nargchk(4,6,nargin));
if (ndims(c)~=2)|(size(c,1)~=1)
    error('c must be a row vector');
end
if(ndims(s)~=2)|~isreal(s)|~isnumeric(s)|(size(s,2)~=2)
    error('s must be a real,numeric two-column array');
end

elements=prod(s,2);

if (length(c)<elements(end))|...
        ~(elements(1)+3*sum(elements(2:end-1))>=elements(end))
    error(['[c s] must be a standard wavelet' ...
        'decomposition structure']);
end

if strcmp (lower(opcode(1:3)),'pas') & nargin < 6
    error('Not enough input arguments');
end

if nargin<5
    n=1;
end


nmax=size(s,1)-2;


aflag=(lower(type(1))=='a');
if ~aflag & (n>nmax)
    error('N exceeds the decompositon in [c,s]');
end

switch lower(type(1))
    case 'a'
        nindex=1;
        start=1;
        stop=elements(1);
        ntst=nmax;
    case {'h','v','d'}
        switch type
            case 'h'
                offset=0;
            case 'v'
                offset=1;
            case 'd'
                offset=2;
        end
        nindex=size(s,1)-n;
        start=elements(1)+3*sum(elements(2:nmax-n+1))+ ...
            offset*elements(nindex)-1;
        stop=start+elements(nindex)-1;
        ntst=n;
    otherwise
        error('Type must begin with "a","h","v",or "d"');
end

switch lower(opcode)
    case {'copy','cut'}
        y=repmat(0,s(nindex,:));
        y(:)=c(start:stop);
        nc=c;
        if strcmp(lower(opcode(1:3)),'cut')
            nc(start:stop)=0;
            varargout={nc,y};
        else
            varargout={y};
        end
    case 'paste'
        if prod(size(x))~=elements(end-ntst)
            error('x is not sized for the requested paste');
        else
            nc=c;
            nc(start:stop)=x(:);
            varargout={nc};
        end
    otherwise
        error('unrecognized OPCODE');
end
```

参考文献：

[1] [Rafael C. Gonzalez, Richard E. Woods, and Steven L. Eddins. 2003. Digital Image Processing Using MATLAB. Prentice-Hall, Inc., USA.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_Using_Matlab.pdf)

[2] [阮秋琦. 数字图像处理（MATLAB版）[M]. 北京：电子工业出版社, 2014.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(MATLAB_version).pdf)

[3] [冈萨雷斯. 数字图像处理（第三版）[M]. 北京：电子工业出版社, 2011.](https://github.com/timerring/digital-image-processing-matlab/blob/main/reference/Digital_Image_Processing_(Third_Edition).pdf)

[返回首页](https://github.com/timerring/digital-image-processing-matlab)
