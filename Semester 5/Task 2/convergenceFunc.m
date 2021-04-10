% function for Subtask 4
function convergenceFunc(fn,f,a,b,n,convType)    
    x = linspace(a, b, n); 
    mov(1:n) = struct('cdata', [],'colormap', []);
    for i = 1:n
        switch(convType)
            case 'pointwise'
                fnorm = 0;
            case 'uniform'
                fnorm = max(abs(f(x)-fn(i,x)));
            case 'RMS'
                fnorm = sqrt(trapz(x,(abs(f(x) - fn(i,x))).^2));
            otherwise
                error("no such convergence")
        end
        Ttype = strcat('Type: ', convType);
        Tnorm = strcat(' Norm = ', num2str(fnorm, '%.5f'));
        Tn = strcat(' n =  ', num2str(i));
        
        plot(x, f(x), x, fn(i,x));
        legend({'f(x)','fn(x)'},'Location','northwest')
        
        title(strcat(Ttype, Tnorm, Tn));
        mov(i) = getframe();
    end
    movie(mov);
end