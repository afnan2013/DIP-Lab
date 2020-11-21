close all;
clc;

wmask = [0 1 0; 1 -4 1; 0 1 0];
f = imread('child2.jpg');
gf = rgb2gray(f);

figure(1);
subplot(1,2,1); imshow(gf); title('Original Image');



[h,w] = size(gf);
new = zeros(h-2,w-2);
for i=2:h-1
    for j=2:w-1
        sum =0;
        c = gf(i-1:i+1, j-1:j+1);
        c = double(c);
        innermul = wmask.*c;
        [r,c] = size(innermul);
        for p=1:r
            for q=1:c
                sum = sum+innermul(p,q);
            end
        end
        new(i,j) = sum; 
    end
end

figure(1);
new = uint8(new);
subplot(1,2,2); imshow(new); title('After Filtering');