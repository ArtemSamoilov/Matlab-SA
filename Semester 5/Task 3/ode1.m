function [ diffs ] = ode1( t, x )
    diffs = zeros(2, 1);
    diffs(1) = 2*x(1);
    diffs(2) = x(1) + x(2);
end