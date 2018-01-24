LENA3 = imread('lena.bmp');
INFO3 = imfinfo('lena.bmp');
for i = 1:INFO3.Height/2,
      for j = 1:INFO3.Width,
         DRAWER3 = LENA3(i,j); 
         LENA3(i,j) = LENA3(INFO3.Height-i,j);
         LENA3(INFO3.Height-i,j) = DRAWER3;
      end;
end;
imwrite(LENA3,'usd1.bmp');
LENA4 = imread('usd1.bmp');
INFO4 = imfinfo('usd1.bmp');
for x = 1:INFO4.Width/2,
      for y = 1:INFO4.Height,
         DRAWER4 = LENA4(y,x);
         LENA4(y,x) = LENA4(y,INFO4.Width-x);
         LENA4(y,INFO4.Width-x) = DRAWER4;
      end;
end;
imwrite(LENA4,'diagonallymirror.bmp');