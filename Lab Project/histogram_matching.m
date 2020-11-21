close all;
clear;
clc;

img = imread('rail.jpeg');
ref = imread('child1.jpg');


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




imgr = img(:,:,1);
imgg = img(:,:,2);
imgb = img(:,:,3);

refr = ref(:,:,1);
refg = ref(:,:,2);
refb = ref(:,:,3);

Hrefr = imhist(refr);
Hrefg = imhist(refg);
Hrefb = imhist(refb);

resultr = histeq(imgr, Hrefr);
resultg = histeq(imgg, Hrefg);
resultb = histeq(imgb, Hrefb);

hist_match(:,:,1) = resultr;
hist_match(:,:,2) = resultg;
hist_match(:,:,3) = resultb;

figure(1);
subplot(2,3,1); imshow(ref); title('Reference Image');
subplot(2,3,2); imshow(img); title('Original Image');
subplot(2,3,3); imshow(hist_match); title('Output Image');
subplot(2,3,4); imhist(ref); title('R Histogram');
subplot(2,3,5); imhist(img); title('I Histogram');
subplot(2,3,6); imhist(hist_match); title('O Histogram');

figure(2);
subplot(3,3,1); imhist(imgr); title('Red Input');
subplot(3,3,2); imhist(imgg); title('Green Input');
subplot(3,3,3); imhist(imgb); title('Blue Input');

subplot(3,3,4); plot(Hrefr); title('Red Reference');
subplot(3,3,5); plot(Hrefg); title('Green Reference');
subplot(3,3,6); plot(Hrefb); title('Blue Reference');

subplot(3,3,7); imhist(resultr); title('Red Output');
subplot(3,3,8); imhist(resultg); title('Green Output');
subplot(3,3,9); imhist(resultb); title('Blue Output');

