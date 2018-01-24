function Nev = Nevati(image7,threshold) 
image7 = imread('lena.bmp');
image7 = im2double(image7); 
threshold=155;
m = zeros(5,5,6);
m(:,:,1) = [100 100 100 100 100 ; 100 100 100 100 100; 0 0 0 0 0 ;-100 -100 -100 -100 -100 ;-100 -100 -100 -100 -100];
m(:,:,2) = [100 100 100 100 100 ; 100 100 100 78 -32; 100 92 0 -92 -100 ;32 -78 -100 -100 -100 ;-100 -100 -100 -100 -100];
m(:,:,3) = [100 100 100 32 -100 ; 100 100 92 -78 -100; 100 100 0 -100 -100 ;100 78 -92 -100 -100 ;100 -32 -100 -100 -100];
m(:,:,4) = [-100 -100 0 100 100 ; -100 -100 0 100 100; -100 -100 0 100 100 ;-100 -100 0 100 100 ;-100 -100 0 100 100];
m(:,:,5) = [-100 32 100 100 100 ; -100 -78 92 100 100; -100 -100 0 100 100 ;-100 -100 -92 78 100 ;-100 -100 -100 -32 100];
m(:,:,6) = [100 100 100 100 100 ; -32 78 100 100 100; -100 -92 0 92 100 ;-100 -100 -100 -78 32 ;-100 -100 -100 -100 -100];
Am=zeros(size(image7,1),size(image7,2),6);
for i=1:6
    Am(:,:,i) = imfilter(image7,m(:,:,i),'same'); 
end
Ak = max(Am,[],3);
n =(max(Ak(:)))/255;
pic = uint8(n*Ak);
figure;
imshow(pic); 
imwrite(pic,'Nevatin.bmp')
pic
figure;
Nevatin = imread('Nevatin.bmp'); 
[m,n]=size(Nevatin);
for i=1:m
    for j=1:n
        if Nevatin(i,j)>threshold
           Nevatin(i,j)=0;
        else
           Nevatin(i,j)=1; 
        end
    end
end
imshow(uint8(Nevatin)*255); 
imwrite(uint8(Nevatin)*255,'Nevatin_thres.bmp') 
end