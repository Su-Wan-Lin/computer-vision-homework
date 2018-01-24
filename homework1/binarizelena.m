LENA = imread('lena.bmp');                    % 讀取影像檔案 lena.bmp
BinarizeLENA = im2bw(LENA,0.5);
imwrite(BinarizeLENA,'Binarize lena.bmp');
