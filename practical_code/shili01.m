function shili01
h0=figure('toolbar','none',...
    'position',[198 56 350 300],...
    'name','ʵ��01');
h1=axes('parent',h0,...
   'visible','off');
x=-pi:0.05:pi;
y=sin(x);
plot(x,y);
xlabel('�Ա���X');
ylabel('����ֵY');
title('SIN( )��������');
grid on