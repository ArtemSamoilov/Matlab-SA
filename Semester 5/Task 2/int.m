syms s real;
syms mu real;
syms k2 real;
syms u1zero real;
F = sym(exp((-(mu^(1/2))*s)-exp((mu^(1/2))*s)))%*(2*s^2*cos(2*s)+mu*u1zero));
int (F, s)