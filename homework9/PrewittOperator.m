function prewitt=PrewittOperator(image,threshold) 
image=imread('lena.bmp');

b=im2double(image); 
[m,n]=size(image); 
newimage_robert=zeros(size(image)); 
threshold=25;
L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3; 
        r1=-1*b(i,j)+-1*b(i,j+1)+-1*b(i,j+2)+0+0+0+1*b(i+2,j)+1*b(i+2,j+1)+1*b(i+2,j+2);
        L(i,j)=r1*r1;
    end
end
M(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3; 
        r2=-1*b(i,j)+0+1*b(i,j+2)-1*b(i+1,j)+0+1*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2); 
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
imwrite(newimage_robert,'prewitt.bmp') 
figure;
prewitt = imread('prewitt.bmp'); 
[m,n]=size(prewitt);
for i=1:m
    for j=1:n
        if prewitt(i,j)>threshold
           prewitt(i,j)=0;
        else
            prewitt(i,j)=1;
        end
    end
end
imshow(uint8(prewitt)*255); 
imwrite(uint8(prewitt)*255,'prewitt_thres.bmp') 
end

 