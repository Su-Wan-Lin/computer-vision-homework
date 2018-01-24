function log=LOG(image4,threshold)

image4=imread('lena.bmp'); 
%[m,n]=size(image4); 
threshold=3000;

ker=[0 0 0 -1 -1 -2 -1 -1 0 0 0;...
0 0 -2 -4 -8 -9 -8 -4 -2 0 0;...
0 -2 -7 -15 -22 -23 -22 -15 -7 -2 0;...
-1 -4 -15 -24 -14 -1 -14 -24 -15 -4 -1;... 
-1 -8 -22 -14 52 103 52 -14 -22 -8 -1;... 
-2 -9 -23 -1 103 178 103 -1 -23 -9 -2;... 
-1 -8 -22 -14 52 103 52 -14 -22 -8 -1;... 
-1 -4 -15 -24 -14 -1 -14 -24 -15 -4 -1;... 
0 -2 -7 -15 -22 -23 -22 -15 -7 -2 0;...
0 0 -2 -4 -8 -9 -8 -4 -2 0 0;...
0 0 0 -1 -1 -2 -1 -1 0 0 0;];

edge=floor(size(ker,1)/2);
output=ones(size(image4));
newimage_log=ones(size(image4)); 
Itemp=double(wextend('2','symw',image4,edge)); % extend image

% Mask
for r=edge+1:size(Itemp,1)-edge
    for c=edge+1:size(Itemp,2)-edge
        newimage_log(r-edge,c-edge)=sum(sum(Itemp(r-edge:r+edge,c-edge:c+edge).*ker));
    end
end
figure;
imshow(newimage_log); 
imwrite(newimage_log,'log.bmp')
% Zero Crossing
zctemp=zeros(size(Itemp)); 
zctemp=double(wextend('2','symw',newimage_log,edge));

for r=1:size(image4,1) 
    for c=1:size(image4,2)
        mask=zctemp(r+edge-1:r+edge+1,c+edge-1:c+edge+1); 
        center=mask(2,2);
        neighbors=mask([1 2 3 4 6 7 8 9]);
        % condition 1
        c1=center<-threshold; 
        c1=c1*sum(neighbors>threshold);
        % condition 2
        c2=center>threshold; 
        c2=c2*sum(neighbors<-threshold); 
        output(r,c)=~(c1||c2);
    end
end
figure; 
output=uint8(255*output); 
imshow(output); 
imwrite(output,'log_thres.bmp');
end
 