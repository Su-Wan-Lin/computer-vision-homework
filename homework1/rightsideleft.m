LENA2 = imread('lena.bmp');                    % 讀取影像檔案 lena.bmp
INFO2 = imfinfo('lena.bmp');                     % 傳回影像檔案資訊
for i = 1:INFO2.Width/2,
    for j = 1:INFO2.Height,
        DRAWER2 = LENA2(j,i);
        LENA2(j,i) = LENA2(j,INFO2.Width-i);
        LENA2(j,INFO2.Width-i) = DRAWER2;
    end;
end;
imwrite(LENA2,'rightsideleft.bmp');   