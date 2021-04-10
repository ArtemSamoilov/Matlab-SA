% Samoilov Artem, 10.09.2020
% Task 1 for System Analysis Practicum
% Unauthorizd use of creator's intellectual property is strictly forbidden

%% Subtask 1
a = -5;
b = 5;
n = 1000;

x = linspace(a, b, n);
y = abs(x).*sin(2*x.^2+1);
min = islocalmin(y);
max = islocalmax(y);

plot(x, y, 'b');
hold on
plot(x(min), y(min),'+', x(max), y(max), '*');
hold off

xlabel('x')
ylabel('y=f(x)')
title('Plot of subtask 1 function')
clear

%% Subtask 2
prompt = 'Enter a number: ';
n = input(prompt);
if ~isprime(n) || n < 0
    error('Not a prime number')
end

%1
vector = 7:14:n

%2
vector = 1:n;
A = repmat(vector, n, 1) + 1;
A = A.'

%3
% :
n = n+1;
A = zeros(n,n);
A(:) = 1:1:n*n;
A = A'


c = A.';
c = c(:).'
%c = reshape(A', 1, [])

D = A(:, n-1:n)
clear

%% Subtask 3
%randn
A = zeros(13,7)+5;
n = 0.001^(1/2);
B = ones(13,7).*n;
F = normrnd(A, B)

maxdiag = max(diag(F))
ratio = prod(F.')./sum(F.');
maxElem = max(ratio)
minElem = min(ratio)

sortedF = flipud(sortrows(F))
clear

%% Subtask 4
prompt = 'Enter a number: ';
n = input(prompt);
if n < 5
    error('Number too small')
end
m = 2*n + 1;

% option 1
A = zeros(m, m);

for i = 2:2:m
    A(1,i) = 5;
    A(m, i) = 5;
    A(i, 1) = 5;
    A(i, m) = 5;
end
A(n:2:n+2,n:2:n+2) = 10;
A(n+1, n+1) = -5

% option 2
col = zeros(m,1);
cornerCol = col;
for i = 1:n
    cornerCol(2*i) = 5
end
fivCol = col;
fivCol(1) = 5;
fivCol(m) = 5;
tenCol = col;
tenCol(n) = 10;
tenCol(n+2) = 10;
if mod(n,2)==0
    centerCol = col;
    centerCol(n+1) = -5;
    tenCol(1) = 5;
    tenCol(m) = 5;
else
    centerCol = fivCol;
    centerCol(n+1) = -5;
end
    
A = cornerCol;

for i = 1:m-1
    switch i
        case m-1
            A = [A, cornerCol];
        case n
            A = [A, centerCol];
        case n-1
            A = [A, tenCol]
        case n+1
            A = [A, tenCol]
        otherwise
            if mod(i,2) == 1
                 A = [A, fivCol];
            else
                A = [A, col];
            end
    end
end
A

% option 3
A = zeros(m, m);

for i = 2:2:m
    A(1, i) = 5;
    A(m, i) = 5;
    A(i, 1) = 5;
    A(i, m) = 5;
end

diagVect = [10, -5, 10]
B = diag(diagVect, 0);
B(1, 3) = 10;
B(3, 1) = 10;

A(n:n+2, n:n+2) = B
clear

%% Subtask 5
prompt = 'Enter matrix dimension: ';
n = input(prompt);
if n < 1
    error('Number too small')
end

xvector = 10*randn(1, n);
yvector = 10*randn(1, n);
xymatr = xvector'*yvector;
yxmatr = yvector'*xvector;

A = xymatr - yxmatr
clear

%% Subtask 6
prompt = 'Enter 1''st vector''s dimension: ';
n = input(prompt);
if n < 1
    error('Number too small')
end
prompt = 'Enter 2''nd vector''s dimention: ';
m = input(prompt);
if m < 1
    error('Number too small')
end

a = 100*randn(1, n);
b = 100*randn(1, m);

min1 = max(max(a)-max(b), max(b)-max(a));
min2 = max(min(a)-min(b), min(b)-min(a));
minimum = min(min1, min2)
maximum = max(max(a)-min(b), max(b)-min(a))

clear

%% Subtask 7
n = 10;
A = zeros(10,10);
%find
A = rand(n,n);
A = (A > 0.7).*A
for i=1:n
    [row, col, val] = find(A(:,i));
    row(1)
    i
    val(1)
end

clear

%% Subtask 8
prompt = 'Enter space dimension: ';
k = input(prompt);
if k < 1
    error('Number too small')
end

prompt = 'Enter number of points: ';
n = input(prompt);
if n < 1
    error('Number too small')
end

A = 10*randn(n, k);
A = A'
B = repmat(A, 1, n)
A = repmat(A, n, 1)
A = reshape(A, k, n*n)
A = A-B
A = sqrt(sum((A.*A), 1));
A = reshape(A, n, n)

clear

%% Subtask 9
vector = 1000:10:10000;
numoftests = 500;
mystorage = zeros(1,length(vector));
mulstorage = zeros(1,length(vector));
dotstorage = zeros(1,length(vector));
for i = 1:length(vector)
   x = 100*rand(1,vector(i));
   y = 100*rand(1,vector(i));
   tic
   for j = 1:numoftests
       my_prod(x,y);
   end
       mystorage(1,i) = toc/numoftests;
   tic
   for j = 1:numoftests
       x*y';
   end
   mulstorage(1,i) = toc/numoftests;
   tic
   for j = 1:numoftests
       dot(x,y);
   end
   dotstorage(1,i) = toc/numoftests;
end

plot(vector, mystorage, 'r-')
hold on
    plot(vector, mulstorage, 'b-')
    plot(vector, dotstorage, 'g-')
    legend("my", "mul", "dot")
hold off
clear;

%% Subtask 10
A = [11 2 3; 4 5 6; 7 8 9]
B = [7 8 9; 4 5 6; 13 14 11]
ismem = ismember(A,B)
rows = ismember(A,B,'rows')

row = [1:3];
col = ones(1,3);
sz = [3 3];

vector = sum(ismem');
checkvector = ones(1, length(ismem))*length(ismem);
ismemrows = vector == checkvector;
answer = ismemrows';


%% Subtask 11
prompt = 'Enter vector''s dimension: ';
n = input(prompt);
if n < 1
    error('Number too small')
end
prompt = 'Enter expectancy: ';
a = input(prompt);
prompt = 'Enter dispersion: ';
sigmasq = input(prompt);
prompt = 'Enter b: ';
b = input(prompt);

A = zeros(1,n)+a;
sigma = sigmasq^(1/2);
B = ones(1,n).*sigma;
F = normrnd(A,B);

vector = find(abs(F-a)>b);
v = size(vector);
v(2) > sigmasq/b^2
clear;

%% Subtask 12
clear
a = -pi;
b = pi;
numofsteps = 100;

for i = 1:numofsteps
   h(i) = (b-a)/(2*i);
   x = a:h(i):b;
   y = cos(x.^2);
   
   antider_trap_h(i) = trapz(x,y);
   antider_rect_h(i) = rectangles(x,y);
   antider_simp_h(i) = simpson(x,y);
   
   hh = h(i)/2;
   xx = a:hh:b;
   yy = cos(xx.^2);
   
   antider_trap_hh(i) = trapz(xx,yy);
   antider_rect_hh(i) = rectangles(xx,yy);
   antider_simp_hh(i) = simpson(xx,yy);

end

   antider_trap(:) = abs(antider_trap_h(:) - antider_trap_hh(:));
   antider_rect(:) = abs(antider_rect_h(:) - antider_rect_hh(:));
   antider_simp(:) = abs(antider_simp_h(:) - antider_simp_hh(:));   

figure(1);
loglog(h, antider_trap, h, antider_rect, h, antider_simp);
title('Convergence rate');
legend({'trapz','rectangles', 'simpson'},'Location','southeast')
xlabel('h');
ylabel('convergence');

h = (b-a)/numofsteps;
X = a:h:b;

ytrap = zeros(1,numofsteps+1);
yrect = ytrap;
ysimp = ytrap;

for i = 1:numofsteps
    x = a:h:(a+i*h);
    y = cos(x.^2);
    ytrap(1,i) = trapz(x,y);
    yrect(1,i) = rectangles(x,y);
    ysimp(1,i) = simpson(x,y);
end

figure(2);
plot(X,ytrap, X,yrect, X,ysimp);
title('Antiderivative');
legend({'trapz','rectangles', 'simpson'},'Location','southeast')
xlabel('X');
ylabel('Y');


%% Subtask 13
%f(x) = exp(x)
number = 1000;
x = logspace(-10,-1,number);
f = exp(0);
right = (exp(x)-exp(0))./x;
center = (exp(x)-exp(-x))./(2*x);

rdifference = abs(f-right);
cdifference = abs(f-center);
loglog(x,rdifference, x, cdifference);
legend({'Right','Central'});
clear

















