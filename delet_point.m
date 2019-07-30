function [x1 y1]=delet_point(x,y,th)
n=length(x);
x1=[];
y1=[];
x1=[x1,x(1)];
y1=[y1,y(1)];
for i=2:n
    for j=1:length(x1)
        d(j)=(x(i)-x1(j))^2+(y(i)-y1(j))^2;
    end
    d_min=min(d);
    if(d_min>th)
        x1=[x1,x(i)];
        y1=[y1,y(i)];
    end
    d=zeros(1,length(x1));
end

img=zeros(length(x1),length(y1));
for i=1:length(x1)
    img(x1(i),y1(i))=1;
end
% figure,imshow(img)
end








































