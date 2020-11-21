clear;
clc;

img = imread('rail.jpeg');
img_double=im2double(img);

s=img_double;
[r,c]= size(img_double);
factor = .5;

for i=1:r
    for j=1:c
        s(i,j)=factor * img_double(i,j)^0.5;
    end
end

figure(1);
subplot(1,2,1);
imshow(img);
title('Before');

subplot(1,2,2);
imshow(s);
title('After Gamma Correction');