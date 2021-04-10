#include "C:\Program Files\Polyspace\R2019b\extern\include\mex.h"
#include <math.h>
#include "C:\Program Files\Polyspace\R2019b\extern\include\matrix.h"
#include <complex.h>
#include <iostream>

void createspline_c(mxArray const * Xf, mxArray const * Ff, mxArray * Af, mxArray * Bf, mxArray * Cf, mxArray * Df, mwSize rows, mwSize ncols)
{
    mwSize i, j, curr;
    double * X = mxGetPr(Xf);
    double * F = mxGetPr(Ff);
    double * A = mxGetPr(Af);
    double * B = mxGetPr(Bf);
    double * C = mxGetPr(Cf);
    double * D = mxGetPr(Df);
    i = 0;
    j = 0;
    double H1[ncols-2];
    double H1_2[ncols-2];
    double H2[ncols-2];
    double Fi[ncols-2];
    mexPrintf("A ");
    for(i = 0; i < ncols-1; i++)
    {
        A[i] = F[i];
        mexPrintf(" %f", A[i]);
    }
    mexPrintf("\nH1 ");
    for(i = 0; i < ncols-1; i++)
    {
        H1[i] = X[i]-X[i-1];
        mexPrintf(" %f", H1[i]);
        H2[i] = X[i+1]-X[i];
        H1_2[i] = 2*(H1[i]+H2[i]);
        Fi[i] = 3*((A[i+1]-A[i])/H2[i]-(A[i]-A[i-1])/H1[i]);
    }
    
    
    double m;
	for(i = 1; i < ncols-2; i++)
	{
		m = H2[i]/H1_2[i-1];
		H1_2[i] = H1_2[i] - m*H1[i-1];
		Fi[i] = Fi[i] - m*Fi[i-1];
	}
    
    
	C[ncols-2] = Fi[ncols-1]/H1_2[ncols-1];
    C[0] = 1;
	for(i = ncols - 2; i > 0; i--)
    {
		C[i]=(Fi[i]-H1[i]*C[i+1])/H1_2[i];
        mexPrintf("\n%d   %f",i,C[i]);
    }
    //C[ncols-2] = 0;
    
    
    for(i = 0; i < ncols; i++)
    {
        B[i] = (A[i]-A[i-1])/H1[i]+H1[i]*(2*C[i]+C[i-1])/3;
        D[i] = (C[i]-C[i-1])/(3*H1[i]);
    }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{    
    size_t ncols_X = mxGetM(prhs[0]);
    size_t nrows_X = mxGetN(prhs[0]);
    size_t ncols_F = mxGetM(prhs[1]);
    size_t nrows_F = mxGetN(prhs[1]);
    
    if(ncols_X != ncols_F || nrows_X != nrows_F || nrows_X != 1)
    {
        //mexErrMsgIdAndTxt("nrows\ncols", "dimensions must be same");
    }
    
    mwSize dbg;
    if(nrhs != 2)
    {
        //mexErrMsgIdAndTxt("nrhs", "two inputs required");
    }
    if(nlhs != 4)
    {
        //mexErrMsgIdAndTxt("nlhs", "one output reqiured");
    }
    
    plhs[0] = mxCreateDoubleMatrix((mwSize)nrows_X-1, (mwSize)ncols_X, mxREAL);
    plhs[1] = mxCreateDoubleMatrix((mwSize)nrows_X-1, (mwSize)ncols_X, mxREAL);
    plhs[2] = mxCreateDoubleMatrix((mwSize)nrows_X-1, (mwSize)ncols_X, mxREAL);
    plhs[3] = mxCreateDoubleMatrix((mwSize)nrows_X-1, (mwSize)ncols_X, mxREAL);
        
    createspline_c(prhs[0], prhs[1], plhs[0], plhs[1], plhs[2], plhs[3], (mwSize)ncols_X, (mwSize)nrows_X);
}       