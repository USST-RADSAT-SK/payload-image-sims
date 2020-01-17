clf
A = imread('EarthImage.jpg');

Iguided = imguidedfilter(A);
Igaussian = imgaussfilt(A,2);

sigma =100 ;

Iflatfield = imflatfield(A,sigma);

locCon = localcontrast(A);
sharp = imsharpen(A);
figure(1)
montage({A,sharp,locCon});
title('Original, Sharpened, Locally Contrasted');
figure(2)
montage({A,Iguided,Iflatfield});
title('Original, Guided Filter, FlatField Filter');

%Now we will focus on a specific region with many borders!

bord=(A(100:400,100:400)); %new image
bordSharp=imsharpen(bord);
bordLocCon=localcontrast(bord);
figure(3)
montage({bord,bordSharp,bordLocCon});
title('Original, Sharpened, Locally Contrasted');