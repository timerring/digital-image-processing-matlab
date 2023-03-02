function shili12
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例12');
winddirection=[54 24 65 84 
    256 12 235 62 
    125 324 34 254];
windpower=[2 5 5 3 
    6 8 12 7 
    6 14 10 8];
rdirection=winddirection*pi/180;
[x,y]=pol2cart(rdirection,windpower);
compass(x,y);
desc={'风向和风力',
    '北京气象台',
    '10月1日0：00到',
    '10月1日12：00'};
gtext(desc)