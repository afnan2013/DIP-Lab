clear;
clc;

img = imread('rail.jpeg');
grayIm = rgb2gray(img);

[H,W] = size(grayIm);

histo = zeros(256,1);

for i=1:H
    for j=1:W
        temp=grayIm(i,j)+1;
        histo(temp)=histo(temp)+1;
    end
end

r = size(img,1);
c = size(img,2);

he = uint8(zeros(r,c));   %histogram equalisation he final output
pixels = r*c;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);

for i=1:r
    for j=1:c
        value = img(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/pixels;
    end
end

sum=0; 
L = 256-1;

for i=1:size(pdf)
    sum = sum+ f(i);
    cum(i)= sum;
    cdf(i)= cum(i)/pixels;
    out(i)=round(cdf(i)*L);
end

for i=1:r
    for j=1:c
        he(i,j)=out(img(i,j)+1);
    end
end


figure(1);
subplot(2,2,1);
imshow(img);
title('Real Image');

subplot(2,2,2);
bar(histo);   
title('Histogram');

subplot(2,2,3);
imshow(he);
title('Equalisation');

subplot(2,2,4);
imhist(he);
title('Histrogram Equalisation');


figure(2);
subplot(2,2,1);
imshow(img);
title('Real Image');

subplot(2,2,2);
imhist(img);   
title('Histogram');

subplot(2,2,3);
hequal = histeq(img);
imshow(hequal);
title('Equalisation');

subplot(2,2,4);
imhist(hequal);
title('Histrogram Equalisation');