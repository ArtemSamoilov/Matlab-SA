function res = v2fy(mu,u2zero,x)   
    res = @(mu,u2zero,y)exp(sqrt(mu)-1.0).*1.0./(mu+sqrt(mu).*2.0+2.0).^4.*(cos(1.0).*5.6e+1-sin(1.0).*4.0e+1+mu.*cos(1.0).*3.24e+2+mu.*sin(1.0).*1.44e+2+mu.^2.*cos(1.0).*6.6e+1+mu.^3.*cos(1.0)+mu.^(3.0./2.0).*cos(1.0).*2.0e+2+mu.^(5.0./2.0).*cos(1.0).*1.2e+1+mu.^2.*sin(1.0).*1.34e+2+mu.^3.*sin(1.0).*1.0e+1+mu.^(3.0./2.0).*sin(1.0).*2.12e+2+mu.^(5.0./2.0).*sin(1.0).*4.8e+1+mu.^(7.0./2.0).*sin(1.0))-exp(sqrt(mu)-1.0).*1.0./(mu-sqrt(mu).*2.0+2.0).^4.*(cos(1.0).*5.6e+1-sin(1.0).*4.0e+1+mu.*cos(1.0).*3.24e+2+mu.*sin(1.0).*1.44e+2+mu.^2.*cos(1.0).*6.6e+1+mu.^3.*cos(1.0)-mu.^(3.0./2.0).*cos(1.0).*2.0e+2-mu.^(5.0./2.0).*cos(1.0).*1.2e+1+mu.^2.*sin(1.0).*1.34e+2+mu.^3.*sin(1.0).*1.0e+1-mu.^(3.0./2.0).*sin(1.0).*2.12e+2-mu.^(5.0./2.0).*sin(1.0).*4.8e+1-mu.^(7.0./2.0).*sin(1.0))+exp(-y+sqrt(mu).*y).*1.0./(mu-sqrt(mu).*2.0+2.0).^4.*(sin(y).*-2.4e+1-mu.^(3.0./2.0).*cos(y).*2.4e+1+y.^2.*cos(y).*2.4e+1+y.^3.*cos(y).*8.0+mu.^2.*sin(y).*6.0-mu.^(3.0./2.0).*sin(y).*2.4e+1+y.^3.*sin(y).*8.0+mu.*cos(y).*7.2e+1+y.*cos(y).*2.4e+1-y.*sin(y).*2.4e+1+mu.*y.*cos(y).*1.2e+2+mu.*y.*sin(y).*2.4e+1+mu.*y.^2.*cos(y).*9.6e+1+mu.^2.*y.*cos(y).*1.8e+1+mu.*y.^3.*cos(y).*3.6e+1-mu.^(3.0./2.0).*y.*cos(y).*7.2e+1+mu.*y.^2.*sin(y).*6.0e+1+mu.^2.*y.*sin(y).*3.0e+1+mu.*y.^3.*sin(y).*6.0e+1-mu.^(3.0./2.0).*y.*sin(y).*4.8e+1-mu.^(5.0./2.0).*y.*sin(y).*6.0+mu.^2.*y.^2.*cos(y).*3.0e+1+mu.^2.*y.^3.*cos(y).*1.8e+1+mu.^3.*y.^3.*cos(y)-mu.^(3.0./2.0).*y.^2.*cos(y).*7.2e+1-mu.^(3.0./2.0).*y.^3.*cos(y).*3.2e+1-mu.^(5.0./2.0).*y.^2.*cos(y).*6.0-mu.^(5.0./2.0).*y.^3.*cos(y).*6.0+mu.^2.*y.^2.*sin(y).*4.8e+1+mu.^2.*y.^3.*sin(y).*5.0e+1+mu.^3.*y.^2.*sin(y).*3.0+mu.^3.*y.^3.*sin(y).*7.0-mu.^(3.0./2.0).*y.^2.*sin(y).*7.2e+1-mu.^(3.0./2.0).*y.^3.*sin(y).*6.8e+1-mu.^(5.0./2.0).*y.^2.*sin(y).*1.8e+1-mu.^(5.0./2.0).*y.^3.*sin(y).*2.4e+1-mu.^(7.0./2.0).*y.^3.*sin(y))-sqrt(mu).*u2zero.*(exp(sqrt(mu))-exp(-sqrt(mu).*y+sqrt(mu).*2.0))-exp(-y-sqrt(mu).*y+sqrt(mu).*2.0).*1.0./(mu+sqrt(mu).*2.0+2.0).^4.*(sin(y).*-2.4e+1+mu.^(3.0./2.0).*cos(y).*2.4e+1+y.^2.*cos(y).*2.4e+1+y.^3.*cos(y).*8.0+mu.^2.*sin(y).*6.0+mu.^(3.0./2.0).*sin(y).*2.4e+1+y.^3.*sin(y).*8.0+mu.*cos(y).*7.2e+1+y.*cos(y).*2.4e+1-y.*sin(y).*2.4e+1+mu.*y.*cos(y).*1.2e+2+mu.*y.*sin(y).*2.4e+1+mu.*y.^2.*cos(y).*9.6e+1+mu.^2.*y.*cos(y).*1.8e+1+mu.*y.^3.*cos(y).*3.6e+1+mu.^(3.0./2.0).*y.*cos(y).*7.2e+1+mu.*y.^2.*sin(y).*6.0e+1+mu.^2.*y.*sin(y).*3.0e+1+mu.*y.^3.*sin(y).*6.0e+1+mu.^(3.0./2.0).*y.*sin(y).*4.8e+1+mu.^(5.0./2.0).*y.*sin(y).*6.0+mu.^2.*y.^2.*cos(y).*3.0e+1+mu.^2.*y.^3.*cos(y).*1.8e+1+mu.^3.*y.^3.*cos(y)+mu.^(3.0./2.0).*y.^2.*cos(y).*7.2e+1+mu.^(3.0./2.0).*y.^3.*cos(y).*3.2e+1+mu.^(5.0./2.0).*y.^2.*cos(y).*6.0+mu.^(5.0./2.0).*y.^3.*cos(y).*6.0+mu.^2.*y.^2.*sin(y).*4.8e+1+mu.^2.*y.^3.*sin(y).*5.0e+1+mu.^3.*y.^2.*sin(y).*3.0+mu.^3.*y.^3.*sin(y).*7.0+mu.^(3.0./2.0).*y.^2.*sin(y).*7.2e+1+mu.^(3.0./2.0).*y.^3.*sin(y).*6.8e+1+mu.^(5.0./2.0).*y.^2.*sin(y).*1.8e+1+mu.^(5.0./2.0).*y.^3.*sin(y).*2.4e+1+mu.^(7.0./2.0).*y.^3.*sin(y))+sqrt(mu).*u2zero.*(exp(sqrt(mu).*y)-exp(sqrt(mu)))+sqrt(mu).*exp(sqrt(mu)-1.0).*(cos(1.0).*2.4e+2-sin(1.0).*1.6e+1).*1.0./(mu-sqrt(mu).*2.0+2.0).^4+sqrt(mu).*exp(sqrt(mu)-1.0).*(cos(1.0).*2.4e+2-sin(1.0).*1.6e+1).*1.0./(mu+sqrt(mu).*2.0+2.0).^4-sqrt(mu).*exp(-y+sqrt(mu).*y).*1.0./(mu-sqrt(mu).*2.0+2.0).^4.*(cos(y).*4.8e+1-sin(y).*4.8e+1+y.^2.*cos(y).*7.2e+1+y.^3.*cos(y).*2.4e+1+y.^2.*sin(y).*2.4e+1+y.^3.*sin(y).*3.2e+1+y.*cos(y).*9.6e+1-y.*sin(y).*2.4e+1)-sqrt(mu).*exp(-y-sqrt(mu).*y+sqrt(mu).*2.0).*1.0./(mu+sqrt(mu).*2.0+2.0).^4.*(cos(y).*4.8e+1-sin(y).*4.8e+1+y.^2.*cos(y).*7.2e+1+y.^3.*cos(y).*2.4e+1+y.^2.*sin(y).*2.4e+1+y.^3.*sin(y).*3.2e+1+y.*cos(y).*9.6e+1-y.*sin(y).*2.4e+1)
end