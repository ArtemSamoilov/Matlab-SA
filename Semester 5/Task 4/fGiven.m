% fuction for Subtask 6
function f = fGiven(x,y)
    f = @(x,y) 2*x.^2.*cos(2*x) - y.^3.*exp(-y).*sin(y);
end