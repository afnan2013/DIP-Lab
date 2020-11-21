clear; 
clc;
import medfilt_th.*

img = imread('miranda.PNG');

g_img = rgb2gray(img);
 
n_img = imnoise(g_img,'salt & pepper');

img_m = medfilt2(g_img);
img1 = medfilt_th(n_img,3,10);
img2 = medfilt_th(n_img,3,20);
img3 = medfilt_th(n_img,3,30);
img4 = medfilt_th(n_img,3,40);
img5 = medfilt_th(n_img,3,100);
img6 = medfilt_th(n_img,3,120);

figure(1);
subplot(1,3,1); imshow(g_img); title('Fig 2.1(Original Image)');
subplot(1,3,2); imshow(n_img); title('Fig 2.2(Noisy Miranda image)');
subplot(1,3,3); imshow(img_m); title('Fig 2.3(Filtered by Median filtering');

figure(2);
subplot(1,3,1); imshow(img1); title('Fig 2.4(for threshold = 10)');
subplot(1,3,2); imshow(img2); title('Fig 2.5(for threshold = 20)');
subplot(1,3,3); imshow(img3); title('Fig 2.6(for threshold = 30)');

figure(3);
subplot(1,3,1); imshow(img4); title('Fig 2.7(for threshold = 40)');
subplot(1,3,2); imshow(img5); title('Fig 2.8(for threshold = 100)');
subplot(1,3,3); imshow(img6); title('Fig 2.9(for threshold = 120)');









