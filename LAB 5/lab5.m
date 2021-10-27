%Lab #5
%Joshua Hayles
%101031998


%--------------------------------------------------------
%Part#1 
a = imread('lab5a.tif');
adouble = double(a)./255;

%finding threshold vaule
thres = graythresh(adouble)
ita = adouble< thres;

%Blurring background

blur= imtophat( a, strel('disk', 19));
bblur= imbinarize(blur);
bbluro= bwareaopen(bblur,25);


figure(1)
subplot(1,2,1)
imshow(a)
title('original')
subplot(1,2,2)
imshow(bbluro)
title('binary')

%count number of objects
 pp = bwconncomp(ita,4)

%-----------------------------------------------------
%Part#2
%colour code objects 
 lab = labelmatrix(pp);
 clab= label2rgb(lab,'hsv','g','shuffle');
 figure(2)
 imshow(clab)
 title('coloured')
 %area + histogram
ao= regionprops(pp,'basic');
oarea = [ao.Area];
figure(3)
histogram(oarea)
title('histogram of colour')
%----------------------------------------------------

%Part 3

a2 = imread('lab5b.tif');
a2double = double(a2)./255;

%finding threshold vaule
thres2 = graythresh(a2double)
ita2 = a2double< thres2;

%Blurring background

blur2= imtophat( a2, strel('disk', 19));
bblur2= imbinarize(blur2);
bbluro2= bwareaopen(bblur2,25);


figure(4)
subplot(1,2,1)
imshow(a2)
title('original')
subplot(1,2,2)
imshow(bbluro2)
title('binary')

%count number of objects
 pp2 = bwconncomp(ita,4)

 
 figure(5)
subplot(1,2,1)
histogram(a)
subplot(1,2,2)
histogram(a2)


%filtering to remove noise 
k= medfilt2(bbluro2);

figure(6)
imshow(k)


 pp2 = bwconncomp(bbluro2,4)
 
 
 
 
 
 
 ao2= regionprops(pp2,'basic');
oarea2 = [ao2.Area];
figure(7)

%Histogram of denoised image 
histogram(oarea2)







