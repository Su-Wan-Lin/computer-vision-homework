function [filtered_img]=boxthree(image)

image=imread('gau_noise1.bmp'); 
figure;
imshow(image);

[height,width] = size(image); 
filtered_img = zeros(height,width); 
for i = 1:height-2
    for j = 1:width-2 
        sum =0;
        for k = i:i+2
            for l = j:j+2
                sum=sum+image(k,l); 
                filtered_img(i+1,j+1)=sum/9;
            end
        end
        filtered_img(i+1,j+1) = mean2(image(i:i+2,j:j+2));
    end
end
filtered_img=uint8(filtered_img);
figure;
imshow(filtered_img); 
imwrite(filtered_img,'boxthree_gau_noise1.bmp');
end
