% function for Subtask 13
function viewEaten(points, L, p)
    n = size(points,1)*size(points,2);
    maxspace = max(max(abs(points),L))/2;
    minspace = -maxspace;
    step = 0.01;
    [x,y] = meshgrid(minspace:step:maxspace);
    F = x*0;
    for i = 1:n/2          
        G = ((points(1,i) - x).^p + (points(2,i) - y).^p).^(1/p);
        F = F + abs(G);
    end
    
    minL = min(min(F))
    
    hold on
    C = contour(x,y,F,[L,L]);
    fill(C(1,2:end),C(2,2:end),'green');
    plot(points(1,1:n/2),points(2,1:n/2),'r.','MarkerSize',10);
    ttl = "L = " +L+ ", p = " +p;
    title(ttl);
    daspect([1 1 1]);
    hold off
end