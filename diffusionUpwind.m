function [A_diff,b_diff] = diffusionUpwind(UnitGrid,beta)
n = UnitGrid.n;

[A2,b2] = Upwind_DQ(UnitGrid,1,cos(beta));
A2 = cos(beta)*A2;
b2 = cos(beta)*b2;
[A3,b3] = Upwind_DQ(UnitGrid,2,sin(beta));
A3 = sin(beta)*A3;
b3 = sin(beta)*b3;

A_diff = A2 + A3;
b_diff = b2+ b3;

end

