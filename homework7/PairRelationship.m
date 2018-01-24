function output = PairRelationship(A1)

Ib = zeros(size(A1,1)+2,size(A1,1)+2); 
Ib(2:end-1,2:end-1) = A1;
[r,c] = find(Ib); 
output = char(zeros(size(A1)));

for i = 1 : length(r) 
    mask = Ib(r(i)-1:r(i)+1,c(i)-1:c(i)+1); 
    a = zeros(1,4);
    a(1) = h1(mask(8)); % h1(x1,1)
    a(2) = h1(mask(4)); % h1(x2,1)
    a(3) = h1(mask(2)); % h1(x3,1)
    a(4) = h1(mask(6)); % h1(x4,1)
    output(r(i)-1,c(i)-1) = f1(a,mask(5));
end
end