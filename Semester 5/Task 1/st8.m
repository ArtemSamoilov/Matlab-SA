%% Function for subtask 8
function distance = st8(x, y, k)
    distemp = 0;
    for i = 1:k
        distemp = distemp + (x(i)-y(i))^2;
    end
    distance = distemp^(1/2);
end