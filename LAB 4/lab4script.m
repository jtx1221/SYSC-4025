%Lab#4
%--------------------------------------------------------------


clear
%Part 1.1
imog=imread('img.jpeg');
f= im2double(imog);


%Part 1.2

h=fspecial('gaussian',10,10);
g=imfilter(f,h,'conv','circular');


%Part 1.3

K=0.005;

ff= deconvwnr(g,h,K);


figure(1)
subplot(2,2,1)
imshow(f)
title('orignal')
subplot(2,2,2)
imshow(g)
title('blurred')
subplot(2,2,3)
imshow(ff)
title('restored image')
%---------------------------------------------------------------

%Part 2.1/2.2

wg=imnoise(g,'gaussian');

cwg= deconvwnr(wg,h,0);

max= max(wg(:))
min= min(wg(:))
std= std(wg(:))
snr= 20*log10((max-min)/std)
k=1/snr


rwg= deconvwnr(wg,h,k);




htb=deconvwnr(wg,h,k*100);
hts= deconvwnr(wg,h,k*0.001);



figure(2)
subplot(2,2,1)
imshow(wg)
title('White Gaussian')
subplot(2,2,2)
imshow(cwg)
title('Restored')
subplot(2,2,3)
imshow(rwg)
title('Restored SNR')


figure(3)
subplot(2,2,1)
imshow(htb)
title('100xlarge')

subplot(2,2,2)
imshow(hts)
title('100xsmaller')
%--------------------------------------------------------------
%Part 3

 
for i =0:0.1:5

    
    rwg= deconvwnr(wg,h,i);
    MME = immse(f,rwg);
fprintf('the error is: %d with a k vaule of: %d \n', MME,i)

end



 ik= deconvwnr(wg,h,k);
 
 figure(4)
 
 imshow(ik)
title(

