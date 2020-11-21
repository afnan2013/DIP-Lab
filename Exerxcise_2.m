close all;
clc;

wmask = [1 1 1; 1 1 1; 1 1 1];

gr = imread('cameraman.tif');

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

for i=2:R-1
    for j=2:C-1
        sum =0;
        c = temp(i-1:i+1, j-1:j+1);
        c = double(c);
        innermul = wmask.*c;
        [r,c] = size(innermul);
        for p=1:r
            for q=1:c
                sum = sum+innermul(p,q);
            end
        end
        
        sum = sum/9;
        
        if(sum>255)
            new(i-1,j-1) = 255;
        elseif(sum<0)
            new(i-1,j-1) = 0;
        else
            new(i-1,j-1) = sum;
        end
        
    end
end

gmask = zeros(H,W);
unsharp = zeros(H,W);
highboost = zeros(H,W);

k1=1;   %unsharp masking
k2=20;   %highboost image 

for i=1:H
    for j=1:W
       gmask(i,j) = gr(i,j)- new(i,j);
       unsharp(i,j) = gr(i,j) + k1*gmask(i,j);
       highboost(i,j) = gr(i,j) + k2*gmask(i,j);
    end
end

new = uint8(new);
gmask = uint8(gmask);
unsharp = uint8(unsharp);
highboost = uint8(highboost);

figure(1);
subplot(1,3,1); imshow(gr); title('Fig:2.1(Original Image cameraman.tif)');
subplot(1,3,2); imshow(new); title('Fig:2.2(Blurred Image)');
subplot(1,3,3); imshow(unsharp); title('Fig:2.3(Sharpened by self-defined unsharp mask)');
