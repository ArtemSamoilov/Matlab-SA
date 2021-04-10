% function for Subtask 5
function ci = getWal(i)
    ci = @(i,x) sign(sin((2.^(i-1))*pi*x));
end