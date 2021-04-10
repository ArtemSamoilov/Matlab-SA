%% test function for Subtask 10
function y = ftfunctest(w)
    %y = @(w) (1/2)*pi*(sign(1-w)+sign(w+1));
    y = @(w) (-1/2)*(1i)*sqrt(pi)*exp(-w.^2./4).*w;
end