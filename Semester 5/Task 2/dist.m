% distribution function for 'nearest'
function dist(x)
    if(x > 0)
        dist = 1;
    elseif(x < 0)
        dist = -1;
    else
        dist = 0;
    end
end
        