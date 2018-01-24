function ks = Kirsch(image5,threshold) 
image5 = imread('lena.bmp');
image5= im2double(image5); 
threshold=135;
m = zeros(3,3,8);
m(:,:,1) = [-3 -3 5; -3 0 5; -3 -3 5];
m(:,:,2) = [-3 5 5; -3 0 5; -3 -3 -3];
m(:,:,3) = [5 5 5; -3 0 -3; -3 -3 -3];
m(:,:,4) = [5 5 -3; 5 0 -3; -3 -3 -3];
m(:,:,5) = [5 -3 -3; 5 0 -3; 5 -3 -3];
m(:,:,6) = [-3 -3 -3; 5 0 -3; 5 5 -3];
m(:,:,7) = [-3 -3 -3; -3 0 -3; 5 5 5];
m(:,:,8) = [-3 -3 -3; -3 0 5; -3 5 5]; 
Am=zeros(size(image5,1), size(image5,2),8); 
for i=1:8
    Am(:,:,i) = imfilter(image5,m(:,:,i));
end
Ak = max(Am,[],3);
figure;
imshow(Ak); 
imwrite(Ak,'Kirsch.bmp') 
figure; 
Kirsch=imread('Kirsch.bmp'); 
[m,n]=size(Kirsch);

for i=1:m
    for j=1:n
        if Kirsch(i,j)>threshold 
           Kirsch(i,j)=0;
        else
           Kirsch(i,j)=1;
        end
    end
end
imshow(uint8(Kirsch)*255); 
imwrite(uint8(Kirsch)*255,'Kirsch_thres.bmp') 
end

 