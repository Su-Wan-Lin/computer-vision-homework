LENA = imread('lena.bmp');                 % Ū���v���ɮ� lena.bmp
LENA = imrotate(LENA, 315, 'bilinear');       
       % Rotate 315 degrees counter-clockwise -> Rotate 45 degrees clockwise
imwrite(LENA,'rotate lena.bmp');
