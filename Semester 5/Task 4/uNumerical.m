% function for Subtask 6
function unum = uNumerical(u1zero,u2zero,mu,N,M)
    fHangle = @(x,y) 2*x.^2.*cos(2*x) - y.^3.*exp(-y).*sin(y);
    xiHandle = @(x) uAnalytical(x,zeros(size(x)),u1zero,u2zero,mu);
    etaHandle = @(y) uAnalytical(zeros(size(y)),y,u1zero,u2zero,mu);
    unum = solveDirichlet2(fHangle,xiHandle,etaHandle,mu,N,M);
end