function shili25
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ÊµÀý25');
vert=[1 1 1;1 2 1;
    2 2 1;2 1 1;
    1 1 2;1 2 2;
    2 2 2;2 1 2];
fac=[1 2 3 4;2 6 7 3;
    4 3 7 8;1 5 8 4;
    1 2 6 5;5 6 7 8];
grid off
sphere(36)
h=findobj('type','surface');
set(h,'facelighting','phong',...
    'facecolor',...
    'interp',...
    'edgecolor',[0.4 0.4 0.4],...
    'backfacelighting',...
    'lit')
hold on
patch('faces',fac,'vertices',vert,...
    'facecolor','y');
light('position',[1 3 2]);
light('position',[-3 -1 3]);
material shiny
axis vis3d off
hold off