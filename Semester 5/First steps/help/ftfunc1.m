function res = ftfunc1(p)
    res = (p./(p+1)).*sin(8*p+8) + (p./(p-1)).*sin(8*p-8);
end