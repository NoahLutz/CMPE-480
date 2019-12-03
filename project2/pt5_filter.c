#include "mex.h"
#include <string.h>
#include <stdio.h>

int order = 12;
const double const h[] = {0.0655376386378785,-4.39091175513021E-06,0.0547561376486520
        ,-6.83900539627738E-06,-0.314961082252928,-8.03973302420999E-06
        ,0.464109135912490,-8.03973302420999E-06,-0.314961082252928
        ,-6.83900539627738E-06,0.0547561376486520,-4.39091175513021E-06
        ,0.0655376386378785 };

void filter(double *input, double *output, mwSize inputLen)
{
    mwSize n = 0;
    for(n = 0; n<inputLen; n++) {
        mwSize k = 0;
        for(k = 0; k<=order; k++) {
            double inVal = 0.0;
            int idx = n-k;
            if (idx >= 0) {
                inVal = input[idx];
            }
            output[n] += h[k] * inVal;
        }
    }
}

/* The gateway function */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[])
{
    double *inMatrix;               /* 1xN input matrix */
    size_t ncols = 0;                   /* size of matrix */
    double *outMatrix;              /* output matrix */

    /* check for proper number of arguments */
    if(nrhs!=1) {
        mexErrMsgIdAndTxt("MyToolbox:pt5_filter:nrhs","One input required.");
    }
    if(nlhs!=1) {
        mexErrMsgIdAndTxt("MyToolbox:pt5_filter:nlhs","One output required.");
    }
    
    /* make sure the first input argument is type double */
    if( !mxIsDouble(prhs[0]) || 
         mxIsComplex(prhs[0])) {
        mexErrMsgIdAndTxt("MyToolbox:pt5_filter:notDouble","Input matrix must be type double.");
    }
    
    /* check that number of rows in second input argument is 1 */
    if(mxGetM(prhs[0])!=1) {
        mexErrMsgIdAndTxt("MyToolbox:pt5_filter:notRowVector","Input must be a row vector.");
    }
    

    /* create a pointer to the real data in the input matrix  */
    #if MX_HAS_INTERLEAVED_COMPLEX
    inMatrix = mxGetDoubles(prhs[0]);
    #else
    inMatrix = mxGetPr(prhs[0]);
    #endif

    /* get dimensions of the input matrix */
    ncols = mxGetN(prhs[0]);
    
    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix(1,(mwSize)ncols,mxREAL);

    /* get a pointer to the real data in the output matrix */
    #if MX_HAS_INTERLEAVED_COMPLEX
    outMatrix = mxGetDoubles(plhs[0]);
    #else
    outMatrix = mxGetPr(plhs[0]);
    #endif
    
    memset(outMatrix,0,ncols*sizeof(double));

    /* call the computational routine */
    filter(inMatrix,outMatrix,(mwSize)ncols);
}
