clc; 
clear;

%Problem 1(i)
n = input('Input Dimention \n');
 
wH = zeros(n);      
wL = wH;

for i=1:n
    for j=1:n
        if i==ceil(n/2)
            wH(i,j) = 1;
        end
    end
end

for i=1:n
    for j=1:n
        if(i==j)
            wL(i,j)=1;
        end
    end
end

wV = rot90(wH);
wR = rot90(wL);
 
img = imread('coins.png');

ho = imfilter(double(img), wH/n);
ve = imfilter(double(img), wV/n);
leDi = imfilter(double(img), wL/n);
riDi = imfilter(double(img), wR/n);

all = imfilter(imfilter(imfilter(imfilter(double(img),wH/n),wV/n),wL/n),wR/n);

 
new_image1 = uint8(ho);
new_image2 = uint8(ve);
new_image3 = uint8(leDi);
new_image4 = uint8(riDi);
new_image5 = uint8(all);

figure(1);
subplot 231; imshow(img),title('Original Image');
subplot 232; imshow(new_image1),title('Horizontally Filtered Image');
subplot 233; imshow(new_image2),title('Vertically Filtered Image');
subplot 234; imshow(new_image3),title('Left Diagolanl Image');
subplot 235; imshow(new_image4),title('Right Diagonal Image');
subplot 236; imshow(new_image5),title('All Directional Image');
    
    
    
%Problem 1(ii)

img1 = imread('cameraman.tif');
 
imgd = im2double(img1);
nimg = imgd + (randn(size(img1))/10);
figure('Name','For Problem ii');
subplot 121 ;imshow(img1);title("Original Image");
subplot 122 ;imshow(nimg);title("Noisy Image");


%size 3
n=3;
wH = zeros(n);      
wL = wH;

for i=1:n
    for j=1:n
        if i==ceil(n/2)
            wH(i,j) = 1;
        end
    end
end

for i=1:n
    for j=1:n
        if(i==j)
            wL(i,j)=1;
        end
    end
end

wV = rot90(wH);
wR = rot90(wL);
 
ho3 = imfilter(double(nimg), wH/n);
ve3 = imfilter(double(nimg), wV/n);
leDi3 = imfilter(double(nimg), wL/n);
riDi3 = imfilter(double(nimg), wR/n);
all3 = imfilter(imfilter(imfilter(imfilter(double(nimg),wH/n),wV/n),wL/n),wR/n);
 
 
figure(3);
subplot 231;imshow(ho3);title('Horizontal Filtered Image With size 3');
subplot 232;imshow(ve3);title('Vertical Filtered Image With size 3');
subplot 233;imshow(leDi3);title('Left-diagonal Filtered Image With size 3');
subplot 234;imshow(riDi3);title('Right-diagonal Filtered Image With size 3');
subplot 235;imshow(all3);title('All directional Filtered Image With size 3');
 
 
 
%size 5
n=5;
wH = zeros(n);      
wL = wH;

for i=1:n
    for j=1:n
        if i==ceil(n/2)
            wH(i,j) = 1;
        end
    end
end

for i=1:n
    for j=1:n
        if(i==j)
            wL(i,j)=1;
        end
    end
end

wV = rot90(wH);
wR = rot90(wL);
 
ho5 = imfilter(double(nimg), wH/n);
ve5 = imfilter(double(nimg), wV/n);
leDi5 = imfilter(double(nimg), wL/n);
riDi5 = imfilter(double(nimg), wR/n);
all5 = imfilter(imfilter(imfilter(imfilter(double(nimg),wH/n),wV/n),wL/n),wR/n);
 
 
figure(4);
subplot 231;imshow(ho5);title('Horizontal Filtered Image With size 5');
subplot 232;imshow(ve5);title('Vertical Filtered Image With size 5');
subplot 233;imshow(leDi5);title('Left-diagonal Filtered Image With size 5');
subplot 234;imshow(riDi5);title('Right-diagonal Filtered Image With size 5');
subplot 235;imshow(all5);title('All directional Filtered Image With size 5');
 
%size 7
n=7;
wH = zeros(n);      
wL = wH;

for i=1:n
    for j=1:n
        if i==ceil(n/2)
            wH(i,j) = 1;
        end
    end
end

for i=1:n
    for j=1:n
        if(i==j)
            wL(i,j)=1;
        end
    end
end

wV = rot90(wH);
wR = rot90(wL);
 
ho7 = imfilter(double(nimg), wH/n);
ve7 = imfilter(double(nimg), wV/n);
leDi7 = imfilter(double(nimg), wL/n);
riDi7 = imfilter(double(nimg), wR/n);
all7 = imfilter(imfilter(imfilter(imfilter(double(nimg),wH/n),wV/n),wL/n),wR/n);
 
 
figure(5);
subplot 231;imshow(ho7);title('Horizontal Filtered Image With size 7');
subplot 232;imshow(ve7);title('Vertical Filtered Image With size 7');
subplot 233;imshow(leDi7);title('Left-diagonal Filtered Image With size 7');
subplot 234;imshow(riDi7);title('Right-diagonal Filtered Image With size 7');
subplot 235;imshow(all7);title('All directional Filtered Image With size 7');


