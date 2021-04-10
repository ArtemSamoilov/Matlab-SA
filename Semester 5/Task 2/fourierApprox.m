% function for Subtask 5
function fourierApprox(f,a,b,n,meth)        
    h = 0.001;
    x = a : h : b;
    sz = size(x);
    elem = zeros(1,sz(2));
    Fourier = elem;
    
    fy = f(x);
    yMax = max(fy)*2+1;
    yMin = min(fy);
    if(yMin < 0)
        yMin = yMin*2-1;
    elseif(yMin-0.1 <= 0)
        yMin = -yMax;
    else
        yMin = yMin/2-2;
    end
    
    func = plot(0,0);
    func.XData = x;
    func.YData = fy;
    func.LineStyle = '-';
    
    hold on
    fur = plot(0,0);
    fur.XData = x;
    fur.YData = [];
    fur.LineStyle = '-';    
    axis([a b yMin yMax]);
    
    xlabel('x');
    ylabel('Fourier sum(x)');
    legend('Fourier sum(x)','f(x)');
    
    mov(1:n) = struct('cdata', [],'colormap', []);
    for i = 1:n
        
        ci = getFunc(i,meth);
        g = @(x) ci((x-(b + a)/2) * (2*pi/(b - a)));
        Gx = g(x);
        
        axis([a b yMin yMax]);
        elem = trapz(x, Gx.*fy);
        elem = elem / (trapz(x, Gx .^2));
        Fourier = Fourier + elem.* Gx;
        
        fur.YData = Fourier;
        Ttype = strcat('Method: ', meth);
        Ti = strcat(' i= ', num2str(i));
        
        title(strcat(Ti, Ttype));
        
        
        %ci = getFunc(i,meth);
        %norm = trapz(x, ci(x).^2);
        %integrali = trapz(x, f(x).*ci(x))/norm;
        %y = ci(x);
        %y = integrali*y;
        %Fourier = Fourier+y;
        
        %plot(x, Fourier, x, fy);
        
        %Ttype = strcat('Method: ', meth);
        %Tn = strcat(' n =  ', num2str(i));
        
        %title(strcat(Ttype, Tn));
        mov(i) = getframe();
    end
    hold off;
end

