function [x, res, niter, B]=broyden1(Ffun, B0, x0, tol,nmax, varargin)
niter = 0; err = tol + 1; x = x0; B=B0;
F = Ffun(x,varargin{:});
while err >= tol && niter < nmax
%B = B0(x,varargin{:});
delta = - B\F;
x = x + delta;
F=Ffun(x,varargin{:});
B=B+(F*delta')/(delta'*delta);
err = norm(delta);
niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax && err> tol)
fprintf([' Fails to converge within maximum ',...
'number of iterations.\n',...
'The iterate returned has relative ',...
'residual %e\n'],res);
else
fprintf(['The method converged at iteration ',...
'%i with residual %e\n'],niter, res);
end
return
