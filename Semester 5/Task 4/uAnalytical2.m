function res = uAnalytical2(xMat,yMat,u1Zero,u2Zero,mu)
val = zeros(size(xMat));
u1 = @(s) exp(-(mu.^(1/2))*s)-exp((mu.^(1/2))*s);
u2 = @(s) exp(2*mu.^(1/2)).*exp(-(mu.^(1/2))*s)-exp((mu.^(1/2))*s);
t0 = 2*(mu.^(1/2))*(exp(2*mu.^(1/2))-1);

    fx = @(s) 2*s.^2.*cos(2*s)+mu*u1Zero;
    fy = @(s) -s.^3.*exp(-s).*sin(s)+mu*u2Zero;


N = size(xMat);
M = size(xMat);
for i=1:N(1)
for j=1:M(2)
x = xMat(i,j);
y = yMat(i,j);
set1 = linspace(0,x,1000);
I1 = trapz(set1,u1(set1).*f_x(set1));
I1 = u2(x).*I1/t0;

set2 = linspace(x,1,1000);
I2 = trapz(set2,u2(set2).*f_x(set2));
I2 = u1(x).*I2/t0;

set3 = linspace(0,y,1000);
I3 = trapz(set3,u1(set3).*f_y(set3));
I3 = u2(y).*I3/t0;

set4 = linspace(y,1,1000);
I4= trapz(set4,u2(set4).*f_y(set4));
I4 = u1(y).*I4/t0;

val(i,j) = I1+I2+I3+I4+u1Zero+u2Zero;
end
end
res = val;
end