%% functiion for Subtask 4
function [value, isterminal, direction] = boom(t, xy)
    R = 1;
    value = abs(xy(1)).^2+abs(xy(2)).^2-R^2;
    isterminal = 1;
    direction = 0;
end