% function for Subtask 5
function ci = getTrig(i)
    i = i-1;
    if(mod(i,2) == 1)
        ci = @(x) sin(x*i);
    else
        ci = @(x) cos(x*i);
    end
end