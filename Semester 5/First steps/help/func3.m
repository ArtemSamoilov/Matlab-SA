function res = func3(t)
    res = t.^5 .* exp(-abs(t .^ 3));
end