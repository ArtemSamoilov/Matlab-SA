%%
%Task 3_4'
clc
clear
t0 = 0;
t1 = 1;
b = -1/2;
c = 1/3;
speed_x = 10;
speed_y = 10;

alpha = 1;
f = @(x) (1 - (x).^2 ).^(1/2);
x = linspace(-1,1,100);
hold on
plot(x,f(x),'r',x,-f(x),'r');
axis equal;

flag = 1;

while flag
    options = odeset('Events', @myEventsFcn);
    [t, y, te, ye, ie] = ode45(@(t,y) odefcn(t,y),[t0 t1],[b c speed_x speed_y],options);
    n = numel(y(:,1));
    y_x = y(:,1);
    y_y = y(:,2);
    comet(y_x(:), y_y(:));
    hold on
    if(isempty(te))
        break;
    end

    if ((size(te))~=0)
        t0 = te;
    else
        t0 = t1;
        flag = 0;
    end
    if (size(ye)~=0)
        y = @(x) (ye(2)/ye(1))*x;
        eps_x = 0.0001;
        x_eps = ye(1) - (ye(1)/abs(ye(1)))*eps_x;
        y_eps = y(x_eps);
        b = x_eps;
        c = y_eps;
        e_1 = [ye(1), ye(2)];
        e_2 = [-ye(2), ye(1)];

        v_s = e_2*dot(e_2,v_s_b) - e_1*dot(e_1,v_s_b)./alpha;
        speed_x = v_s(1);
        speed_y = v_s(2);
        %v_s_b = [speed_x, speed_y];
        v_s_b = v_s;
    end

end
