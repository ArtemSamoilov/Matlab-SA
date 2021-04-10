% compares interpolation methods
function compareInterp(x, xx, f)
    y = f(x);
    yy = f(xx);
    
    yy1 = interp1(x, y, xx, 'nearest');
    % ������ - ���������� �������
    % ����� - ������� 2 ���� ��� ����������� �������
    yy2 = interp1(x, y, xx, 'linear');
    % ������ - ���������������� �������
    % ����� - ������� � ������� ������ ����� ������� 1 ��� 2 ����
    yy3 = interp1(x, y, xx, 'spline');
    % ������ - ���������������� � ������������� �������
    % ����� - ������� � ������ ������� 1 ��� 2 ����
    yy4 = interp1(x, y, xx, 'pchip');
    % ������ - ���������������� � ������������� �������
    % ����� - ������� � ������ ������� 1 ��� 2 ����
    
    plot(xx, yy, xx, yy1, xx, yy2, xx, yy3, xx, yy4);
    title('Interpolations');
    legend({'function','nearest','linear', 'spline', 'pchip'},'Location','northwest')
    xlabel('x');
    ylabel('y');
end