%% function for Subtask 10
function f = func2(t)
    f = @(t) exp(-(t.^2)).*sinh(t);
end