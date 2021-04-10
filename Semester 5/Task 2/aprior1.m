% функция оценки априорной и фактической погрешности
function aprior1(x, xx, f, M)
    y = f(x);
    yy = f(xx);
    yy1 = interp1(x, y, xx, 'linear');
    w = (x(2)-x(1))/2;
    
    yya = ones(size(xx,2));
    yya = yya*w*abs(M)/6;
    plot(xx, abs(yy-yy1), xx, yya);
    title('Aprior difference');
    legend({'error','aprior error'},'Location','northwest')
    xlabel('x');
    ylabel('y');
end