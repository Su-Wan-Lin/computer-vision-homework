image1=imread('sap_noise2.bmp'); 
figure,imshow(image1);
%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyimage1=zeros(size(image1)+2); 
B=zeros(size(image1));
%COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
for x=1:size(image1,1)
    for y=1:size(image1,2) 
        modifyimage1(x+1,y+1)=image1(x,y);
    end
end
%LET THE WINDOW BE AN ARRAY
%STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY 
%SORT AND FIND THE MIDDLE ELEMENT
for i= 1:size(modifyimage1,1)-2
    for j=1:size(modifyimage1,2)-2 
        window=zeros(9,1); 
        inc=1;
        for x=1:3
            for y=1:3 
                window(inc)=modifyimage1(i+x-1,j+y-1); 
                inc=inc+1;
            end
        end
        med=sort(window); %????
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX 
        B(i,j)=med(5);
    end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE 
B=uint8(B);
figure,imshow(B);
imwrite(B,'medianthree_sap_noise2.bmp');
