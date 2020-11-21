clear;
clc;

img=imread('cameraman.tif');
[r,c] = size(img);
figure(1);
subplot(231),imshow(img),title('Original Image');

M = 128;
N = 128;
n = 2;
D0 = 20;
 
lowpass = blpfilter('btw',M,N,D0,n);
highpass = bhpfilter('btw',M,N,D0,n);

figure(1);
subplot(232),imshow(lowpass),title('Low Pass Filter Image');
subplot(233),imshow(highpass),title('High Pass Filter Image');

%adding padding
lpf = [lowpass(:,:),lowpass(:,:);lowpass(:,:),lowpass(:,:)];
hpf = [highpass(:,:),highpass(:,:);highpass(:,:),highpass(:,:)];

% Fourrier transformation
Fourrier=fft2(double(img),size(img,1),size(img,2)); 

F=fftshift(Fourrier);


 
% Multiply the Fourier spectrum by the LPF & HPF and apply the inverse discrete Fourier transform
 
LPF_img=real(ifft2(lpf.*F)); 
HPF_img=real(ifft2(hpf.*F)); 

figure(1);
LPF_img=LPF_img(1:256, 1:256); 
subplot(234),imshow(uint8(LPF_img)),title('Lowpass Filtered Image');
HPF_img=HPF_img(1:256, 1:256); 
subplot(235),imshow(uint8(HPF_img)),title('Highpass Filtered Image');
%figure(2);
%subplot(234),imshow(LPF_cameraman, []),title('Lowpass Filtered Image');
%subplot(235),imshow(HPF_cameraman, []),title('Highpass Filtered Image');


