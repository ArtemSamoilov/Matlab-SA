#include "C:\Program Files\Polyspace\R2019b\extern\include\mex.h"
#include <math.h>
#include "C:\Program Files\Polyspace\R2019b\extern\include\matrix.h"
#include <iostream>
#include <vector>

using namespace std;

void 
GetF(const vector<double> &h, const double *f, vector<double> &F) 
{
    for(size_t i = 0; i < F.size(); ++i)
    {
        F[i] = (f[i+2] - f[i+1])/h[i+1];
        F[i] -= (f[i+1] - f[i])/h[i];
        F[i] *= 6.0;
    }
}

void 
EliminationMethodSolve(const vector<double> &A1, const vector<double> &B1, const vector<double> &C1, const vector<double> &F, vector<double> &y)
{
    vector<double> alpha(F.size(), 0.0);
    vector<double> beta(F.size(), 0.0);
    
    for(size_t i = 0; i < alpha.size(); ++i)
    {
        if(i > 0)
        {
            alpha[i] = -B1[i]/(A1[i]*alpha[i-1] + C1[i]);
            beta[i] = (F[i]-A1[i]*beta[i-1])/(A1[i]*alpha[i-1] + C1[i]);
        }
        else
        {
            alpha[0] = -B1[0]/C1[0];
            beta[0] = F[0]/C1[0];
        }
    }
    
    for(size_t i = y.size(); i > 0; --i) {
        if(i < y.size())
        {
            y[i-1] = alpha[i-1] * y[i] + beta[i-1];
        }
        else
        { 
            y[i-1] = beta[i-1];
        }
    }
}


void Print(const vector<double> &v)
{
    for (size_t i = 0; i < v.size(); ++i)
    {
        cout << v[i] << " ";
    }
    cout << endl;
}


void Print(const double *v, size_t rowCnt)
{
    for (size_t i = 0; i < rowCnt; ++i)
    {
        cout << v[i] << " ";
    }
    cout << endl;
}


void createsplinee_c(const double *x, const double *f, double *A, double *B, double *C, double *D, size_t rowCnt) 
{
    vector<double> h(rowCnt-1, 0.0); 
    for (size_t i = 0; i < h.size(); ++i)
    {
        h[i] = x[i+1] - x[i];
    }
    
    vector<double> A1(rowCnt-2, 0.0); 
    vector<double> B1(rowCnt-2, 0.0); 
    vector<double> C1(rowCnt-2, 0.0); 
    for (size_t i = 0; i < A1.size(); ++i)
    {
        A1[i] = h[i];
        B1[i] = h[i + 1]; 
        C1[i] = 2.0 * (h[i] + h[i+1]); 
    }
    
    vector<double> F(rowCnt-2, 0.0); 
    GetF(h, f, F);

    vector<double> y(rowCnt-2, 0.0); 
    EliminationMethodSolve(A1, B1, C1, F, y);
    for (size_t i = 0; i < rowCnt - 1; ++i)
    {
        A[i] = f[i+1];
        
        if(i>0)
        {
            if(i < rowCnt-2)
            {
                C[i] = y[i];
            }
            else            
            {
                C[i] = 0.0;
            }
            
            D[i] = (C[i] - C[i-1])/h[i];
        }
        else
        {
            C[0] = y[0];
            D[0] = C[0]/h[0];
        }
        
        B[i] = 0.5*h[i]*C[i] - (1/6)*pow(h[i],2)*D[i] + (f[i+1]-f[i])/h[i];
    }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    if (nrhs != 2)
    {
        mexErrMsgIdAndTxt("createspline:nrhs", "Two inputs required.");
    }
    
    if(nlhs != 4)
    {
        mexErrMsgIdAndTxt("createspline:nlhs", "Four outputs required.");
    }
    mwSize A_dim_cnt = mxGetNumberOfDimensions(prhs[0]); 
    mwSize B_dim_cnt = mxGetNumberOfDimensions(prhs[1]);
    
    if (A_dim_cnt != B_dim_cnt || A_dim_cnt > 2)
    {
        mexErrMsgIdAndTxt("createspline", "Numbers of input dimensions must be equal.");
    }
    
    const mwSize *A_dim = mxGetDimensions(prhs[0]);
    const mwSize *B_dim = mxGetDimensions(prhs[1]);
    
    for (mwSize i = 0; i < A_dim_cnt; ++i)
    {
        if (A_dim[i] != B_dim[i]) {
            mexErrMsgIdAndTxt("createspline", 
                      "Input dimensions must be equal.");
        }
    }
    
    if(!mxIsDouble(prhs[0]) || mxIsComplex(prhs[0]) || mxGetNumberOfElements(prhs[0]) == 1 )
    {
        mexErrMsgIdAndTxt("createspline", 
                "Input x must be a double vector.");
    }
    
    if(!mxIsDouble(prhs[1]) || mxIsComplex(prhs[1]))
    {
        mexErrMsgIdAndTxt("createspline", 
                "Input f must be a double vector.");
    }
	
    if(mxGetN(prhs[1]) != 1)
    {
        mexErrMsgIdAndTxt("createspline", 
                "Input must be column vectors.");
    }

    double *x = mxGetDoubles(prhs[0]);
    double *f = mxGetDoubles(prhs[1]);

    size_t rowCnt = A_dim[0];
    
	plhs[0] = mxCreateDoubleMatrix(rowCnt-1, 1, mxREAL);
	plhs[1] = mxCreateDoubleMatrix(rowCnt-1, 1, mxREAL);
    plhs[2] = mxCreateDoubleMatrix(rowCnt-1, 1, mxREAL);
    plhs[3] = mxCreateDoubleMatrix(rowCnt-1, 1, mxREAL);

	mxDouble *A = mxGetDoubles(plhs[0]);
	mxDouble *B = mxGetDoubles(plhs[1]);
    mxDouble *C = mxGetDoubles(plhs[2]);
    mxDouble *D = mxGetDoubles(plhs[3]);
    
    createsplinee_c(x, f, A, B, C, D, rowCnt);
}