% compares interpolation methods
function compareInterp(x, xx, f)
    y = f(x);
    yy = f(xx);
    
    yy1 = interp1(x, y, xx, 'nearest');
    % хорошо - дискретная функция
    % плохо - разрывы 2 рода или непрерывная функция
    yy2 = interp1(x, y, xx, 'linear');
    % хорошо - дифференцируемая функция
    % плохо - функция с счетным числом точек разрыва 1 или 2 рода
    yy3 = interp1(x, y, xx, 'spline');
    % хорошо - дифференцируемая и интегрируемая функция
    % плохо - функция с точкой разрыва 1 или 2 рода
    yy4 = interp1(x, y, xx, 'pchip');
    % хорошо - дифференцируемая и интегрируемая функция
    % плохо - функция с точкой разрыва 1 или 2 рода
    
    plot(xx, yy, xx, yy1, xx, yy2, xx, yy3, xx, yy4);
    title('Interpolations');
    legend({'function','nearest','linear', 'spline', 'pchip'},'Location','northwest')
    xlabel('x');
    ylabel('y');
end