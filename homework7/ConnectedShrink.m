function output = ConnectedShrink(NEWLENA,A2) 

Ib = zeros(size(NEWLENA,1)+2,size(NEWLENA,1)+2); 
Ib(2:end-1,2:end-1) = NEWLENA; 
[r,c] = find(A2 == 'p');
r = r + 1; 
c = c + 1;

for i = 1 : length(r)
    mask = Ib(r(i)-1:r(i)+1,c(i)-1:c(i)+1);
    a = zeros(1,4);
    a(1) = h2(mask(5),mask(8),mask(7),mask(4)); % x0,x1,x6,x2 
    a(2) = h2(mask(5),mask(4),mask(1),mask(2)); % x0,x2,x7,x3
    a(3) = h2(mask(5),mask(2),mask(3),mask(6)); % x0,x3,x8,x4 
    a(4) = h2(mask(5),mask(6),mask(9),mask(8)); % x0,x4,x5,x1 
    Ib(r(i),c(i)) = f2(a,mask(5));
end
output = Ib(2:end-1,2:end-1);
end