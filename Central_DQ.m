function [A,b] = Central_DQ(UnitGrid,d)
n = UnitGrid.n -1;
b1 = zeros(n^2,1);
b2 = zeros(n^2,1);

T = [zeros(n-1,1),eye(n-1);zeros(1,n)] -[zeros(n-1,1),eye(n-1);zeros(1,n)]';

if d==1
    A = (kron(eye(n),T));
    
    b1(1:n:n*(n-1)+1) = 0;  %linker Rand
    b2(n:n:n^2) = 0;     %rechter Rand
else
    if d==2
        A = (kron(T,eye(n)));
        b1(1:n) = 0;             %unterer Rand
        b2(n*(n-1)+1:n^2) = 0;     %oberer Rand
    end
end

A = (n+1)/2*A;

b = (n+1)/2*(b1+b2);
end

