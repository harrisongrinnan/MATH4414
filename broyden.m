function [u,res,niter,err, B] = broyden(Ffun,B0,x0,tol,...
                                nmax, x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin)
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
niter = 0; err = tol + 1; u = x0;F = Ffun(u, x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin{:});B=B0;
while err >= tol && niter < nmax
    delta = - B\(F);
    u = u + delta;
    F = Ffun(u, x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin{:});
    d=(F*delta')/(delta'*delta);
    B=B+d;
    err = norm(delta);
    niter = niter + 1;
end
res = norm(Ffun(u, x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin{:}));
if (niter==nmax && err> tol)
 fprintf([' Fails to converge within maximum ',...
         'number of iterations.\n',...
         'The iterate returned has relative ',...
         'residual %e\n'],F);
else
 fprintf(['The method converged at iteration ',...
         '%i\n'],niter);
end
return
