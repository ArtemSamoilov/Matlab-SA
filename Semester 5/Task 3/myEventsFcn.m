function [value, isterminal, direction] = myEventsFcn(t,y)

value = abs(y(1)).^2 + abs(y(2)).^2 - 1;
isterminal = 1;
direction = 0;
end