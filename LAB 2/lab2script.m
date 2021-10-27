%SYSC 4205 Lab#2

%Part #1 
%(1)
ph= imread('phantomt.gif');
figure(1)
subplot(2,2,1)
imshow(ph)
title('Original Image')

%(2)
phd= im2double(ph);
subplot(2,2,2)
imshow(phd)
colorbar()
title('Converted Image')

 %(3)
R = radon(phd,0:179);
subplot(2,2,3)
imagesc(R)

colorbar()
title('Sinogram')



 %(4)
IR = iradon(R,0:179);
subplot(2,2,4)
imshow(IR)
colorbar()
title('Reconstructed Image')
 
 %--------------------------------------------------------------------
 
 %Part #2 
 %(1)
ps = radon(phd,0:5:179);
figure(2)
subplot(2,1,1)
imagesc(ps)
title('Sinogram')
colormap(hot)
colorbar()
%(2)
ips= iradon(ps,0:5:179);
subplot(2,1,2)
imshow(ips)
title('Reconstructed Image')
colorbar()

%(3)
figure(3)
subplot(2,2,1)
  imshow(phd)
  title('Converted Image')
  colorbar()

subplot(2,2,2)
 imshow(IR)
 colorbar()
 title('Reconstructed Image One')
 
 
subplot(2,2,3)
imshow(ips)
title('Reconstructed Image Two')
colorbar()


%(4)
 figure(4)
[f1,h1] = iradon(ps,0:5:179, 'Ram-Lak');
subplot(3,2,1)
imshow(f1)
title('Ram-Lak')
colorbar()

[f2,h2] = iradon(ps,0:5:179, 'Shepp-Logan');
subplot(3,2,2)
imshow(f2)
title('Shepp-Logan')
colorbar()


[f3,h3] = iradon(ps,0:5:179, 'Cosine');
subplot(3,2,3)
imshow(f3)
title('Cosine')
colorbar()


[f4,h4] = iradon(ps,0:5:179, 'Hamming');
subplot(3,2,4)
imshow(f4)
title('Hamming')
colorbar()


[f5,h5] = iradon(ps,0:5:179, 'Hann');
subplot(3,2,5)
imshow(f5)
title('Hann')
colorbar()

%filter responses
figure(5)
subplot(3,2,1)
imagesc(h1)
title('Ram-Lak Filter Response')
colorbar()

subplot(3,2,2)
imagesc(h2)
title('Shepp-Logan Filter Response')
colorbar()

subplot(3,2,3)
imagesc(h3)
title('Cosine Filter Response')
colorbar()

subplot(3,2,4)
imagesc(h4)
title('Hamming Filter Response')
colorbar()

subplot(3,2,5)
imagesc(h5)
title('Hann Filter Response')
colorbar()


%(5)
psl = radon(phd,0:30:179);
figure(6)
subplot(2,1,1)
imagesc(psl)
title('Sinogram Larger Step 30')
colormap(hot)
colorbar()

ipsl= iradon(psl,0:30:179);
subplot(2,1,2)
imshow(ips)
title('Reconstructed Image Larger Step 30')
colorbar()


figure(7)
subplot(2,2,1)
  imshow(phd)
  title('Converted Image')
  colorbar()

subplot(2,2,2)
 imshow(IR)
 colorbar()
 title('Reconstructed Image One')
 
subplot(2,2,3)
imshow(ipsl)
title('Reconstructed Image Two Larger Step 30')
colorbar()










figure(8)
[f14,h14] = iradon(psl,0:30:179, 'Ram-Lak');
subplot(3,2,1)
imshow(f14)
title('Ram-Lak Step 30')
colorbar()

[f24,h24] = iradon(psl,0:30:179, 'Shepp-Logan');
subplot(3,2,2)
imshow(f24)
title('Shepp-Logan Step 30')
colorbar()


[f34,h34] = iradon(psl,0:30:179, 'Cosine');
subplot(3,2,3)
imshow(f34)
title('Cosine Step 30')
colorbar()


