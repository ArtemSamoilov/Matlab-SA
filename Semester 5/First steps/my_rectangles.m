%% Function for subtask 12
function integral = my_rectangles(x,y)
    sz = size(x,2)-1;
    a = x(1,1);
    b = x(1, end);
    h = (b-a)/sz;
    
    xi = x(1, 2:end);
    xj = x(1, 1:(end-1));
    yi = y(1, 2:end);
    
    integral = sum(yi(:).*(xi(:)-xj(:)));
end
