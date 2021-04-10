% function for Subtask 8
function [] = drawSet(rho, N)
    axis([-8 8 -8 8]);
    for i = 0 : N - 1
        
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
        if (currvector(2)*nextvector(1) - nextvector(2)*currvector(1)) ~= 0
            intersection2 = (nextvector(1)*value - currvector(1)*nvalue)/(currvector(2)*nextvector(1) - nextvector(2)*currvector(1));
            if currvector(1) ~= 0 || nextvector(1) ~= 0
                intersection1 = (value - intersection2*currvector(2))/currvector(1);
                line([point(1), intersection1], [point(2), intersection2], 'Color', 'blue');
                line([npoint(1), intersection1], [npoint(2), intersection2], 'Color', 'blue');
            else
                line([ point(1), npoint(1) ], [ point(2), npoint(2) ], 'Color', 'blue');
            end
        else
            line([ point(1), npoint(1) ], [ point(2), npoint(2) ], 'Color', 'blue');
        end
        line([point(1), npoint(1)], [point(2), npoint(2)], 'Color', 'red');
    end
    hold off;
end




