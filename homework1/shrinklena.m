LENA = imread('lena.bmp');                 % Ū���v���ɮ� lena.bmp
LENA = imresize(LENA, 0.5, 'bilinear');         %  shrink lena.im in half
imwrite(LENA,'shrink lena.bmp')