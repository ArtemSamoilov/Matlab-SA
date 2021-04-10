% функция оценки априорной и фактической погрешности
function aprior(x, xx, f, M, numofdif)
    y = f(x);
    yy = f(xx);
    yy1 = interp1(x, y, xx, 'nearest');
    
    xxa = xx+0.01;
    yya(:) = (M/(factorial(numofdif+1)))*abs(prod(xxa-xx(:)))
    
    plot(xx, yy-yy1, xx, yya);
    title('Aprior difference');
    legend({'error','aprior error'},'Location','northwest')
    xlabel('x');
    ylabel('y');
end