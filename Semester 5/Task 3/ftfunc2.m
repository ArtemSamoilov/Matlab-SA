%% test function for Subtask 10
function y = ftfunc2(w)
    %y = @(w) -(exp((-1/4).*(w+1i).^2).*(exp(1i*w)))./(2*sqrt(2));
    %y = @(w) (sqrt(pi)/2)*(exp(((1i*w-1)./2).^2)-exp(((1i*w+1)./2)).^2);
    y = @(w) -sqrt(pi)*1i*exp((1-(w.^2))./4).*sin(w/2);
end