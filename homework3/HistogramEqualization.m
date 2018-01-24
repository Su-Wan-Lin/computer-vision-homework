clear;
close;
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');
HISTO = zeros(256,1);
for x = 1:INFO.Height,
    for y = 1:INFO.Width,
        LENA(x,y) = LENA(x,y) / 3;
        HISTO(LENA(x,y)+1,1) = HISTO(LENA(x,y)+1,1) + 1;
    end;
end;
bar(HISTO)
imwrite(LENA,'DARKLENA.bmp');

n = 512 * 512;
sum = 0;
s = zeros(INFO.Height,INFO.Width);
HISTO1 = zeros(256,1);
for k = 1:256,
    sum = sum + HISTO(k);
    s(k) =255 * (sum / n);
end;
for x = 1:INFO.Height,
    for y = 1:INFO.Width,
        LENA(x,y) = s(LENA(x,y)+1);
        HISTO1(LENA(x,y)+1) = HISTO1(LENA(x,y)+1) + 1;
    end;
end;
bar(HISTO1)
imwrite(LENA,'EQUALIZATIONLENA.bmp')
        