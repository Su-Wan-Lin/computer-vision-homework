LENA = imread('lena.bmp');                    % Ū���v���ɮ� lena.bmp
BinarizeLENA = im2bw(LENA,0.5);
imwrite(BinarizeLENA,'Binarize lena.bmp');
