function mvl=MVL(image3,threshold) 
image3=imread('lena.bmp');

b=im2double(image3); 
[m,n]=size(image3); 
newimage_robert=zeros(size(image3)); 
threshold=15;

L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3;
        L(i,j)=1/3*(2*b(i,j)-1*b(i,j+1)+2*b(i,j+2)-1*b(i+1,j)-4*b(i+1,j+1)-1*b(i+1,j+2)+2*b(i+2,j)-1*b(i+2,j +1)+2*b(i+2,j+2));
    end
end

for i=1:m-3;
    for j=1:m-3;
        newimage_mvl(i,j)= L(i,j);
    end
end
figure;
imshow(newimage_mvl); 
imwrite(newimage_mvl,'mvl.bmp')

figure;
mvl = imread('mvl.bmp'); 
[m,n]=size(mvl);

for i=1:m
    for j=1:n
        if mvl(i,j)>threshold mvl(i,j)=0;
        else
           mvl(i,j)=1;
        end
    end
end
imshow(uint8(mvl)*255); 
imwrite(uint8(mvl)*255,'mvl_thres.bmp') 
end

 
 