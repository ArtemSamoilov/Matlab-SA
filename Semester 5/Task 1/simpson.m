%% Function for subtask 12
function integral = simpson(x,y)
    sz = size(x,2)-1;
    a = x(1,1);
    b = x(1, sz);
    h = (b-a)/sz;
    
    y1 = y(1,1:2:sz-2);
    y2 = y(1,2:2:sz-1);
    y3 = y(1,3:2:sz);

    integral = (h/3)*sum( (y1(:) + 4*y2(:) + y3(:)) );
end