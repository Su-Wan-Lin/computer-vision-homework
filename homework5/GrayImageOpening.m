function output2 = GrayImageOpening(input2,kerx,kery,kervalue,n,showImage)

%Erosion
temp2 = GrayImageErosion(input2,kerx,kery,kervalue,n);
%Dilation
output2 = GrayImageDilation(temp2,kerx,kery,kervalue,n);

if ~exist('showImage') showImage=0;
end
if showImage~=0;
imwrite(output2,'grayopeningLENA.bmp') 
end