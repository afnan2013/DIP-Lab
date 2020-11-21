close all;
clc;

wmask = [1 1 1; 1 1 1; 1 1 1]/9;



r = imread('child2.jpg');
gr = rgb2gray(r);

figure(1);
subplot(1,2,1); imshow(gr); title('Original Image');

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

for i=2:R-1
    for j=2:C-1
        sum =0;
        c = temp(i-1:i+1, j-1:j+1);
      
        innermul = wmask.*c;
        [r,c] = size(innermul);
        for p=1:r
            for q=1:c
                sum = sum+innermul(p,q);
            end
        end
        
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
subplot(1,2,2); imshow(new); title('After blurring');


mask = ones(9,9)/81;
blur = imfilter(gr,mask);

figure(2);
new = uint8(new);
imshow(blur); title('After Blurring');