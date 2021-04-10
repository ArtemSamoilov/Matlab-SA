% function for Subtask 5
function ci = getFunc(i,meth)
    %i = i-1;
    switch(meth)
        case 'trig'
            if(mod(i,2) == 0)
                ci = @(x) sin(x*i/2);
            else
                ci = @(x) cos(x*(i-1)/2);
            end
        case 'wals'
            n = 20;
            wf = walshGenerator(i-1,n);
            wf(end+1) = wf(end);
            h = 1/(2^n);
            ci = @(x) wf(floor(((x/pi)+1) / (2*h))+1);
        case 'legp'
            ci = @(x) legendreP(i-1, x/pi);
    end
end