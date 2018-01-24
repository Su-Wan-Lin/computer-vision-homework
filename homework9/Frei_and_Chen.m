%Frei and Chen's Gradient Operator
function FCG=Frei_and_Chen(image4,threshold) 
image4=imread('lena.bmp');

b=im2double(image4); 
[m,n]=size(image4); 
newimage_robert=zeros(size(image4)); 
threshold=30;


% Frei and Chen's Gradient Operator
L(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3;
        r1=-1*b(i,j)-sqrt(2)*b(i,j+1)-1*b(i,j+2)+0+0+0+1*b(i+2,j)+sqrt(2)*b(i+2,j+1)+1*b(i+2,j+2); 
        L(i,j)=r1*r1;
    end
end
M(1:m,1:n)=0; 
for i=1:m-3;
    for j=1:m-3;
        r2=-1*b(i,j)+0+1*b(i,j+2)-sqrt(2)*b(i+1,j)+0+sqrt(2)*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2); 
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
imwrite(newimage_robert,'FCG.bmp') 
figure;
FCG=imread('FCG.bmp'); 
[m,n]=size(FCG);

for i=1:m
    for j=1:n
        if FCG(i,j)>threshold 
           FCG(i,j)=0;
        else
           FCG(i,j)=1;
        end
    end
end
imshow(uint8(FCG)*255); 
imwrite(uint8(FCG)*255,'FCG_thres.bmp') 
end
