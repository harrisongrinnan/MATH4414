function [x,res,niter,err,Jac] = newtonsys_modified(Ffun,x0,x1,tol,...
                                nmax, varargin)
%NEWTONSYS Finds a zero of a nonlinear system
% [ZERO,RES,NITER]=NEWTONSYS(FFUN,JFUN,X0,TOL,NMAX)
% tries to find the vector ZERO, zero of a nonlinear
% system defined in FFUN with jacobian matrix defined
% in the function JFUN, nearest to the vector X0.
% The variable RES returns the residual in ZERO
% while NITER returns the number of iterations needed
% to compute ZERO. FFUN and JFUN are function handles
% associated with anonymous functions or MATLAB
% functions stored in M-files.
niter = 0; err = tol + 1; x = x1; xb = x0;
while err >= tol && niter < nmax
    h=x-xb;
    F = Ffun(x,varargin{:})
    fx=Ffun([(x(1)+h(1)) x(2)],varargin{:});
    fy=Ffun([x(1) (x(2)+h(2))],varargin{:});
    
    Jac = [fx(1)/h(1), fy(1)/h(2);
        fx(2)/h(1), fy(2)/h(2)]
    delta = - Jac\(F')
    xb = x
    x = x + delta';
    err = norm(delta);
    niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax && err> tol)
 fprintf([' Fails to converge within maximum ',...
         'number of iterations.\n',...
         'The iterate returned has relative ',...
         'residual %e\n'],F);
else
 fprintf(['The method converged at iteration ',...
         '%i with  residual %e\n'],niter,F);
end
return
