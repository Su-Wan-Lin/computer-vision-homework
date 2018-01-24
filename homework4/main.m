clear;
close;

%Binarize LENA image
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');
for x = 1:INFO.Height,
    for y = 1:INFO.Width,
        T = 128;
        if LENA(x,y) > T;
           LENA(x,y) = 255;
        else
           LENA(x,y) = 0;
        end;
    end;
end;
imwrite(LENA,'binarizelena.bmp');

%Kernel(35553 matrix)
kerx = zeros(21,1);
kery = zeros(21,1);
kerx(1) = -2; kery(1) = -1;  %(-2,-1) 
kerx(2) = -2; kery(2) =  0;  %(-2, 0) 
kerx(3) = -2; kery(3) =  1;  %(-2, 1) 
kerx(4) = -1; kery(4) = -2;  %(-1,-2)
kerx(5) = -1; kery(5) = -1;  %(-1,-1)
kerx(6) = -1; kery(6) =  0;  %(-1, 0)
kerx(7) = -1; kery(7) =  1;  %(-1, 1)
kerx(8) = -1; kery(8) =  2;  %(-1, 2)
kerx(9) =  0; kery(9) = -2;  %( 0,-2)
kerx(10)=  0; kery(10) = -1; %( 0,-1)
kerx(11)=  0; kery(11)=  0;  %( 0, 0)
kerx(12)=  0; kery(12)=  1;  %( 0, 1)
kerx(13)=  0; kery(13)=  2;  %( 0, 2)
kerx(14)=  1; kery(14)= -2;  %( 1,-2)
kerx(15)=  1; kery(15)= -1;  %( 1,-1)
kerx(16)=  1; kery(16)=  0;  %( 1, 0)
kerx(17)=  1; kery(17)=  1;  %( 1, 1)
kerx(18)=  1; kery(18)=  2;  %( 1, 2)
kerx(19)=  2; kery(19)= -1;  %( 2,-1)
kerx(20)=  2; kery(20)=  0;  %( 2, 0)
kerx(21)=  2; kery(21)=  1;  %( 2, 1)


%J_hit
kerjx(1) = 0; kerjy(1) = 0;  %( 0, 0)
kerjx(2) = 0; kerjy(2) =-1;  %( 0,-1)
kerjx(3) = 1; kerjy(3) = 0;  %( 1, 0)

%k_miss
kerkx(1) =-1; kerky(1) = 0;  %(-1, 0)
kerkx(2) =-1; kerky(2) = 1;  %(-1, 1)
kerkx(3) = 0; kerky(3) = 1;  %( 0, 1)

%Dilation
ImageDilation(LENA,kerx,kery,21,1);
%Erosion
ImageErosion(LENA,kerx,kery,21,1);
%Opening
ImageOpening(LENA,kerx,kery,21,1);
%Closing
ImageClosing(LENA,kerx,kery,21,1);
%Hit_Miss
ImageHitMiss(LENA,kerjx,kerjy,kerkx,kerky,3,3,1);








 


