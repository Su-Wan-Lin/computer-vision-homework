%function robert=RobertOperator(image,threshold) 
image=imread('lena.bmp');
b=im2double(image); 
[m,n]=size(image);

newimage_robert=zeros(size(image)); 
threshold=10;
L(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2; 
        r1=-1*b(i,j)+0+0+1*b(i+1,j+1);
        L(i,j)=r1*r1;
    end
end
M(1:m,1:n)=0; 
for i=1:m-2;
    for j=1:m-2; 
        r2=0-1*b(i,j+1)+1*b(i+1,j)+0; 
        M(i,j)=r2*r2;
    end
end
for i=1:m-2;
    for j=1:m-2;
        gradient =sqrt(L(i,j)+M(i,j)); 
        newimage_robert(i,j)= gradient;
    end
end
figure;
imshow(newimage_robert); 
imwrite(newimage_robert,'robert.bmp') 
figure;
robert=imread('robert.bmp'); 
ROBERT1 = robert;
[m,n]=size(robert);

for i=1:m
    for j=1:n
        if robert(i,j)>threshold 
           robert(i,j)=0;
        else
            robert(i,j)=1;
        end
    end
end
imshow(uint8(robert)*255); 
imwrite(uint8(robert)*255,'robert_thres.bmp') 

 
 