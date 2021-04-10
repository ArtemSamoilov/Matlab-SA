%% function for Subtask 10
function f = func3(t)
    f = @(t) exp((-1)*abs(t)).*((1+2*t)./(1+t.^4));
end