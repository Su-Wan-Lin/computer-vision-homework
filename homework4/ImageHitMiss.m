function output4 = ImageHitMiss(input4,kerjx,kerjy,kerkx,kerky,m,n,showImage)

[Image_width,Image_height] = size(input4);

for i = 1:Image_height,
    for j = 1:Image_width,
        comp(i,j) = 255 - input4(i,j);
    end;
end;
% Erosion J-hit
image_hit=ImageErosion(input4,kerjx,kerjy,m);
% Erosion K-miss
image_miss=ImageErosion(comp,kerkx,kerky,n);

for i = 1:Image_height,
    for j = 1:Image_width,
        if image_hit(i,j)~=0 && image_miss(i,j)~=0 
           output4(i,j) = 255;
        end;
    end;
end;
if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output4,'hitmissLENA.bmp')
end
            
            
            
