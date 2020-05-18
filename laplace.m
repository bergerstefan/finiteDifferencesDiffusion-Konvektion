function [A,b] = laplace( UnitGrid,f,eps)

n = UnitGrid.n;
n = n-1;

T = -2*eye(n)+[zeros(n-1,1),eye(n-1);zeros(1,n)]+[zeros(n-1,1),eye(n-1);zeros(1,n)]';
A = (n+1)^2*(kron(T,eye(n))+kron(eye(n),T));


n = UnitGrid.n;
h = UnitGrid.h;
G = zeros(n+1,n+1);


for i=1:UnitGrid.n +1

    G(1,i) = UnitGrid.Bleft(i);
    G(n+1,i) = UnitGrid.Bright(i);
    G(i,1) = UnitGrid.Bup(i);
    G(i,n+1) = UnitGrid.Bdown(i);
end
n = n-1;

b1 = zeros(n^2,1);
b2 = zeros(n^2,1);
b3 = zeros(n^2,1);
b4 = zeros(n^2,1);

b1(1:n) = G(n+2,2:n+1);             
b2(1:n:n*(n-1)+1) = G(n+1:-1:2,1);  
b3(n:n:n^2) = G(n+1:-1:2,n+2);      
b4(n*(n-1)+1:n^2) = G(1,2:n+1);     

b = -(n+1)^2*(b1+b2+b3+b4);

A = -eps*A;
b = -eps*b;
end

