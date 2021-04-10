function [c, d] = normYAx(mn, mx)
    alph = 0.1;
    c = mn * (1 + alph * (-sign(mn)));
    d = mx * (1 + alph * (sign(mx)));
    if (c == d && c == 0)
        c = -1;
        d = 1;
    end
end