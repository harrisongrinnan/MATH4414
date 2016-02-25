
function [x,res,niter] = newtonsys_3(Ffun, Jfun, f_fun, q_fun, x, u0, tol, nmax, alpha, beta, varargin)
    
        niter = 0; err = tol + 1; u = u0;
    
        while err >= tol && niter < nmax
            J = Jfun( u, x,q_fun, f_fun, alpha, beta ,varargin{:});
            F = Ffun(u, x, q_fun, f_fun, alpha, beta, varargin{:});
            delta = - J\F;
            u = u + delta;
            err = norm(delta);
            niter = niter + 1;
        end
        
        
    res = norm(Ffun(u, x, q_fun, f_fun, alpha, beta, varargin{:}));
 
    if (niter==nmax && err> tol)
        fprintf([' Fails to converge within maximum ',...
         'number of iterations.\n',...
         'The iterate returned has relative ',...
         'residual %e\n'],F);
    else
        fprintf(['The method converged at iteration ',...
         '%i with  residual %e\n'],niter,F);
 
    end
end
