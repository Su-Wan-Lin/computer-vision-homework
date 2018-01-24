clear;
close;

%LENA image
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');

%Kernel(35553 matrix)
kerx = zeros(21,1);
kery = zeros(21,1);
kervalue = zeros(21,1);
kerx(1) = -2; kery(1) = -1;  kervalue(1) = 0;%(-2,-1) 
kerx(2) = -2; kery(2) =  0;  kervalue(2) = 0;%(-2, 0) 
kerx(3) = -2; kery(3) =  1;  kervalue(3) = 0;%(-2, 1) 
kerx(4) = -1; kery(4) = -2;  kervalue(4) = 0;%(-1,-2)
kerx(5) = -1; kery(5) = -1;  kervalue(5) = 0;%(-1,-1)
kerx(6) = -1; kery(6) =  0;  kervalue(6) = 0;%(-1, 0)
kerx(7) = -1; kery(7) =  1;  kervalue(7) = 0;%(-1, 1)
kerx(8) = -1; kery(8) =  2;  kervalue(8) = 0;%(-1, 2)
kerx(9) =  0; kery(9) = -2;  kervalue(9) = 0;%( 0,-2)
kerx(10)=  0; kery(10)= -1;  kervalue(10)= 0;%( 0,-1)
kerx(11)=  0; kery(11)=  0;  kervalue(11)= 0;%( 0, 0)
kerx(12)=  0; kery(12)=  1;  kervalue(12)= 0;%( 0, 1)
kerx(13)=  0; kery(13)=  2;  kervalue(13)= 0;%( 0, 2)
kerx(14)=  1; kery(14)= -2;  kervalue(14)= 0;%( 1,-2)
kerx(15)=  1; kery(15)= -1;  kervalue(15)= 0;%( 1,-1)
kerx(16)=  1; kery(16)=  0;  kervalue(16)= 0;%( 1, 0)
kerx(17)=  1; kery(17)=  1;  kervalue(17)= 0;%( 1, 1)
kerx(18)=  1; kery(18)=  2;  kervalue(18)= 0;%( 1, 2)
kerx(19)=  2; kery(19)= -1;  kervalue(19)= 0;%( 2,-1)
kerx(20)=  2; kery(20)=  0;  kervalue(20)= 0;%( 2, 0)
kerx(21)=  2; kery(21)=  1;  kervalue(21)= 0;%( 2, 1)


%Dilation
GrayImageDilation(LENA,kerx,kery,kervalue,21,1);
%Erosion
GrayImageErosion(LENA,kerx,kery,kervalue,21,1);
%Opening
GrayImageOpening(LENA,kerx,kery,kervalue,21,1);
%Closing
GrayImageClosing(LENA,kerx,kery,kervalue,21,1);









 


