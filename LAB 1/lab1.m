%lab#1 Script

im = imread('MRI_Head_Brain_Normal.jpg');

figure(1)
imagesc(im)



imfinfo('MRI_Head_Brain_Normal.jpg')
whos im

im_gray =rgb2gray(im);
whos im_gray


figure(2)
imshow(im_gray)


figure(3)
imhist(im_gray)


E= entropy(im_gray)

figure(4)
im_gray_c = imcrop(im_gray, [20 681])


figure(5)

imeq =histeq(im_gray); 
imshow(imeq)
