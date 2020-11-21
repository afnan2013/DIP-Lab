close all;
clc;

r = imread('Noisy.PNG');
gr = rgb2gray(r);

figure(1);
subplot(1,2,1); imshow(gr); title('Original Image');


[H,W] = size(gr);
new = zeros(H,W);

R=H+2;
C=W+2;

temp = zeros(R,C);

for i=2:R-1
    for j=2:C-1
       temp(i,j) = gr(i-1,j-1);    % value saving to temp array  
    end
end

t = zeros(1,9);

for i=2:R-1
    for j=2:C-1
        sum =0;
        f=1;
        c = temp(i-1:i+1, j-1:j+1);
        for p=1:3
            for q=1:3
                t(f)= c(p,q);      % 2D array to 1D array converstion
                f = f+1;
            end
        end
        
        for I=1:9
            for J=I+1:9
            if(t(I)>t(J))
                tempd = t(I);
                t(I) = t(J);
                t(J) = tempd;
            end
            end
        end
        
        gxy = t(5);    %median
        
        if(gxy>255)
            new(i-1,j-1) = 255;
        elseif(gxy<0)
            new(i-1,j-1) = 0;
        else
            new(i-1,j-1) = gxy;
        end
        
    end
end

figure(1);
new = uint8(new);
subplot(1,2,2); imshow(new); title('After Filtering');