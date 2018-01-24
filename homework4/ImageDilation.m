function output = GrayImageDilation(input,kerx,kery,kervalue,n,showImage)

[Image_width,Image_height] = size(input);

for i = 1:Image_height,
    for j = 1:Image_width, 
        max = 0;
        for k = 1:n;
            px= i - kerx(k); 
            py= j - kery(k);
               if px>=1 && py>=1 && px <= Image_width && py <= Image_height;
                  temp = input(px,py) + kervalue(k);
               if max < temp
                  max = temp;
               end;
                  output(i,j) = max;
               end;
         end;
     end;
end;
if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output,'graydilationLENA.bmp') 
end
    
           


