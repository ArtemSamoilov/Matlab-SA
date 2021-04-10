function [xy, grad] = f2minbnd(gradx, grady, x, y)
    g = 0.05;
    grx = gradx(x,y);
    gry = grady(x,y);
    x = x - g*abs(grx);
    y = y - g*abs(gry);
    xy(1) = x;
    xy(2) = y;
    grad = sqrt(grx^2 + gry^2);
end