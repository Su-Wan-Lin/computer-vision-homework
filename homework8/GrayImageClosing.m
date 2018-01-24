function output=GrayImageClosing(input,K,Kc,showImg)

if ~exist('showImg') 
    showImg=0;
end

% ? Dilation ? Erosion
img_dil=GrayImageDilation(input,K,Kc); 
output=GrayImageErosion(img_dil,K,Kc);

if showImg~=0
   figure;
   imshow(output);
   title('Closing');
   imwrite(output,'Closing.bmp')
end
end