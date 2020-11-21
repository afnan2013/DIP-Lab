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

r = size(ref,1);
c = size(ref,2);

refhe = uint8(zeros(r,c));   %histogram equalisation he final output
pixels = r*c;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
rout = zeros(256,1);

for i=1:r
    for j=1:c
        value = ref(i,j);
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
    rout(i)=round(cdf(i)*L);
end

for i=1:r
    for j=1:c
        refhe(i,j)=rout(ref(i,j)+1);
    end
end

output = uint8(zeros(r,c));
for i=1:r
    for j=1:c
       for k=1:256
           if rout(k)>= he(i,j);
               break;
           end
       end
       output(i,j) = k-1;
    end
end


figure(2);

subplot(2,2,1); imshow(img); title('Input Image');
subplot(2,2,2); imshow(ref); title('Reference Image');
subplot(2,2,3); imshow(output); title('Output Image');

