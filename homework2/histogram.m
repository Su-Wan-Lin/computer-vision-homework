LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');
HISTO = zeros(256,1);
for i = 1:INFO.Height,
    for j = 1:INFO.Width,
           HISTO(LENA(i,j)+1) = HISTO(LENA(i,j)+1)+1;
    end;
end;
bar(HISTO)
