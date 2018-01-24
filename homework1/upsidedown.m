LENA = imread('lena.bmp');                   
INFO = imfinfo('lena.bmp');              
for i =1:INFO.Height/2,                        
    for j =1:INFO.Width,
        DRAWER = LENA(i,j);                 
        LENA(i,j) = LENA(INFO.Height-i,j);       
        LENA(INFO.Height-i,j) = DRAWER;
    end;
end;
imwrite(LENA,'upsidedown.bmp');
