
a=imread('Cute-Baby-In-Yellow-Cap.jpg')

r = a(:,:,1);
g = a(:,:,2);
b = a(:,:,3);


u(:,:,1)= r;
u(:,:,2)= g;
u(:,:,3)= b;

figure,imshow(u);

for i=1: size (g,1)
  for  j=1: size(g,2)
    a=g(i,j);
    a=255-a;
    g(i,j)=a;
  end
end

u(:,:,1)= r;
u(:,:,2)= g;
u(:,:,3)= b;



figure,imshow(u);


