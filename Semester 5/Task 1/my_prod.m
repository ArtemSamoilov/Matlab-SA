%% Function for subtask 9
function scal = myprod(x, y)
    scal = 0;
    sz = size(x);
    for i = 1:sz(1,1)
       scal = scal + x(i)*y(i); 
    end
    
end