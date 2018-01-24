clear;
close;
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');

for x = 1 : INFO.Height/8,
    for y = 1 : INFO.Width/8,
        DLENA(x,y) = LENA(x*8-7,y*8-7);
    end;
end;   

imwrite(DLENA,'DownsampleLENA.bmp')

for x = 1 : INFO.Height/8,
    for y = 1 : INFO.Width/8,
        T = 128;
        if DLENA(x,y) > T,
           NEWLENA(x,y) = 255;
        else
           NEWLENA(x,y) = 0;
        end;
    end;
end;

imwrite(NEWLENA,'binarizelena.bmp')

A3 = NEWLENA;
change = 1;
while change ~= 0
      A3_pre = A3;
      % Yokoi Connectivity Number
      A1 = YokoiConnectivity(A3);
      % The Pair Relationship
      A2 = PairRelationship(A1);
      % Connected Shrink
      A3 = ConnectedShrink(A3,A2);
      change = sum(abs(A3_pre(:)-A3(:)));
end

figure;
subplot(1,3,1); imshow(DLENA);   title('Downsampling'); 
subplot(1,3,2); imshow(NEWLENA); title('Binarize'); 
subplot(1,3,3); imshow(A3);      title('Thinning'); 
saveas(gcf,'Thinning.jpg');

% Write Result to txt file
Imagethin = YokoiConnectivity(NEWLENA);
Imagethin(A3 ~= 0) = '*';
Imagethin(Imagethin ~= '*') =  0;
fid = fopen('Thinning.txt','w');
for k = 1 : size(Imagethin,1)
    fprintf(fid,'%c',Imagethin(k,:));
    fprintf(fid,'\r\n');
end
fclose(fid);


