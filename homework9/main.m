clc; 
clear all; 
close all;
I=imread('Input Image/lena','bmp'); 
% Robert's Operator: 10 
robert=RobertOperator(image1,10);
% Prewitt's Edge Detector: 25
prewitt=PrewittOperator(image2,25);
% Sobel's Edge Detector: 36
sobel=SobelOperator(image3,36);
% Frei and Chen's Gradient Operator: 30
FCG=Frei_and_Chen(image4,30);
% Kirsch's Compass Operator: 135
ks = Kirsch(image5,135);
% Robinson's Compass Operator: 45
Robins = Robinson(image6,45);
% Nevatia-Babu 5x5 Operator: 155
Nev = Nevati(image7,155);
