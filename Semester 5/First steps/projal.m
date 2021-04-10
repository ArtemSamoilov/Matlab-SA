clear

a = -pi;
b = pi;
n = 100;

% Plot |h - h/2|
for i = 1:n

h(i) = (b-a)/(2*i);

xx = a : h(i) : b;
yy = cos(xx.^2);



Ihr = my_rectangles(xx,yy);
Iht = trapz(xx,yy);
Ihs = my_simpson(xx,yy);

h2 = (b-a)/(4*i);
xx2 = a : h2 : b;
yy2 = dSi(xx2);

Ih2r = my_rectangles(xx2,yy2);
Ih2t = trapz(xx2,yy2);
Ih2s = my_simpson(xx2,yy2);

Ir(i) = abs(Ihr - Ih2r);
It(i) = abs(Iht - Ih2t);
Is(i) = abs(Ihs - Ih2s);

end

clear xx yy xx2 yy2 Ihr Iht Ihs Ih2r Ih2t Ih2s h2


figure(1);
loglog(h, Ir, h, It, h, Is);
title('Time difference');
legend({'|Ir-Ir2|','|It - It2|', '|Is - Is2|'},'Location','southwest')
xlabel('h');
ylabel('|dy - dy_n|');



%plot Si(x) by all methods

h = (b-a)/n;
x = a:h:b; %n+1 elements


ys1 = zeros(1,n+1);
ys2 = zeros(1,n+1);
ys3 = zeros(1,n+1);

for i = 1:n
xx = a: h : a+i*h;
yy = dSi(xx);
ys1(1,i) = my_rectangles(xx,yy);
ys2(1,i) = trapz(xx,yy);
ys3(1,i) = my_simpson(xx,yy);
%disp(i);
end
clear i xx yy;

figure(2);
plot(x,ys1, x,ys2, x,ys3);
legend({'my rectangles','trapz', 'my simpson'},'Location','southwest')
xlabel('x');
ylabel('y');
title('Integral of sin(x)/x');