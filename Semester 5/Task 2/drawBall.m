% function for Subtask 14
function drawBall(alpha, params)
    [X,Y,Z] = meshgrid(params.a:params.h:params.b, params.a:params.h:params.b, params.a:params.h:params.b);
    F = params.f(X,Y,Z);
    g = isosurface(X,Y,Z,F,params.isovalue);
    p = patch(g);
    if(size(g.vertices) == 0)
        error('Empty')
    end
    isonormals(X,Y,Z,F,p);
    view(3);
    p.FaceColor = params.FaceColor;
    p.EdgeColor = params.EdgeColor;
    p.FaceAlpha = params.FaceAlpha;
    p.LineStyle = params.LineStyle;
    p.Marker = params.Marker;
    p.MarkerFaceColor = params.MarkerFaceColor;
    p.MarkerSize = params.MarkerSize;
    daspect([1 1 1]);
    axis tight;
    camlight;
    lighting gouraud;
end