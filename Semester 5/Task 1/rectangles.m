%% Function for subtask 12
function integral = rectangles(x,y)
    sz = size(x,2)-1;
    a = x(1,1);
    b = x(1, sz);
    h = (b-a)/sz;
    
    xi = x(1, 2:sz);
    xj = x(1, 1:(sz-1));
    yi = y(1, 2:sz);
    
    integral = sum(yi(:).*(xi(:)-xj(:)));
end
