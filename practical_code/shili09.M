function shili09
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','实例09');
t=[54 21 35;
    68 54 35;
    45 25 12;
    48 68 45;
    68 54 69];
x=sum(t);
h=pie(x);
textobjs=findobj(h,'type','text');
str1=get(textobjs,{'string'});
val1=get(textobjs,{'extent'});
oldext=cat(1,val1{:});
names={'商品一：';'商品二：';'商品三：'};
str2=strcat(names,str1);
set(textobjs,{'string'},str2)
val2=get(textobjs,{'extent'});
newext=cat(1,val2{:});
offset=sign(oldext(:,1)).*(newext(:,3)-oldext(:,3))/2;
pos=get(textobjs,{'position'});
textpos=cat(1,pos{:});
textpos(:,1)=textpos(:,1)+offset;
set(textobjs,{'position'},num2cell(textpos,[3,2]))