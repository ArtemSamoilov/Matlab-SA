% function for Subtask 5
function ci = getCheb(i)
    ci = @(i,x) cos((i-1).*acos(x));
end