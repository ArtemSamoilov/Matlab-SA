
% Samoilov Artem, 23.10.2020
% Task 1 for System Analysis Practicum
% Unauthorizd use of creator's intellectual property is strictly forbidden

%% Subtask 1, 2
clc
numofpoints = 100;
a = -10;
b = 10;
x = linspace(a, b, numofpoints);
xx = linspace(a, b, numofpoints*2);

f1 = @(x) double(x>=0); % функция Хевисайда
% хорошо для nearest
f2 = @(x) 1./x;
% плохо для nearest, spline, pchip
f3 = @(x) cos(x.^2);
% хорошо для linear
f4 = @(x) x.^3+3*x.^2-8*x+1;
% плохо для nearest, хорошо для остальных
f5 = @(x) tan(x);
% плохо для всех
f6 = @(x) exp(-x.^2);
% хорошо для spline, pchip
f7 = @(x) exp(x)./(x-1);
% просто интересная функция

figure (1)
compareInterp(x, xx, f1);

figure (2)
compareInterp(x, xx, f2);

figure (3)
compareInterp(x, xx, f3);

figure (4)
compareInterp(x, xx, f4);

figure (5)
compareInterp(x, xx, f5);

figure (6)
compareInterp(x, xx, f6);

figure (7)
compareInterp(x, xx, f7);

clear;

%% Subask 3
clc
numofpoints = 10;
a = -0.1;
b = 0.1;
x = linspace(a, b, numofpoints);
xx = linspace(a, b, numofpoints*2);

f1 = @(x) double(x>=0);
f2 = @(x) x.^3+3*x.^2-8*x+1;
f3 = @(x) sin(2*x);

figure (1)
M = 1;
numofdif = 0;
aprior(x, xx, f1, M, numofdif);

figure (2)
M = 4;
numofdif = 2;
aprior(x, xx, f2, M, numofdif);

clear;


%% Subtask 3.1
clc
numofpoints = 10;
a = 0.001;
b = 0.01;
x = linspace(a, b, numofpoints);
xx = linspace(a, b, numofpoints*2);
f1 = @(x) log(x);

figure (1)
M = 1000;
aprior1(x, xx, f1, M);

a = 105;
b = 110;
x = linspace(a, b, numofpoints);
xx = linspace(a, b, numofpoints*2);
f2 = @(x) x.*sin(x);

figure (2)
M = 106,8;
aprior1(x, xx, f2, M);

clear;

%%
fn = @(x,n) sin(x)./n;
f = @(x) 0 * x;
conv(fn, f, 0, 2*pi, 50, 'uniform');

%% Subtask 4
clc
a = 0;
b = 1;

n = 50;

fn1 = @(n,x) x.^2+1/n^2;
f1 = @(x) x.^2;
convergenceFunc(fn1,f1,a,b,n,'uniform');
convergenceFunc(fn1,f1,a,b,n,'pointwise');
convergenceFunc(fn1,f1,a,b,n,'RMS');

fn2 = @(n,x) cos(pi*n*x/2).*double(x <= 1/n);
f2 = @(x) 1.*double(x == 0);
convergenceFunc(fn2,f2,a,b,n,'RMS');
convergenceFunc(fn2,f2,a,b,n,'uniform');
convergenceFunc(fn2,f2,a,b,n,'pointwise');

fn3 = @(n,x) x.^n;
f3 = @(x) double(x>=0)*0+(x==1)*1;
convergenceFunc(fn3,f3,a,b,n,'RMS');
convergenceFunc(fn3,f3,a,b,n,'uniform');
convergenceFunc(fn3,f3,a,b,n,'pointwise');

clear

%% Subtask 5
clc

a = -10;
b = 10;
n = 50;
f1 = @(x) x;
f2 = @(x) exp(x);

fourierApprox(f1,a,b,n,'trig');
fourierApprox(f2,a,b,n,'trig');

fourierApprox(f1,a,b,n,'wals');
fourierApprox(f2,a,b,n,'wals');

fourierApprox(f1,a,b,n,'legp');
fourierApprox(f2,a,b,n,'legp');


%% Subtask 6 - Part 1
clc
a = -10;
b = 10;
n = 1000;
%a = -1;
%b = 6;

x = linspace(a,b,n);
y = exp(-x.^2).*sin(x);
%y = x.*sin(x);

%% Subtask 6 - Part 2
clc
y = fliplr(y);
ylmin = islocalmin(y);
sz = size(ylmin);
if(sz(2) == 0)
    ylmin = min(y);
end
ygmax = max(y);
xgmax = x(y == ygmax);

xgmax_ind = find(x == xgmax);

xl_min_ind = find(islocalmin(y));

lxgmax = max(find(xl_min_ind < xgmax_ind));
rxgmax = lxgmax + 1;
xind1 = xl_min_ind(lxgmax);
xind2 = xl_min_ind(rxgmax);
left = xgmax_ind-xind1;
right = xind2-xgmax_ind;

