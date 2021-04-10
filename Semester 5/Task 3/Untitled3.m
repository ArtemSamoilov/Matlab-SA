clear all; clc;
% Значения коэффициентов
b0  =  0.8; 
b1  =  1.3; 
b11 = -6.1;
b12 = -0.6;
b2  =  1.7;
b22 = -1.7;
g = 0.05; % постоянная шага
d = 0.01; % дельта
% Начальная точка
x1 = -9; 
x2 =  8; 
k = 1;  % Счетчик шагов
kmax = 100; % Предельное число шагов, 
% задается для предотвращения зацикливания
% Массивы для хранения промежуточных координат
x1trace = [x1]; 
x2trace = [x2]; 
clear
clc
f = @(x,y) x.^2.*y.^2+x.^2+y.^2;
gradx = @(x,y) 2*x.*y.^2+2*x;
grady = @(x,y) 2*x.*y.^2+2*y;
d = 0.01;
x1 = 2;
y1 = 2;
k = 1;
kmax = 10;
xtrace = [x1];
ytrace = [y1];
i = 2;
while k < kmax
[xy, grad] = f2minbnd(gradx,grady,x1,y1);
xtrace(i) = xy(1);
ytrace(i) = xy(2);
i = i + 1;
x1 = xy(1);
y1 = xy(2);
if grad <= d
break;
end
k = k + 1;
end
xtrace;
ytrace;
x = -2.5:0.01:2.5;
y = -2.5:0.01:2.5;
[X, Y] = meshgrid(x, y);
F = f(X,Y);
for i = 1:size(xtrace,2)
Z = [f(xtrace(i),ytrace(i)), f(xtrace(i),ytrace(i))];
[C, h] = contour(X,Y,F,Z);
clabel(C, h);
hold on;
end
hold on;
plot(xtrace, ytrace, 'r.');
text(xtrace(1), ytrace(1), 'XY1');
text(1, -2, char(['xf = ' (num2str(x1))], ['yf = ' (num2str(y1))], ['k = ' (num2str(k))]));