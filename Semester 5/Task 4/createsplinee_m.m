% function for Subtask 2
function [A, B, C, D] = createsplinee_m(x,f)
    h = circshift(x,-1) - x;
    h(size(x,1)) = [];
    
    
    A1 = h;
    A1(size(h, 1)) = [];
    
    B1 = h;
    B1(1) = [];
   
    C1 = 2.0 * (A1 + B1);
    
    
    f1 = f;
    f1(1) = [];
    f1(1) = [];
    
    f2 = f;
    f2(size(f2, 1)) = [];
    f2(1) = [];
    
    f3 = f;
    f3(size(f3, 1)) = [];
    f3(size(f3, 1)) = [];
    
    h12 = h;
    h12(1) = [];
    
    h23 = h;
    h23(size(h23, 1)) = [];
    
    F = 6.0 * ((f1 - f2) ./ h12 - (f2 - f3) ./ h23);
    
    
    tmpT = [circshift(A1, -1), C1, circshift(B1, 1)];
    T = spdiags(tmpT, [-1, 0, 1], size(A1, 1), size(A1, 1));
    
    
    % solve T * y = F;
    y = T \ F;
    
    
    tmpA = circshift(f, -1);
    tmpA(size(tmpA, 1)) = [];
    A = tmpA;
    
    C = y;
    C(size(C, 1) + 1) = 0.0;
    
    
    D = (C - circshift(C, 1)) ./ h;
    
    tmp1B = f;
    tmp1B(1) = [];
    tmp2B = f;
    tmp2B(size(tmp2B, 1)) = [];
    
    B = (0.5 * h .* C) - ((1/6) * (h.^2) .* D) + (tmp1B - tmp2B) ./ h;
end