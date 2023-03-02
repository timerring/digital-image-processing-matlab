function shili07
h0=figure('toolbar','none',...
    'position',[200 150 450 350],...
    'name','ÊµÀý07');
tiao1=[562 548 224 545 41 445 745 512];
tiao2=[47 48 57 58 54 52 65 48];
t=0:7;
bar(t,tiao1)
xlabel('XÖá');
ylabel('TIAO1Öµ');
h1=gca;
h2=axes('position',get(h1,'position'));
plot(t,tiao2,'linewidth',3)
set(h2,'yaxislocation','right','color','none','xticklabel',[])