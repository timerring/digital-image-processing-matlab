function shili12
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ʵ��12');
winddirection=[54 24 65 84 
    256 12 235 62 
    125 324 34 254];
windpower=[2 5 5 3 
    6 8 12 7 
    6 14 10 8];
rdirection=winddirection*pi/180;
[x,y]=pol2cart(rdirection,windpower);
compass(x,y);
desc={'����ͷ���',
    '��������̨',
    '10��1��0��00��',
    '10��1��12��00'};
gtext(desc)