% function for Subtask 5
function y = walshGenerator(n,k)
    N = 2 ^ k;
    
    if n == 0
        y = ones(1,N);
    else
        j = 1:N;
        m = 1 + floor(log2(n));
        R = (-1).^floor(2^m.*((j-1)/N));
        y = R.*walshGenerator(2^m-1-n,k);
    end
end