% function for Subtask 9
function [ support_func ] = supportLebesgue(f, x0, A, b, Aeq, beq, lb, ub)
    scalar = @(x, l) x(1)*l(1) + x(2)*l(2);
    function [c, ceq] = nlcon(x)
        c = f(x);
        ceq = [];
    end
    nonlcon = @nlcon;
    xx = @(l) fmincon(@(x) -scalar(x,l), x0, A, b, Aeq, beq, lb, ub, nonlcon);
    support_func = @(l) [scalar(xx(l),l), xx(l)];
end














