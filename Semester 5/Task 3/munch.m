%% functiion for Subtask 5
function du = munch(t, u)
    alpha = 2;
    beta = 10;
    gamma = 1;
    delta = 0;
    x = u(1);
    y = u(2);
    du = zeros(2,1);
    du(1) = alpha*x - gamma*x*y;
    du(2) = delta*x*y - beta*y;
end
%% Systems for subtask 5
% Stationary
    %x = beta/delta;
    %y = alpha/gamma;
% Hungry predators
    %alpha = 10;
    %beta = 1;
    %gamma = 100;
    %delta = 10;
% Rabbits paradise
    %alpha = 100;
    %beta = 100000;
    %gamma = 1;
    %delta = 0.01;
% Black Plague Forest
    %alpha = 0.1;
    %beta = 100;
    %gamma = 100;
    %delta = 0.01;
% Balance
    %alpha = 10;
    %beta = 10;
    %gamma = 1;
    %delta = 0.1;