clc
clear

    v = @(x, y) x.^2 + y.^2;
    t0 = -10;
    tf = 10;
    n = 20;
    tetta = linspace(0, 2*pi, n);
    r = 1;
    max = 15;

    axis([-max max -max max]);
    hold on;
    [X, Y] = meshgrid(-max:0.02:max, -max:0.02:max);
    Z = v(X, Y);
    %colormap cool;
    contourf(X, Y, Z, 20);
    %colorbar

    for i=1:n
        y0 = [r*cos(tetta(i)), r*sin(tetta(i))];
        [t, F] = ode45(@system1, [t0, tf], y0);
        plot(F(:, 1), F(:, 2), 'k');       
    end;
    
    title('ѕерва€ система: x'' = x^3 - y; y'' = x + y^3');
    legend('траектори€ системы', 'линии уровн€');
    hold off