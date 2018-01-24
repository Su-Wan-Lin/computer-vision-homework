clear;
close;
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');

for x = 1 : INFO.Height/8,
    for y = 1 : INFO.Width/8,
        NEWLENA(x,y) = LENA(x*8-7,y*8-7);
    end;
end;    

imwrite(NEWLENA,'DownsampleLENA.bmp')

for x = 1 : INFO.Height/8,
    for y = 1 : INFO.Width/8,
        T = 128;
        if NEWLENA(x,y) > T,
           NEWLENA(x,y) = 255;
        else
           NEWLENA(x,y) = 0;
        end;
    end;
end;

imwrite(NEWLENA,'binarizelena.bmp')

output = YokoiConnectivity(NEWLENA);

fid = fopen('Yokoi Connectivity Number.txt','w'); 
for k = 1 : size(output,1)
    fprintf(fid,'%c',output(k,:));
    fprintf(fid,'\r\n');
end
fclose(fid);

clc; clear all; close all;
I=imread('lena_gray','bmp');
% Down Sample from 512x512 to 64x64
I=I(1:8:512,1:8:512);
% Binarize
Ibinary=zeros(size(I));
Ibinary(I>127)=1;
y3=Ibinary;
change=1;
while change~=0
y3_pre=y3;
   % Yokoi Connectivity Number
   y1=YokoiConnectivity(y3);
   % The Pair Relationship
   y2=PairRelationship(y1);
   % Connected Shrink
   y3=ConnectedShrink(y3,y2);