[f44,h44] = iradon(psl,0:30:179, 'Hamming');
subplot(3,2,4)
imshow(f44)
title('Hamming Step 30')
colorbar()


[f54,h54] = iradon(psl,0:30:179, 'Hann');
subplot(3,2,5)
imshow(f54)
title('Hann Step 30')
colorbar()




% ---------------------------------------------------------
%Part #3 
%(1)
figure(9)
ct= imread('cardiacCT.png');
ctc = rgb2gray(ct);
imshow(ctc);
  
%(2)
figure(10)
 ctd = im2double(ctc);
 subplot(2,2,1)
 imshow(ctd)
 colorbar()
 title('Converted Image')

 CR = radon(ctd);
 subplot(2,2,2)
 imagesc(CR)
 
 colorbar()
 title('Sinogram')
 

CIR = iradon(CR,0:179);
subplot(2,2,3)
imshow(CIR)
colorbar()
title('Reconstructed Image')
  
 

%(3)

psc = radon(ctd,0:5:179);
figure(11)
subplot(2,1,1)
imagesc(psc)
title('Sinogram')
colormap(hot)
colorbar()

ipsc= iradon(psc,0:5:179);
subplot(2,1,2)
imshow(ipsc)
title('Reconstructed Image')
colorbar()


figure(12)
subplot(2,2,1)
  imshow(ctc)
  title('Converted Image')
  colorbar()

subplot(2,2,2)
 imshow(CIR)
 colorbar()
 title('Reconstructed Image One')
 
 
subplot(2,2,3)
imshow(ipsc)
title('Reconstructed Image Two')
colorbar()

 figure(13)
[f1c,h1c] = iradon(psc,0:5:179, 'Ram-Lak');
subplot(3,2,1)
imshow(f1c)
title('Ram-Lak')
colorbar()

[f2c,h2c] = iradon(psc,0:5:179, 'Shepp-Logan');
subplot(3,2,2)
imshow(f2c)
title('Shepp-Logan')
colorbar()


[f3c,h3c] = iradon(psc,0:5:179, 'Cosine');
subplot(3,2,3)
imshow(f3c)
title('Cosine')
colorbar()


[f4c,h4c] = iradon(psc,0:5:179, 'Hamming');
subplot(3,2,4)
imshow(f4c)
title('Hamming')
colorbar()


[f5c,h5c] = iradon(psc,0:5:179, 'Hann');
subplot(3,2,5)
imshow(f5c)
title('Hann')
colorbar()


pslc = radon(ctd,0:30:179);
figure(14)
subplot(2,1,1)
imagesc(pslc)
title('Sinogram Larger Step 30')
colormap(hot)
colorbar()

ipslc= iradon(pslc,0:30:179);
subplot(2,1,2)
imshow(ipsc)
title('Reconstructed Image Larger Step 30')
colorbar()


figure(15)
subplot(2,2,1)
  imshow(ctd)
  title('Converted Image')
  colorbar()

subplot(2,2,2)
 imshow(CIR)
 colorbar()
 title('Reconstructed Image One')
 
subplot(2,2,3)
imshow(ipslc)
title('Reconstructed Image Two Larger Step 30')
colorbar()




figure(16)
[f14c,h14c] = iradon(pslc,0:30:179, 'Ram-Lak');
subplot(3,2,1)
imshow(f14c)
title('Ram-Lak Step 30')
colorbar()

[f24c,h24c] = iradon(pslc,0:30:179, 'Shepp-Logan');
subplot(3,2,2)
imshow(f24c)
title('Shepp-Logan Step 30')
colorbar()


[f34c,h34c] = iradon(pslc,0:30:179, 'Cosine');
subplot(3,2,3)
imshow(f34c)
title('Cosine Step 30')
colorbar()


[f44c,h44c] = iradon(pslc,0:30:179, 'Hamming');
subplot(3,2,4)
imshow(f44c)
title('Hamming Step 30')
colorbar()


[f54c,h54c] = iradon(pslc,0:30:179, 'Hann');
subplot(3,2,5)
imshow(f54c)
title('Hann Step 30')
colorbar()