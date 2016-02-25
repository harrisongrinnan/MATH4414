function [u, res, niter, B]=broyden_TL(Ffun, B0, u0, tol, nmax, x, q_fun, f_fun, alpha, beta, varargin)
 
B = B0; 
 
u = u0; 
F = Ffun(u, x, q_fun, f_fun, alpha, beta, varargin{:});
err = tol + 1; niter = 0;
 
while( err >= tol && niter < nmax)
    % Broyden iteration
    delta = -B\F;
    u = u + delta;
    if ~any(F)
        break
    end
    F = Ffun(u, x, q_fun, f_fun, alpha, beta, varargin{:});
    B = B + F*delta'/(delta'*delta);
    err = norm(delta);
    niter = niter + 1;
end
res = norm(Ffun(u, x, q_fun, f_fun, alpha, beta, varargin{:}));

return;