function lap2=lapaican_2(image2,threshold) 
image2=imread('lena.bmp');

b=im2double(image2); 
[m,n]=size(image2); 
newimage_lap2=zeros(size(image2)); 
threshold=15;
L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3;
        L(i,j)=1/3*(1*b(i,j)+1*b(i,j+1)+1*b(i,j+2)+1*b(i+1,j)-8*b(i+1,j+1)+1*b(i+1,j+2)+1*b(i+2,j)+1*b(i+ 2,j+1)+1*b(i+2,j+2));
    end
end
for i=1:m-3;
    for j=1:m-3;
        newimage_lap2(i,j)= L(i,j);
    end
end

figure;
imshow(newimage_lap2); 
imwrite(newimage_lap2,'lap2.bmp')

figure;
lap2 = imread('lap2.bmp'); 
[m,n]=size(lap2);

for i=1:m
    for j=1:n
        if lap2(i,j)>threshold 
           lap2(i,j)=0;
        else
           lap2(i,j)=1;
        end
    end
end

imshow(uint8(lap2)*255); 
imwrite(uint8(lap2)*255,'lap2_thres.bmp') 
end

