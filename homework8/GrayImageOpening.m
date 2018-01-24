function output=GrayImageOpening(input,K,Kc,showImg)

if ~exist('showImg') 
    showImg=0;
end

% ? Erosion ? Dilation
img_ero=GrayImageErosion(input,K,Kc);
output=GrayImageDilation(img_ero,K,Kc);

if showImg~=0
   figure;
   imshow(output);
   title('Opening');
   imwrite(output,'Opening.bmp')
end
end