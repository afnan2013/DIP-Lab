close all;
clc;

image = imread('cameraman.tif');

n = input('Input The Dimention of the Filter :\n');
 
wH = zeros(n);      
wA = wH;
wL = wH;

row = (n+1)/2;
for i=1:n    
    wH(row,i)=1;
end
wV = rot90(wH);

for i=1:n
    for j=1:n
        if(i==j)
            wL(i,j)=1;
        end
    end
end

wR = rot90(wL);

for i=1:n
    for j=1:n
       wA(i,j)=1;
    end
end

padded_image = padarray(input_image,[floor(n/2),floor(n/2)],0);
[numRow,numCol] = size(padded_image);
 
image1 = padded_image;
image2 = padded_image;
image3 = padded_image;
image4 = padded_image;
 
image5 = padded_image;
 
f = floor(n/2);
 
for r = ceil(n/2):(numRow - floor(n/2))
    for c = ceil(n/2):(numCol - floor(n/2))
        
        image1(r,c) = sum(sum(w1.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image2(r,c) = sum(sum(w2.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image3(r,c) = sum(sum(w3.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image4(r,c) = sum(sum(w4.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        
        image5(r,c) = sum(sum(w5.*double(padded_image(r-f:r+f,c-f:c+f))))/(n*n);
        
        
        
    end
end

 
new_image1 = uint8(image1);
new_image2 = uint8(image2);
new_image3 = uint8(image3);
new_image4 = uint8(image4);
new_image5 = uint8(image5);


figure(1);
subplot(1,3,1); imshow(image),title('Original Image');
subplot(1,3,2); imshow(new_image1),title('Horizontally Filtered Image');
subplot(1,3,3); imshow(new_image2),title('Vertically Filtered Image');

figure(2);
subplot(1,3,1); imshow(new_image3),title('Left Diagolanl Image');
subplot(1,3,2); imshow(new_image4),title('Right Diagonal Image');
subplot(1,3,3); imshow(new_image5),title('All Directional Image');


