%total time after clicking 'run' will be about 5-10 minutes
four_pics = dir(sprintf('%s/*.jpg','input'));
tmp=dir(sprintf('%s/*.JPG','input'));
four_pics(length(four_pics)+1:length(four_pics)+length(tmp))=tmp;
images=[];
for id=1:length(four_pics)
    images{id}=double(imread(sprintf('%s/%s','input',four_pics(id).name)))/255;
    
end

sampleA = imread('input/IMG_0212.JPG');

[height, width, dim] = size(sampleA);

point1 = [1 1];
point2 = [width height];

for id=1:length(images)
    t2{id}=images{id}(point1(2):point2(2),point1(1):point2(1),1)*255;
end

image=sr_bw(t2,0,1)/255;

figure; imshow(image); title('super resolution image');

imwrite(image, 'outputimage/superres.jpg');


I = imread('outputimage/superres.jpg');


J = histeq(I);

figure(12)
imshow(J)

imwrite(J, 'outputimage/with_histogram.jpg');

fprintf("all done \n");
