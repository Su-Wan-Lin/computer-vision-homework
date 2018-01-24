function lap1=lapaican_1(image1,threshold)

image1=imread('lena.bmp'); 
b=im2double(image1); 
[m,n]=size(image1); 
newimage_lap1=zeros(size(image1)); 
threshold=15;

L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3; 
        L(i,j)=0+1*b(i,j+1)+0+1*b(i+1,j)-4*b(i+1,j+1)+1*b(i+1,j+2)+0+1*b(i+2,j+1)+0;
    end
end

for i=1:m-3;
    for j=1:m-3;
        newimage_robert(i,j)= L(i,j);
    end
end

figure;
imshow(newimage_robert); 
imwrite(newimage_robert,'lapl.bmp')

figure;
lapl = imread('lapl.bmp'); 
[m,n]=size(lapl);

for i=1:m
    for j=1:n
        if lapl(i,j)>threshold 
           lapl(i,j)=0;
        else
           lapl(i,j)=1;
        end
    end
end
imshow(uint8(lapl)*255); 
imwrite(uint8(lapl)*255,'lapl_thres.bmp') 
end

 