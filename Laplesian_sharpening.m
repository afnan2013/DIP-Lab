close all;
clc;

%wmask = [1 1 1; 1 1 1; 1 1 1];

%wmask = [1 2 1; 2 4 2; 1 2 1];

r = imread('child2.jpg');
gr = rgb2gray(r);

figure(1);
subplot(1,2,1); 
imshow(gr); 
title('Original Image');

%w = gr(1:4,1:4);

[H,W] = size(gr);
new = zeros(H,W);

R=H+2;
C=W+2;

temp = zeros(R,C);

for i=2:R-1
    for j=2:C-1
       temp(i,j) = gr(i-1,j-1);
    end
end

c=-1;

for i=2:R-1
    for j=2:C-1
        sum = temp(i+1,j)+ temp(i-1,j)+temp(i,j+1)+temp(i,j-1)-4*temp(i,j);
        sum = temp(i,j)+ c*sum;
        if(sum>255)
            new(i-1,j-1) = 255;
        elseif(sum<0)
            new(i-1,j-1) = 0;
        else
            new(i-1,j-1) = sum;
        end
        
    end
end

figure(1);
new = uint8(new);
subplot(1,2,2); 
imshow(new); 
title('After Sharpening');