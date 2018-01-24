function [filtered_img]=boxfive(image)

image=imread('sap_noise2.bmp'); 
figure;
imshow(image);
[height,width] = size(image); 
filtered_img = zeros(height,width); 
for i = 1:height-4
    for j = 1:width-4 
        sum =0;
        for k = i:i+4
            for l = j:j+4
                sum=sum+image(k,l); 
                filtered_img(i+1,j+1)=sum/25;
            end
        end
        filtered_img(i+1,j+1) = mean2(image(i:i+4,j:j+4));
    end
end
filtered_img=uint8(filtered_img);
figure;
imshow(filtered_img); 
imwrite(filtered_img,'boxfive_sap_noise2.bmp');
end