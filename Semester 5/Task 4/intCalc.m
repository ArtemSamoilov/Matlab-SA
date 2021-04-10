syms x l mu u1zero u2zero s y

f1 = (exp(-sqrt(mu)*s)-exp(sqrt(mu)*s))*(2*s.^2.*cos(2*s)+mu*u1zero);
f2 = (exp(2*sqrt(mu)-sqrt(mu)*s)-exp(sqrt(mu)*s))*(2*s.^2.*cos(2*s)+mu*u1zero);
f3 = (exp(-sqrt(mu)*s)-exp(sqrt(mu)*s))*(-s.^3.*exp(-s).*sin(s)+mu*u2zero);
f4 = (exp(2*sqrt(mu)-sqrt(mu)*s)-exp(sqrt(mu)*s))*(-s.^3.*exp(-s).*sin(s)+mu*u2zero);

p1 = int(f1, s, 0, x);
p2 = int(f2, s, x, 1);
p3 = int(f3, s, 0, y);
p4 = int(f4, s, y, 1);

formula = matlabFunction(p4)