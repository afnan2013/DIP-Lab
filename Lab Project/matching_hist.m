clc;
clear;
close all;

img = imread('rail.jpeg');
ref = imread('child1.jpg');

%Input Image Histogram equalistaion
r = size(img,1);
c = size(img,2);

imgh = uint8(zeros(r,c));

n = r*c;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);

for i=1:r
    for j=1:c
        value = img(i,j);
        f(value+1) = f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end
sum = 0;
L = 256-1;
for i=1: size(pdf)
    sum = sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*L);
end

for i=1:r
    for j=1:c
        imgh(i,j)=out(img(i,j)+1);
    end
end

%Reference Image Histogram equalistaion
rr = size(ref,1);
rc = size(ref,2);

rh = uint8(zeros(rr,rc));

rn = r*c;

rf = zeros(256,1);
rpdf = zeros(256,1);
rcdf = zeros(256,1);
rcum = zeros(256,1);
rout = zeros(256,1);

for i=1:r
    for j=1:c
        rvalue = ref(i,j);
        rf(rvalue+1) = rf(rvalue+1)+1;
        rpdf(rvalue+1)=rf(rvalue+1)/n;
    end
end
rsum = 0;
rL = 255;
for i=1: size(rpdf)
    rsum = rsum+rf(i);
    rcum(i)=rsum;
    rcdf(i)=rcum(i)/rn;
    rout(i)=round(rcdf(i)*rL);
end

for i=1:r
    for j=1:c
        rh(i,j)=rout(ref(i,j)+1);
    end
end

output = uint8(zeros(r,c));
for i=1:r
    for j=1:c
       for k=1:256
           if rout(k)>= imgh(i,j)
               break;
           end
       end
       output(i,j) = k-1;
    end
end

figure(1);
subplot(2,3,1);imshow(img);title('Input');
subplot(2,3,2);imshow(ref);title('Reference');
subplot(2,3,3);imshow(output);title('Output');
subplot(2,3,4);imhist(img);title('Input');
subplot(2,3,5);imhist(ref);title('Reference');
subplot(2,3,6);imhist(output);title('Output');
