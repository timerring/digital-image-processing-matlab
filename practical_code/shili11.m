function shili11
h0=figure('toolbar','none',...
    'position',[200 150 450 350],...
    'name','ʵ��11');
x=0:pi/20:2*pi;
y1=sin(x);
y2=cos(x);
h1=stem(x,y1+y2);
hold on
h2=plot(x,y1,'^r',x,y2,'*g');
hold off
h3=[h1(1);h2];
legend(h3,'y1+y2','y1=sin(x)','y2=cos(x)')
xlabel('�Ա���X');
ylabel('����ֵY');
title('���Һ��������Һ������������');