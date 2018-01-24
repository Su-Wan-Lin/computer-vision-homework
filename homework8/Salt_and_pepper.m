image=imread('lena.bmp');
figure;
imshow(image); 
[height,width]=size(image);
X=rand(512,512);

p=0.05; 
pp=1-p;
for i=1:height
    for j=1:width
        if  X(i,j)<p 
            image(i,j)=0;
        else if X(i,j)>pp 
                image(i,j)=255;
        else
        image(i,j)=image(i,j);
            end
        end
    end
end
figure;
imshow(image); 
imwrite(image,'sap_noise1.bmp');

