#include "mex.h"

void sbscalec(double mul, double bias, double * inM1, double * inM2, double outM, mwSize ncols, mwSize nrows)
{
    mwSize i, j, curr;
    i = 0;
    j = 0;
    curr = 0;
    for(j = 0; j < nrows; j++)
    {
        for(i = 0; i < ncols; i++)
        {
            curr = j*nrows+i;
            *(outM+curr) = *(inM1+curr)+ *(inM2+curr);
            *(outM+curr) = *(OutM+curr) + bias;
            *(outM+curr) = *(OutM+curr) * mul;
        }
    }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])
{
    double mul;
    double * inM1;
    double * inM2;
    double * outM;
    double bias;
    