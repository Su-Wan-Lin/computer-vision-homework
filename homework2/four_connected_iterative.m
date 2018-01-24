clear; 
close;
LENA = imread('lena.bmp');
INFO = imfinfo('lena.bmp');

for x = 1:INFO.Height,
       for y = 1:INFO.Width,
           T = 128;
           if LENA(x,y) > T,
              LENA(x,y) = 255;
           else
              LENA(x,y) = 0;
           end;
       end;
end;
imwrite(LENA,'bilena.bmp')
LENA1 = imread('bilena.bmp');
INFO1 = imfinfo('bilena.bmp');
    
mm = 0;
LABEL = zeros(INFO1.Height,INFO1.Width);
for x = 1:INFO1.Height,
      for y = 1:INFO1.Width,
          if LENA1(x,y) > 0,
             mm = mm + 1;
             LABEL(x,y) = mm;
          end;
      end;
end;

change = 1;
while change > 0,
  change = 0;
  for x = 1:INFO1.Height,
      for y = 1:INFO1.Width,
          if LABEL(x,y) > 0,
             min = LABEL(x,y);
             if x > 1 && LABEL(x-1,y) ~= 0 && LABEL(x-1,y) < min,
                min = LABEL(x-1,y);
             end;
             if y > 1 && LABEL(x,y-1) ~= 0 && LABEL(x,y-1) < min,
                min = LABEL(x,y-1);
             end;
             if min ~= LABEL(x,y),
                change = 1;
                LABEL(x,y) = min;
             end;
          end;
      end;
   end;
   for x = INFO1.Height:-1:1,
      for y = INFO1.Width:-1:1,
          if LABEL(x,y) > 0,
             min = LABEL(x,y);
             if x < INFO1.Height && LABEL(x+1,y)~=0 && LABEL(x+1,y) < min,
                min = LABEL(x+1,y);
             end;
             if y < INFO1.Width && LABEL(x,y+1)~=0 && LABEL(x,y+1) < min,
                min = LABEL(x,y+1);
             end;
             if min ~= LABEL(x,y),
                change = 1;
                LABEL(x,y) = min;
             end;
          end;
      end;  
   end;
end;

REGION = zeros(mm,1);
for x = 1:INFO1.Height,
    for y = 1:INFO1.Width,
        if LABEL(x,y) > 0,
           REGION(LABEL(x,y)) = REGION(LABEL(x,y))+1;
        end;
    end;
end;

for r = 1:mm;
  if REGION(r) >= 500,
     xsum = 0;
     xcount = 0;
     ysum = 0;
     ycount = 0; 
     xcent = 0;
     ycent = 0;
     top = INFO1.Height;
     bottom = -1;
     left = INFO1.Width;
     right = -1;
     for x = 1:INFO1.Height,
         for y = 1:INFO1.Width,
             if LABEL(x,y) == r,
                if x < top,
                       top = x;
                end;
                if x > bottom,
                       bottom = x;
                end;
                if y < left,
                       left = y;
                end;
                if y > right,
                       right = y;
                end;
             end;
         end;
     end;
    
     for i = top:bottom,
         LENA1(i,left) = 128;
         LENA1(i,right) = 128;
     end;
     for j = left:right,
         LENA1(top,j) = 128;
         LENA1(bottom,j) =128;
     end;
     for x = 1: INFO1.Height;
         for y = 1:INFO1.Width,
             if LABEL(x,y) == r,
                if x ~= 0,
                   xsum = xsum + x;
                   xcount = xcount + 1;
                end;
                if y ~= 0,
                ysum = ysum + y;
                ycount = ycount + 1;
                end;
            end;
         end;
     end;
     xcent = round(xsum / xcount);
     ycent = round(ysum / ycount);
     LENA1(xcent,ycent) = 128;
     LENA1(xcent-1,ycent) = 128;
     LENA1(xcent+1,ycent) = 128;
     LENA1(xcent,ycent-1) = 128;
     LENA1(xcent,ycent+1) = 128;
     imwrite(LENA1,'four_connected_iterative1.bmp')
  end;
end;

  

  
   



