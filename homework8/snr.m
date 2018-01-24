function outputsnr=snr(image_noise,image_ori)

image_noise=imread('CO_sap_noise1.bmp'); 
image_ori=imread('lena.bmp'); 
[height1,width1]=size(image_ori);
mean=0;
meanN=0; 
vs=0; 
vn=0;

for i=1:height1;
    for j=1:width1;
        mean=double(mean+image_ori(i,j));
        meanN=double(meanN+(image_noise(i,j)-image_ori(i,j)));
    end
end

mean=mean./(height1.*width1); 
meanN=meanN./(height1.*width1);

for i=1:height1;
    for j=1:width1;
        tem1=double(image_ori(i,j)-mean); 
        vs=vs+(tem1.*tem1); 
        tem2=double(image_noise(i,j)-image_ori(i,j)-meanN); 
        vn=vn+(tem2.*tem2);
    end
end
vs=vs./(height1*width1); 
vn=vn./(height1*width1);

outputsnr=20.*log10(sqrt((vs./vn)));
end