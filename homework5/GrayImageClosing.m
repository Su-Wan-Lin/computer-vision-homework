function output3 = GrayImageClosing(input3,kerx,kery,kervalue,n,showImage)

%Dilation
temp3 = GrayImageDilation(input3,kerx,kery,kervalue,n);
%Erosion
output3 = GrayImageErosion(temp3,kerx,kery,kervalue,n);

if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output3,'grayclosingLENA.bmp')
end