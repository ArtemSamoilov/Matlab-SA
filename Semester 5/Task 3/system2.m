%% functiion for Subtask 7-2
function dxdt = system2(t,xy)
    dxdt = [(xy(1)^2-2*xy(2)^3); (xy(1)*xy(2)^2)];
end