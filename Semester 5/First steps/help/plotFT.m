function res = plotFT(hFigure, fHandle, fFTHandle, step, inpLimVec, outLimVec)
    SPlotInfo = get(hFigure, 'UserData');% read the metadata
    figure(hFigure);% set currect figure
    if (isempty(SPlotInfo))% if there isn't metadata the create it and create the axes
        clf(hFigure);
        R = subplot(2, 1, 1);
        xlabel(R, '\lambda');
        ylabel(R, 'Re F(\lambda)');
        title(R,'Real value of Furier transform');
        
        I = subplot(2, 1, 2);
        xlabel(I,'\lambda');
        ylabel(I,'Im F(\lambda)');
        title('Imaginative value of Furier transform');
        
        SPlotInfo = struct('Real', R, 'Imag', I);
    else % else use premade data
        R = SPlotInfo.R;
        I = SPlotInfo.I;
        R.Children = [];
        I.Children = [];
    end
    

    
    a = inpLimVec(1);
    b = inpLimVec(2);
    c = outLimVec(1);
    d = outLimVec(2);
    
    N = fix((b - a) / step);
    step = (b - a) / N;% recalc step
    
    p = a : step : b - step; % function grid
    
    
    hold(R, 'on');
    hold(I, 'on');
    
%    NFFT = 2^nextpow2(N);
%    YAprox = fft(fHandle(p), NFFT) / N;
%    YAprox = YAprox(1 : N);

    y = fHandle(p);


    YAprox = fft(y);
    YAprox = fftshift(YAprox);
    plot(R, p, real(YAprox), '-b');
    plot(I, p, imag(YAprox), '-b');
    
    y0R = min(real(YAprox));
    y1R = max(real(YAprox));
    y0I = min(imag(YAprox));
    y1I = max(imag(YAprox));
    
    if (~isempty(fFTHandle))
        p = linspace(a, b, 1e6);
        YTrue = fFTHandle(p);
        plot(R, p, real(YTrue), '-r');
        plot(I, p, imag(YTrue), '-r');
        legend(R, 'DFT', 'True FT');
        legend(I, 'DFT', 'True FT');
        
        y0R = min(real([YTrue, y0R]));
        y1R = max(real([YTrue, y1R]));
        y0I = min(imag([YTrue, y0I]));
        y1I = max(imag([YTrue, y1I]));
        
        hold(R, 'off');
        hold(I, 'off');

    else
        legend(R, 'DFT');
        legend(I, 'DFT');
    end
    
    [y0R, y1R] = normYAx(y0R, y1R);
    [y0I, y1I] = normYAx(y0I, y1I);

    axis(R, [c, d, y0R, y1R]);
    axis(I, [c, d, y0I, y1I]);
    

    SPlotInfo.R = R;% save the metadata in the structure 
    SPlotInfo.I = I;%
    refresh(hFigure);
    set(hFigure, 'UserData', SPlotInfo);% save the metadata-structure in the figure
end






































