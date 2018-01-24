LENA = imread('lena.bmp');                 % 讀取影像檔案 lena.bmp
LENA = imresize(LENA, 0.5, 'bilinear');         %  shrink lena.im in half
imwrite(LENA,'shrink lena.bmp')