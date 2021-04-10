%% functiion for Subtask 7-1
function dxdt = system1(t,xy)
    dxdt = [(xy(2)-xy(1)+xy(1)*xy(2)); (xy(1)-xy(2)-xy(1)^2-xy(2)^3)];
end