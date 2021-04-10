% function for Subtask 7
function [array] = getEqual(f, g, t0, t1, N)
    Num = 10000;
    h = (t1 - t0)/Num;
    linsp = t0:h:t1;
    
    matrix(1:Num+1, 1) = f(linsp);
    matrix(1:Num+1, 2) = g(linsp);
    Mdist = pdist2(matrix, matrix);

    points(1:N-1) = linsp(1:N-1);
    points(1,N) = linsp(end);
    pointsids(1:N) = 1:N;
    pointsids(N) = size(linsp, 2);
    
    Arrdist = zeros(1,N-1);
    for i = 1:N-1
        Arrdist(i) = Mdist(pointsids(i), pointsids(i+1));
    end
    
    while (max(Arrdist)-min(Arrdist)) > 0.01
        idxs = find(Arrdist == max(Arrdist));
        idx = idxs(end);
        if idx ~= 1
            points(idx) = points(idx) + h;
            pointsids(idx) = pointsids(idx) + 1;
            Arrdist(idx) = Mdist(pointsids(idx), pointsids(idx + 1));
            Arrdist(idx - 1) = Mdist(pointsids(idx - 1), pointsids(idx));
        else
            break;
        end
    end
    
    array(1, 1:N) = f(points);
    array(2, 1:N) = g(points);
    
    plot(f(linsp), g(linsp), '-o', 'MarkerIndices', pointsids, 'MarkerFaceColor', 'red', 'MarkerSize', 6);
    hold on
    axis equal
    
    eqdist = Arrdist(1,1)
end








