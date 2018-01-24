function dog=DOG(image5,threshold)

image5=imread('lena.bmp'); 
%[m,n]=size(image5); 
threshold=1;

% Difference of Gaussian 
gaussian1=zeros(11); % Gaussian 1 
gaussian2=gaussian1; % Gaussian 2 
sig1=1; % sigma 1
sig2=3; % sigma 2
for r=-5:5
    for c=-5:5 
        gaussian1(r+6,c+6)=1/(2*pi*sig1^2)*exp(-(r^2+c^2)/(sig1^2)/2); 
        gaussian2(r+6,c+6)=1/(2*pi*sig2^2)*exp(-(r^2+c^2)/(sig2^2)/2); 
    end
end
ker=round(2000*(gaussian1-gaussian2));

edge=floor(size(ker,1)/2); 
output=ones(size(image5)); 
newimage_log=ones(size(image5));

Itemp=double(wextend('2','symw',image5,edge)); % extend image

% Mask
for r=edge+1:size(Itemp,1)-edge
    for c=edge+1:size(Itemp,2)-edge
        newimage_dog(r-edge,c-edge)=sum(sum(Itemp(r-edge:r+edge,c-edge:c+edge).*ker));
    end
end

figure;
imshow(newimage_dog); 
imwrite(newimage_dog,'dog.bmp')

% Zero Crossing
zctemp=zeros(size(Itemp)); 
zctemp=double(wextend('2','symw',newimage_dog,edge));

for r=1:size(image5,1) 
    for c=1:size(image5,2)
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
imwrite(output,'dog_thres.bmp'); 
end
   