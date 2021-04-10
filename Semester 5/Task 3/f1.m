%Functiion g
function du = munch(t, u)
    alpha = 10;
    beta = 10;
    gamma = 1;
    delta = 0.1;
    x = u(1);
    y = u(2);
    du = zeros(2,1);
    du(1) = alpha*x - gamma*x*y;
    du(2) = delta*x*y - beta*y;
end