close all;
clc;

w1 = [-1 0; 0 1];

w2 = [1 0; 0 -1];

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

c=1;

for i=2:R-1
    for j=2:C-1
        sum1=0;
        sum2=0;
        cut = temp(i:i+1, j:j+1);
        cut = double(cut);
        innermul = w1.*cut;
        [r,c] = size(innermul);
        for p=1:r
            for q=1:c
                sum1 = sum1+innermul(p,q);
            end
        end
        
        innermul = w2.*cut;
        [r,c] = size(innermul);
        for p=1:r
            for q=1:c
                sum2 = sum2+innermul(p,q);
            end
        end
        
        sum1 = abs(sum1);
        sum2 = abs(sum2);
        
        sum = sum1+sum2;
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
subplot(1,2,2); imshow(new); title('After Robert Cross Gradient Sharpening');