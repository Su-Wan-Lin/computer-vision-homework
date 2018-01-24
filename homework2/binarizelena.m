clear; 
close;
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');

for x = 1:INFO.Height,
       for y = 1:INFO.Width,
           T = 128;
           if LENA(x,y) > T,
              LENA(x,y) = 255;
           else
              LENA(x,y) = 0;
           end;
       end;
end;
imwrite(LENA,'binarizelena.bmp');