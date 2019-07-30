%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%image acquision
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vid = videoinput('winvideo',1,'MJPG_1280x720');
set(vid,'ReturnedColorSpace','rgb');
preview(vid);
v.FrameRate = 120;
Slider;
sigma = 3;
se1 = strel('square',3);
se = strel('square',4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%equalization processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(1)
RGB_original=getsnapshot(vid); 
RGB_EQ=histeq(RGB_original);

%%%%%%%%%%%%%%%%%
%HSV space
%%%%%%%%%%%%%%%%%
HSVdata = rgb2hsv(RGB_EQ);
h = HSVdata(:,:,1);
s = HSVdata(:,:,2);
%%%%%%%%%%%%%%%%%%%
%binary
%%%%%%%%%%%%%%%%%%
BW1 = (ImB(h,TH1,TH2));
BW2 = (ImB(s,TS1,TS2));
BW3 =(BW1.*BW2);
%%%%%%%%%%%%%%%%%%%%
%denoising
%%%%%%%%%%%%%%%%%%%%
MBW3 = medfilt2(BW3);
window = double(uint8(3*sigma)*2+1);
GBW3 = fspecial('gaussian',window,sigma);
GBW3_1 = imfilter(MBW3,GBW3,'replicate');
%BW4 = imopen(~GBW3_1,se1);
BW4 = imerode(GBW3_1,se);
%BW5 = imclose(BW4,se);
BW5 = imdilate(BW4,se);
%%%%%%%%%%%%%%%%%%%%%%%
%segmentation
%%%%%%%%%%%%%%%%%%%%%
L = bwlabel(BW5);
stats = regionprops(L,'Area');
area = cat(1,stats.Area);
index = find(area ==max(area));%find the largest connected area
BW5 = ismember(L,index);
[m n]=size(BW5);
%%%%%%%%%%%%%%%%%%%%%%%
%recognition
%%%%%%%%%%%%%%%%%%%%%
BW6=[0,zeros(1,n),0;zeros(m,1),BW5,zeros(m,1);0,zeros(1,n),0];%make the image close
% imshow(BW6);
stats = regionprops(BW6,'basic');
centroids =cat(1,stats.Centroid);%centroid
BW7 = edge(BW6,'canny');%contour detection
imshow(BW6); 
[x,y]= find(BW7 == 1);
th=3;
[x1 y1]=delet_point(x,y,th);
x=x1;
y=y1;
[y1 x1 D]=sortxy1(y,x,centroids);
plot(D,'r.')
M1=[x,y];
[k,a] = convhull(x,y);
plot(x(k),y(k));
N=count3(x(k),y(k));
fprintf('%i\n', N);
set(gca,'FontSize',20);
end