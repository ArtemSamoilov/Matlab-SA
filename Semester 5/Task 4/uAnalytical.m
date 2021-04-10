% function for Subtask 6
function uanalit = uAnalytical(xMat,yMat,u1zero,u2zero,mu)
    v1 = @(s) exp(-(mu.^(1/2))*s)-exp((mu.^(1/2))*s);
    v2 = @(s) exp(2*mu.^(1/2)).*exp(-(mu.^(1/2))*s)-exp((mu.^(1/2))*s);
    t0 = 2*(mu.^(1/2))*(exp(2*mu.^(1/2))-1);

    %fx = @(s) 2*s.^2.*cos(2*s)+mu*u1zero;
    %fy = @(s) -s.^3.*exp(-s).*sin(s)+mu*u2zero;

    I1 = v1fx;
    I11 = I1(mu, u1zero, xMat);
    I11 = v2(xMat).*I11./t0;
    I2 = v2fx;
    I21 = I2(mu, u1zero, xMat);
    I21 = v1(xMat).*I21./t0;
    I3 = v1fy;
    I31 = I3(mu, u2zero, yMat);
    I31 = v2(yMat).*I31./t0;
    I4 = v2fy;
    I41 = I4(mu, u2zero, yMat);
    I41 = v1(yMat).*I41./t0;
    
    uanalit = I11+I21+I31+I41+u1zero+u2zero;
end