figure(1)
plot( x, y, x(ylmin), y(ylmin), 'b*', xgmax, ygmax, 'r*', x(xind1:xind2),y(xind1:xind2), 'r');
hold on
if(left < right)
    comet(fliplr(x(xind1:xgmax_ind)), fliplr(y(xind1:xgmax_ind)));
else
    comet(x(xgmax_ind:xind2), y(xgmax_ind:xind2))
end
hold off

clear

%% Subtask 7
clear
clc

A = 1;
B = 1;
a = 1;
b = 1;
delta = 10;

f = @(t) sin(t.*a + delta).*A;
g = @(t) sin(t.*b).*B;

t0 = 0;
t1 = 14;
N = 15;

getEqual(f, g, t0, t1, N);

step = (t1-t0)/(N-1);
linsp = t0:step:t1;
x = f(linsp);
y = g(linsp);

M(1:N, 1) = x;
M(1:N, 2) = y;

Mdist = pdist2(M, M);

sum = 0;
for i=1:N-1
    sum = sum+Mdist(i, i+1);
end

meandist = sum/(N-1)

plot(x, y, 'o', 'MarkerFaceColor', 'green', 'MarkerSize', 6);
plot(x(1), y(1), 'o', 'MarkerFaceColor', 'red', 'MarkerSize', 10);
plot(x(end), y(end), 'o', 'MarkerFaceColor', 'green', 'MarkerSize', 10);
axis equal
hold off

%% Subtask 8-1
clc
clear

rcenter = [2, 1];
diag1 = 5;
diag2 = 3;

% f = |x-x0|/diag1+|y-y0|/diag2-1

rho = @(l) [max(diag1*abs(l(1)), diag2*abs(l(2))) + l(1)*rcenter(1) + l(2)*rcenter(2), rcenter(1)+(diag1*abs(l(1)) >= diag2*abs(l(2)))*diag1*sign(l(1)), rcenter(2) + (diag1*abs(l(1))<diag2*abs(l(2)))*diag2*sign(l(2))];
drawSet(rho, 99)
rho([4, 6])


%% Subtask 8-2
clc
clear

scenter = [0, 0];
side = 6;

% f = max(|x-x0|, |y-y0|) - side/2;

rho = @(l) [(side/2)*(abs(l(1)) + abs(l(2))) + l(1)*scenter(1) + l(2)*scenter(2), (l(1)>0)*side/2 + (l(1)<=0)*(-side/2)+scenter(1), scenter(2)+(l(2)>0)*side/2 + (l(2)<=0)*(-side/2)];
drawSet(rho, 501)
rho([1,5])

%% Subtask 8-3
clc
clear

ecenter = [1, 1];
a = 6;
b = 4;

%f = (x-x0)^2/a^2 + (y-y0)^2/b^2 - 1;

rho = @(l) [l(1)*ecenter(1) + l(2)*ecenter(2) + sqrt(  (l(1)*a)^2 + (l(2)*b)^2  ), ecenter(1)+l(1)*(a^2)/(sqrt((l(1)^2)*(a^2) + (l(2)^2)*(b^2))), ecenter(2)+l(2)*(b^2)/(sqrt((l(1)^2)*(a^2) + (l(2)^2)*(b^2)))];

drawSet(rho, 99)
rho([1, 0])


%% Subtask 9
clc
clear
f = @(x) sqrt(x(1)^2 + x(2)^2) - 1;

x0 = [0, 0];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [-4, -4];
ub = [4, 4];

suppf = supportLebesgue(f, x0, A, b, Aeq, beq, lb, ub);

suppf([-10, 50])

%% Subtask 10-1
clc
clear

rcenter = [0, 0];
diag1 = 3;
diag2 = 1.5;
% f = |x-x0|/diag1+|y-y0|/diag2-1
rhorhombus = @(l) [ max( diag1*abs(l(1)), diag2*abs(l(2)) ) + l(1)*rcenter(1) + l(2)*rcenter(2), rcenter(1) + (diag1*abs(l(1))>=diag2*abs(l(2)))*diag1*sign(l(1)), rcenter(2) + (diag1*abs(l(1))<diag2*abs(l(2)))*diag2*sign(l(2)) ];

axis([-10 10 -20 10])
hold on
drawPolar(rhorhombus, 100);

%% Subtask 10-2
clc
clear

scenter = [0, 0];
side = 4;
% f = max(|x-x0|, |y-y0|) - side/2;
rhosquare = @(l) [ (side/2)*(abs(l(1)) + abs(l(2))) + l(1)*scenter(1) + l(2)*scenter(2), (l(1)>0)*side/2 + (l(1)<=0)*(-side/2)+scenter(1), scenter(2)+(l(2)>0)*side/2 + (l(2)<=0)*(-side/2) ]

drawPolar(rhosquare, 100);

%% Subtask 10-3
clc
clear

