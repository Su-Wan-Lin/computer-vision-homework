clc;
clear all;
close all; 
%input=imread('sap_noise1.bmp'); 
I=imread('sap_noise2.bmp');

K=[0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0]; 
Kc=[3,3];
%--------------------------- 
img_open=GrayImageOpening(I,K,Kc,1); 
outputOC=GrayImageClosing(img_open,K,Kc,1);
figure;
imshow(outputOC); 
%imwrite(outputOC,'OC_sap_noise2.bmp');

img_close=GrayImageClosing(I,K,Kc,1); 
outputCO=GrayImageOpening(img_close,K,Kc,1); 
figure;
imshow(outputCO); 
imwrite(outputCO,'CO_sap_noise2.bmp');
