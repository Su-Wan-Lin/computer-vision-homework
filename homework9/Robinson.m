function Robins = Robinson(image6,threshold)

image6= imread('lena.bmp');
image6 = im2double(image6); 
threshold=45;

m = zeros(3,3,8);
m(:,:,1) = [-1 0 1 ; -2 0 2; -1 0 1]; 
m(:,:,2) = [0 1 2 ;-1 0 1 ; -2 -1 0]; 
m(:,:,3) = [1 2 1 ; 0 0 0 ; -1 -2 -1]; 
m(:,:,4) = [2 1 0 ; 1 0 -1 ;0 -1 -2]; 
m(:,:,5) = [1 0 -1 ; 2 0 -2 ;1 0 -1]; 
m(:,:,6) = [0 -1 -2;1 0 -1 ; 2 1 0]; 
m(:,:,7) = [-1 -2 -1 ;0 0 0 ; 1 2 1]; 
m(:,:,8) = [-2 -1 0 ; -1 0 1 ; 0 1 2];

Am=zeros(size(image6,1), size(image6,2),8);
for i=1:8
    Am(:,:,i) = imfilter(image6,m(:,:,i));
end
Ak = max(Am,[],3);
%n = 255 / (max(Ak(:)) - min(Ak(:))); 
%pic = uint8(n * Ak);

figure;
imshow(Ak); 
imwrite(Ak,'Robinson.bmp') 
figure; 
Robinson=imread('Robinson.bmp'); 
[m,n]=size(Robinson);

for i=1:m
    for j=1:n
        if Robinson(i,j)>threshold 
           Robinson(i,j)=0;
        else
           Robinson(i,j)=1;
        end
    end
end
imshow(uint8(Robinson)*255); 
imwrite(uint8(Robinson)*255,'Robinson_thres.bmp') 
end
