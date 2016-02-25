function [t, u] = ode_BDF3_FixedPoint(odefun, tspan, y0m, Nh, varargin)
% Usage: [t, u] = ode_BDF3_FP(odefun, tspan, y0m, Nh, varargin)
%
% y0m is a 3xm array whose rows provide approximation at
% t0, t1, t2.
% prepare the parameters for BDF3 method:
a1=18/11; a2=-9/11; a3=2/11;
bm1 = 66/11; b0 = 0; b1 = 0; b2 = 0;
% prepare the nodes:
t = linspace(tspan(1),tspan(2),Nh+1); h = t(2) - t(1);
u = zeros(Nh + 1, size(y0m, 2)); u(1:3,:) = y0m;
% tol = 10^(-12); nmax = 100;
for n = 3:Nh
    vn = a1*u(n,:)'+a2*u(n-1,:)'+a3*u(n-2,:)' ...
        + h*(b0*odefun(t(n), u(n,:)', varargin{:}) + ...
        b1*odefun(t(n-1), u(n-1,:)', varargin{:}) + ...
        b2*odefun(t(n-2), u(n-2,:)', varargin{:}));
    fun_tmp = @(x) h*bm1*odefun(t(n+1), x, varargin{:}) + vn;
    x_old = u(n,:)';
    for i = 1:nmax
        x_new = fun_tmp(x_old);
        if norm(x_new - x_old) <= tol
            disp(['number of iterations used = ', int2str(i)]);
            break;
        end
    x_old = x_new;
    end
u(n+1, :) = x_new';
end
t = t'; % to make t a column vector
return;