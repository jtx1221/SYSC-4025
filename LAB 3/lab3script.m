%lab #3

%Part 1.1
%load 
imog=imread('img.jpeg');
%resize
imr = imresize(imog,0.476);
%double conversion 
imd= im2double(imr);
%displaying original vs subplotted image 
figure(1);
subplot(1,2,1); imshow(imr); title('Original'); colormap(gray(256)); colorbar;
subplot(1,2,2); imshow(imd,[]); title('Double'); colormap(gray(256)); colorbar;



% Part 1.2
[x,y]= meshgrid(1:300,1:300);
%noise function 
nf =@(x,y) 0.5*sin(0.4*pi*x) +0.5*sin(0.4*pi*y);
N =nf(x,y);
%noise functions and orignal image 
sn = imnoise(imd,'salt & pepper');
gn = imnoise(imd,'gaussian');
Nf = N + imd; 

%displaying noisy images 
figure(2) 
subplot(2,2,1); imshow(Nf,[]); title('Noise Signal');
subplot(2,2,2); imshow(sn,[]); title('Salt & Pepper'); 
subplot(2,2,3); imshow(gn,[]); title('Guassian'); 

% Part 1.3/1.4
%Kernals
h5=ones(5)./25;
h3=ones(3)./9;
%Averaging filter
af5= imfilter(Nf,h5);
af3= imfilter(Nf,h3);

%displaying filter images
figure(3)
subplot(2,2,1); imshow(imd,[]); title('Original');
subplot(2,2,2); imshow(Nf,[]); title('Noise Over Original');
subplot(2,2,3); imshow(af5,[]); title('Filtered Image 5x5');
subplot(2,2,4); imshow(af3,[]); title('Filtered Image 3x3');


%Part 2.1 
 
%2-D fouirer transform
 ftf= fft2(imd); %orignal image
 ftn= fft2(N);%noise signal
 ftfn=fft2(Nf);%noise and orginal image
 
 %shifts 
 sftf = fftshift(ftf); %shifted ft of original 
 sftn = fftshift(ftn); %shifted ft of noise signal 
 sftfn = fftshift(ftfn); %shifted ft of orignal and noise 
 
 %magnitudes
 af=log(abs(sftf));
 an=log(abs(sftn));
 afn=log(abs(sftfn));
 
 figure(4)
 
subplot(2,2,1); imshow(af,[]); title('Original Shift FT');
subplot(2,2,2); imshow(an,[]); title('Shift Noisy FT');
subplot(2,2,3); imshow(afn,[]); title('Shift Filtered FT');
 
 
% part 2.2/2.3
%lp dimensions
lp= zeros(300,300);
lp(96:202,97:203)= 1;
 
%lowpassing

imlp = sftfn.*lp;
imlp_real = real(log(imlp));

%Inversing

imlp_inv = ifftshift(imlp);
imlp_inv = ifft2(imlp_inv);

figure(5)
subplot(2,2,1)
imshow(imd,[])%orignal image\
title('original image')
subplot(2,2,2)
imshow(lp,[])%lowpass
title('lowpass region')
subplot(2,2,3)
imshow(imlp_real,[])%freq sepctrum of lpfilter image
title('freq spectrum after LP')
subplot(2,2,4)
imshow(imlp_inv)%reconstructed image after lp
title('reconstruted image after LP')



%part 3.1 

br= ones(300,300);
br(136:164,78:99)=0;
br(78:99,136:164)=0;
br(195:237,134:172)=0;
br(134:172,195:237)=0;

%bandrejecting 

imbr = sftfn.*br;
imbr_real= abs(log(imbr));

%Inversing
imbr_inv = ifft2(ifftshift(imbr));

figure(6)
subplot(2,2,1)
imshow(imd,[])%orignal image\
title('original image')
subplot(2,2,2)
imshow(br,[])%lowpass
title('bandreject region')
subplot(2,2,3)
imshow(imbr_real,[])%freq sepctrum of lpfilter image
title('freq spectrum after BR')
subplot(2,2,4)
imshow(imbr_inv)%reconstructed image after lp
title('reconstruted image after BR')