ecenter = [3, 3];
a = 3;
b = 2;
%f = (x-x0)^2/a^2 + (y-y0)^2/b^2 - 1;
rho = @(l) [ l(1)*ecenter(1) + l(2)*ecenter(2) + sqrt((l(1)*a)^2 + (l(2)*b)^2), ecenter(1)+l(1)*(a^2)/(sqrt((l(1)^2)*(a^2) + (l(2)^2)*(b^2))), ecenter(2)+l(2)*(b^2)/(sqrt((l(1)^2)*(a^2) + (l(2)^2)*(b^2)))];

axis([-100 10 -100 10])
hold on
drawPolar(rho, 10000)

%% Subtask 11-0
clc
clear
n = 20;
t = 1:n;
[x,y] = meshgrid(-5:0.1:5,-5:0.1:5);
z = @(x,y,a) a.*(sin(x))+cos(y);
save("wavepoints.mat");

%% Subtask 11-1
mov(1:n) = struct('cdata',[],'colormap',[]);

for i = 1:n
    F = z(x,y,t(i));
   
    Fmax = islocalmax(F,2);
    Fmin = islocalmin(F,2);
    Mmax = Fmax.*F;
    M = Fmin.*F;
    FFmax = islocalmax(Mmax);
    FFmin = islocalmin(M);   
    
    surf(x,y,F);
    
    hold on
    plot3(x.*FFmin,y.*FFmin,F.*FFmin,'r.','MarkerSize',40);
    plot3(x.*FFmax,y.*FFmax,F.*FFmax,'g.','MarkerSize',40);
    hold off
    
    mov(i) = getframe();
  
end
mov1 = VideoWriter('wave.avi');
mov1.FrameRate = 1;
open(mov1);
writeVideo(mov1,mov);
close(mov1);

%% Subtask 11-2
load('wavepoints.mat');
movie(mov);

%% Subtask 11-3
b = 2*pi;
[x,y] = meshgrid(-2:0.2:2);
F = z(x,y,b);
contour(F,1);

%% Subtask 12
mov1 = VideoWriter('wave.avi');
open(mov1);
writeVideo(mov1,mov);
close(mov1);
save('wavepoints.mat','mov');

%% Subtask 13
clc
clear
points = [1,2,3; 4,-5,6];
L = 20;
p = 2;
viewEaten(points,L,p);

%% Subtask 14
clc

h = 0.1;
a = -2;
b = 2;
alpha = 2;
f = @(x, y, z) abs(x).^alpha+abs(y).^alpha+abs(z).^alpha;

params.f = f;
params.a = a;
params.b = b;
params.h = h;
params.isovalue = 4;
params.FaceColor = 'red';
params.EdgeColor = 'blue';
params.color = 'green';
params.FaceAlpha = 1;
params.LineStyle = '-';
params.Marker = 'o';
params.MarkerFaceColor = 'green';
params.MarkerSize = 3;


drawBall(alpha, params);
clear

%% Subtask 15
clc

alphas = 1:1:10;
colors = ["black", "red", "blue", "green", "yellow", "black", "red", "blue", "green", "yellow"];
edges = ["yellow", "blue", "green", "red", "black", "yellow", "blue", "green", "red", "black"];

drawBalls(alphas, colors, edges);
clear

%%
clc
clear

[x,y,F,v] = flow;
isosurface(x,y,F,v,-1);
p = patch(isosurface(x,y,F,v,-3));
isonormals(x,y,F,v,p);
p.FaceColor = 'red';
p.EdgeColor = 'blue';
p.FaceAlpha = 1;
p.LineStyle = '-';
p.Marker = 'o';
p.MarkerFaceColor = 'green';
p.MarkerSize = 3;
daspect([1 1 1]);
view(3);
axis tight;
camlight;
lighting gouraud;


%%
X(1:3,1) = [10 2 3]
X(1:3,2) = [0 0 0]
pdist2(X,X)


%% трехмерная графика
clc
clear
f = @(x, y, p) sin(p*x) + cos(p*y);
h_x = 0.1;
h_y = 0.1;
x = -pi:h_x:pi;
y = -pi:h_y:pi;
[X, Y] = meshgrid(x, y);
p_min = 1;
p_max = 3;

%% task11
nFrames = 100;
C = ones(size(X));
mov(1:nFrames) = struct('cdata', [],'colormap', []);
for i = 1:nFrames
p = p_min + i * (p_max - p_min) / nFrames;

ind_max = find(f(X, Y, p) >= f(X + h_x, Y, p) & f(X, Y, p) >= f(X - h_x, Y, p) & f(X, Y, p) >= f(X, Y + h_y, p) & f(X, Y, p) >= f(X, Y - h_y, p));
ind_min = find(f(X, Y, p) <= f(X + h_x, Y, p) & f(X, Y, p) <= f(X - h_x, Y, p) & f(X, Y, p) <= f(X, Y + h_y, p) & f(X, Y, p) <= f(X, Y - h_y, p));
C = ones(size(X));
C(ind_min) = 10;
C(ind_max) = 15;
surf(X, Y, f(X, Y, p), C);
mov(i) = getframe();
end

%%
movie(mov);

%% task12
v = VideoWriter('task12.avi');
open(v);
writeVideo(v, mov);
close(v);
