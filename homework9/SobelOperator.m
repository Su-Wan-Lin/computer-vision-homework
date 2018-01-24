function sobel=SobelOperator(image3,threshold) 
image3=imread('lena.bmp'); 
b=im2double(image3);
[m,n]=size(image3); 
newimage_robert=zeros(size(image3)); 
threshold=36;

%Sobel
L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3; 
        r1=-1*b(i,j)+-2*b(i,j+1)+-1*b(i,j+2)+0+0+0+1*b(i+2,j)+2*b(i+2,j+1)+1*b(i+2,j+2);
        L(i,j)=r1*r1;
    end
end
M(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3; 
        r2=-1*b(i,j)+0+1*b(i,j+2)-2*b(i+1,j)+0+2*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2); 
        M(i,j)=r2*r2;
    end
end
for i=1:m-3;
    for j=1:m-3;
        gradient =sqrt(L(i,j)+M(i,j)); 
        newimage_robert(i,j)= gradient;
    end
end
figure;
imshow(newimage_robert); 
imwrite(newimage_robert,'Sobel.bmp') 
figure;
Sobel = imread('Sobel.bmp'); 
[m,n]=size(Sobel);
for i=1:m
    for j=1:n
        if Sobel(i,j)>threshold
           Sobel(i,j)=0;
        else
           Sobel(i,j)=1;
        end
    end
end
imshow(uint8(Sobel)*255); 
imwrite(uint8(Sobel)*255,'Sobel_thres.bmp') 
end
 