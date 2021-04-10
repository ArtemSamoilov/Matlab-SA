%% function for Subtask 10
function y = ftfunc1(w)
    %y = @(w) (pi*exp(w./sqrt(5)).*((10-1i*sqrt(5))+(10+1i*sqrt(5))*exp((-2*w)./sqrt(5))))./(5*sqrt(5));
    %y = @(w) (pi*exp(w./sqrt(5)).*(10-1i*sqrt(5)))./(5*sqrt(5))+(pi*exp((-w)./sqrt(5)).*(10-1i*sqrt(5)))./(5*sqrt(5));
    %y = @(w) (2*pi/sqrt(5))./cosh(w./sqrt(5))+1i*(pi/5)./sinh(w./sqrt(5));
    %y = @(w) (-1/20)./cosh(w./sqrt(5))-1i/(2*sqrt(5))./sinh(w./sqrt(5));
    %y = @(w) double(w<0).*(pi/(5*sqrt(5)))*(10-1i*sqrt(5)).*exp(w./sqrt(5))+double(w>0).*(pi/(5*sqrt(5)))*(10+sqrt(5)).*exp(-w./sqrt(5));
    y = @(w) (pi*2/sqrt(5))*(double(w>0).*exp(-w./sqrt(5))+double(w<0).*exp(w/sqrt(5))) + 1i*(pi/5)*(double(w>0).*exp(-w./sqrt(5))-double(w<0).*exp(w/sqrt(5)));
end