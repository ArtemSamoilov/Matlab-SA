function polval = polyfunc(linsp, times, poldeg)
{
    polval = zeros(4, poldeg + 1);
    polval(1,:) = polyfit(linsp, times(1,:), poldeg);
    polval(2,:) = polyfit(linsp, times(2,:), poldeg);
    polval(3,:) = polyfit(linsp, times(3,:), poldeg);
    polval(4,:) = polyfit(linsp, times(4,:), poldeg);

    for i = 1:4
        hold on;
        plot(linsp, times(i, :));
        plot(linsp, polyval(polval(i,:), linsp));
    end
    legend({'interp1', 'spline', '.cpp', '.m'}, 'Location', 'northwest');
    xlabel('number of points');
    ylabel('execution time');
    hold off
}