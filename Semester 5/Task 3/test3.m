close all
clear
clc

f = @(x) double(x ~= 0).*x.*sin(1./x);

a = -2;
b = 2;
n = 10000;
xxx = linspace(a,b,n);
y = f(xxx);

X = zeros(1,n);

numer = [];
for i = 1:n    
    if xxx(i) == 0
        y(i) = 0;
    else
        
        if (i < length(xxx))&&(f(xxx(i))*f(xxx(i+1)) < 0)
            y(i) = fzero(f, [xxx(i) xxx(i+1)]);
            y(numer) = y(i);
            numer = [];
        elseif (i == length(xxx))
            y(i) = fzero(f, xxx(i));
        else
            numer = [numer i];
        end
    end
end


plot(xxx, y);