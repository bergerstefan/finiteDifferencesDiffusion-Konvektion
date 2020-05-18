function [A,b] = Upwind_DQ(UnitGrid,d, dir)
n = UnitGrid.n -1;
b = zeros(n^2,1);

if d==1
    if dir>=0
        T = eye(n)-[zeros(n-1,1),eye(n-1);zeros(1,n)]';
        b(1:n:n*(n-1)+1) = 0;  %linker Rand
    else
        T = -eye(n)+[zeros(n-1,1),eye(n-1);zeros(1,n)];
        b(n:n:n^2) = 0;     %rechter Rand
    end
    A = (kron(eye(n),T));
else
    if d==2
        if dir>=0
            T = eye(n)-[zeros(n-1,1),eye(n-1);zeros(1,n)]';
            b(1:n) = 0;             %unterer Rand
        else
            T = -eye(n)+[zeros(n-1,1),eye(n-1);zeros(1,n)];
            b(n*(n-1)+1:n^2) = 0;     %oberer Rand
        end
        A = (kron(T,eye(n)));
    end
end

A = (n+1)*A;

b = (n+1)*b;

end

