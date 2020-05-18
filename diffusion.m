function [A_diff,b_diff] = diffusion(UnitGrid,beta)
n = UnitGrid.n;
A = zeros(n-1);
h = UnitGrid.h;

[A2,b2] = Central_DQ(UnitGrid,1);
A2 = cos(beta)*A2;
b2 = cos(beta)*b2;
[A3,b3] = Central_DQ(UnitGrid,2);
A3 = sin(beta)*A3;
b3 = sin(beta)*b3;

A_diff = A2 + A3;
b_diff = b2+ b3;

end

