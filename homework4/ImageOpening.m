function output2 = ImageOpening(input2,kerx,kery,kervalue,n,showImage)

%Erosion
temp2 = ImageErosion(input2,kerx,kery,kervalue,n);
%Dilation
output2 = ImageDilation(temp2,kerx,kery,n);

if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output2,'openingLENA.bmp') 
end