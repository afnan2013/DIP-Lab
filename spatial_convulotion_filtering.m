close all;
clc;

wmask = [0 1 0; 
        1 -4 1; 
        0 1 0];

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
        c = double(c);
        for a=1:3
            for b=1:3
               sum = sum + c(a,b)*wmask(4-a,4-b);   %convolution filtering, w(s,t)*f(x-s, y-t)
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
subplot(1,2,2); imshow(new); title('After Filtering');