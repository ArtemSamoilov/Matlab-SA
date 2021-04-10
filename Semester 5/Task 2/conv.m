
% function for Subtask 4
function conv(fn, f, a, b, n, convType)
    %F = figure;
    %F.Visible = 'off';
    mov(1:n) = struct('cdata', [],'colormap', []);
    x = linspace(a,b,100);
    for i = 1:n
        if (convType ~= "pointwise")
            Rfi = max(abs(fn(x,i) - f(x)));
            
        end
        plot(x, fn(x,i),x,f(x));
        title(['max|f(x) - fi(x)| = ', num2str(Rfi)]);
        axis ([0 2*pi -2 2]);
        mov(i) = getframe();
    end
    %F.Visible = 'on';
    movie(mov,1,4);
end