function output1 = GrayImageErosion(input1,kerx,kery,kervalue,n,showImage)

[Image_width,Image_height] = size(input1);

for i = 1:Image_height,
    for j = 1:Image_width,
        min = 255;
        for k=1:n,
            px= i + kerx(k); 
            py= j + kery(k);
            if px>=1 && py>=1 && px <= Image_width && py <= Image_height;
                  temp = input(px,py) - kervalue(k);
               if temp < min
                  min = temp;
               end;
               if min < 0
                  min = 0;
               end;
               output(i,j) = min;   
            end;
        end;
    end;
end;
if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output1,'erosionLENA.bmp') 
end
        