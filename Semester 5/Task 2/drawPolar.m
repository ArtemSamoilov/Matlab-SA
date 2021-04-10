% function for Subtask 10
function [] = drawPolar(rho, N)
    polarray = zeros(N, 2);
    for i = 0:N-1
        angle = 2*pi*i/N;
        nextangle = 2*pi*(i + 1)/N;
        
        currvector(1) = cos(angle);
        currvector(2) = sin(angle);
        nextvector(1) = cos(nextangle);
        nextvector(2) = sin(nextangle);
        
        valandpoint = rho(currvector);
        value = valandpoint(1);
        point = valandpoint(2:3);
        
        nvalandpoint = rho(nextvector);
        nvalue = nvalandpoint(1);
        npoint = nvalandpoint(2:3);
        
        hold on;
        line([point(1), npoint(1)], [point(2), npoint(2)], 'Color', 'blue');
        
        if value > 0
            polarray(i + 1, 1) = currvector(1)/value;
            polarray(i + 1, 2) = currvector(2)/value;
            %rho([polarray(i+1,1), polarray(i+1,2)]);
        elseif value < 0
            currvector = currvector.*(-1);
            valandpoint = rho(currvector);
            value = valandpoint(1);
            polarray(i + 1, 1) = currvector(1)/value; 
            polarray(i + 1, 2) = currvector(2)/value;
        end
    end
    [k, av] = convhull(polarray);
    array = zeros(size(k, 1), 2);
    for i = 1:size(k, 1)
        array(i, 1) = polarray(k(i),1);
        array(i, 2) = polarray(k(i),2);
        
    end
    patch(array(:,1), array(:,2), 'red');
    daspect([1 1 1]);
    hold off;
end