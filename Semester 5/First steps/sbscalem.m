function Y = sbscalem(bias,scale,A,B)
    Y = (A+B+bias)*scale;
end