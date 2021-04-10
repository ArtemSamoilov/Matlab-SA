#include "mex.h"

void sbscale(double * inM1, double * inM2, double * outM1, double * outM2, double * outM3, mwSize ncols, mwSize nrows)
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
            *(outM1 + curr) = *(inM1 + curr) + *(inM2 + curr);
            *(outM + curr) = *(outM + curr) + bias;
            *(outM + curr) = *(outM + curr) * mul;
        }
    }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double mul;
    double * inM1;
    double * inM2;
    double * outM;
    double bias;
    
    size_t ncols_inM1;
    size_t nrows_inM1;
    size_t ncols_inM2;
    size_t nrows_inM2;
    
    mwSize dbg;
    if(nrhs != 4)
    {
        mexErrMsgIdAndTxt("nrhs", "two inputs required");
    }
    if(nlhs != 1)
    {
        mexErrMsgIdAndTxt("nlhs", "one output reqiured");
    }
    bias = mxGetScalar(prhs[0]);
    mul = mxGetScalar(prhs[1]);
    inM1 = mxGetPr(prhs[2]);
    inM2 = mxGetPr(prhs[3]);
    
    nrows_inM1 = mxGetM(prhs[2]);
    ncols_inM1 = mxGetN(prhs[2]);        
    nrows_inM2 = mxGetM(prhs[3]);
    ncols_inM2 = mxGetN(prhs[3]);
    
    plhs[0] = mxCreateDoubleMatrix((mwSize)nrows_inM1, (mwSize)ncols_inM1, mxREAL);
    outM = mxGetPr(plhs[0]);
        
    sbscale(mul, bias, inM1, inM2, outM, (mwSize)ncols_inM1, (mwSize)nrows_inM1);
}