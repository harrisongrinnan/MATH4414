function [t, u] = ode_AB2BDF3_PC(odefun, tspan, y0m, Nh, varargin)
% prepare the parameters for the methods:
bb0 =3/2; bb1 =-1/2;
bm1 = 6/11; a1=18/11; a2=-9/11; a3=2/11;
% prepare the nodes:
t = linspace(tspan(1),tspan(2),Nh+1); h = t(2) - t(1);
u = zeros(Nh + 1, size(y0m, 2)); u(1:3,:) = y0m;
% tol = 10^(-12); nmax = 100;
for n = 3:Nh
    fun_n = odefun(t(n), u(n,:)', varargin{:});
    fun_nm1 = odefun(t(n-1), u(n-1,:)', varargin{:});
    vn = a1*u(n,:)'+a2*u(n-1,:)'+a3*u(n-2,:)';
    fun_tmp = @(x) h*bm1*odefun(t(n+1), x, varargin{:}) + vn;
    % predictor
    x_old = u(n,:)'+ h*(bb0*fun_n + bb1*fun_nm1);
    % corrector
    x_new = fun_tmp(x_old);
    u(n+1, :) = x_new';
end
t = t'; % to make t a column vector
return;