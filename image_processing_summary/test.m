
images = imageDatastore(fullfile(toolboxdir('vision'),'visiondata', ...
    'calibration','test'));

[imagePoints,boardSize] = detectCheckerboardPoints(images.Files);
squareSize = 15000; % millimeters
worldPoints = generateCheckerboardPoints(boardSize,squareSize);

I = imread('fisheyesquare.png'); 
imageSize = [size(I,1) size(I,2)];
params = estimateFisheyeParameters(imagePoints,worldPoints,imageSize);


J1 = undistortFisheyeImage(I,params.Intrinsics);
figure
imshowpair(I,J1,'montage')
title('Original Image (left) vs. Corrected Image (right)')

J2 = undistortFisheyeImage(I,params.Intrinsics,'OutputView','valid');
figure
imshow(J2)
title('Full Output View')