/* sumScalar.c */
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    if (nrhs != 2) {
        mexErrMsgIdAndTxt("sumScalar:args", "Two inputs required.");
    }
    if (!mxIsDouble(prhs[0]) || !mxIsDouble(prhs[1])) {
        mexErrMsgIdAndTxt("sumScalar:types", "Inputs must be double.");
    }

    double a = mxGetScalar(prhs[0]);
    double b = mxGetScalar(prhs[1]);

    plhs[0] = mxCreateDoubleScalar(a + b);
}