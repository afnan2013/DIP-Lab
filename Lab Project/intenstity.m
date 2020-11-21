clear;
clc;

img = imread('child1.jpg');
img_double=im2double(img);

s=img_double;
[r,c]= size(img_double);
factor = .6;

for i=1:r
    for j=1:c
        s(i,j)=factor* log(1+img_double(i,j));
    end
end

figure(1);
subplot(1,2,1);
imshow(img);
title('Before');

subplot(1,2,2);
imshow(s);
title('After Intensity Change by Log');

%imwrite(s,'new_child1.jpg');