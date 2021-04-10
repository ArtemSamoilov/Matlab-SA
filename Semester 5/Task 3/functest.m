%% test function for Subtask 10
function f = functest(t)
    f = @(t) t .* exp(-t.^2);
    %f = @(t) sin(t)./t;
end