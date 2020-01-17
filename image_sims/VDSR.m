
%
% use command load('trainedVDSR-Epoch-100-ScaleFactors-234.mat');
% to download VDSR network, only works on 2018b and maybe 2019b versions
% as far as I know.
% Will not work if you dont have this downloaded.


lowresimage = imread('CubeSenseEarth.jpg');

 figure(1)
 imshow(lowresimage)

%converts file to double precision, necessary for network to function
 lowresimage = im2double(lowresimage);



%make upscaled image of desired size (scale factor = 4 here)
Ibicubic = imresize(lowresimage, 4, 'bicubic');

%converts image to luminance Y and chrominance Cb, Cr
Iycbcr = rgb2ycbcr(lowresimage);
Iy = Iycbcr(:,:,1);
Icb = Iycbcr(:,:,2);
Icr = Iycbcr(:,:,3);

%upscale luminance + chrominance channels
Iy_bicubic = imresize(Iy,4,'bicubic');
Icb_bicubic = imresize(Icb,4,'bicubic');
Icr_bicubic = imresize(Icr,4,'bicubic');

%makes residual image using deep learning network
% Iresidual = activations(net,Iy_bicubic,41);
% Iresidual = double(Iresidual);
% figure(5)
% imshow(Iresidual,[])
% title('Residual Image from VDSR')


%superres image = bicubic upsided luminance + residual image
Isr = Iy_bicubic + Iresidual;

%convert back to rgb
figure(10)
Ifinal = ycbcr2rgb(cat(3,Isr,Icb_bicubic,Icr_bicubic));
imshow(Ifinal)
title('High-Resolution Image Obtained Using VDSR')


%im1 = imread('CubeSenseEarth.jpg');
%im2 = imread('Image.png');
%im3 = imread('CubeSenseEarth_new.jpg');
%im4 = imread('NewImage.png');

%figure(20)
%montage({im1, im2, im3, im4})

%figure(21)
%montage({im1, im2, im3, im4})
