% function for Subtask 15
function drawBalls(alphas, colors, edges)
    sz = size(alphas);
    sz1 = size(colors);
    sz2 = size(edges);
    if(sz(2)==sz1(2) && sz1(2)==sz2(2))
        f = @(X, Y, Z, i) (abs(X).^alphas(i)+abs(Y).^alphas(i)+abs(Z).^alphas(i)).^(1./alphas(i));
        a = -1;
        b = 1;
        h = 0.1;
        [X,Y,Z] = meshgrid(a:h:b, a:h:b, a:h:b);
        FAlpha = 1:-1/sz(2):0.1;
        for i = 1:sz(2)
            F = f(X,Y,Z,i);
            g = isosurface(X,Y,Z,F,1);
            if(size(g.vertices) == 0)
                error('Empty')
            end
            p = patch(g);
            isonormals(X,Y,Z,F,p);
            p.FaceColor = colors(i);
            p.EdgeColor = edges(i);
            p.FaceAlpha = FAlpha(i);
        end
        daspect([1 1 1]);
        view(3);
        axis tight;
        camlight;
        lighting gouraud;
    end
end