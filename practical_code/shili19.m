function shili19
h0=figure('toolbar','none',...
    'position',[200 150 450 400],...
    'name',' µ¿˝19');
subplot(2,1,1)
x=linspace(0,2*pi);
y1=sin(x);
y2=cos(x);
y3=sin(x)+cos(x);
z1=zeros(size(x));
z2=0.5*z1;
z3=z1;
plot3(x,y1,z1,x,y2,z2,x,y3,z3)
grid on
xlabel('X÷·');
ylabel('Y÷·');
zlabel('Z÷·');
title('Figure1:3-D Plot')

subplot(2,1,2)
x=linspace(0,2*pi);
y1=sin(x);
y2=cos(x);
y3=sin(x)+cos(x);
z1=zeros(size(x));
z2=0.5*z1;
z3=z1;
plot3(x,z1,y1,x,z2,y2,x,z3,y3)
grid on
xlabel('X÷·');
ylabel('Y÷·');
zlabel('Z÷·');
title('Figure2:3-D Plot')