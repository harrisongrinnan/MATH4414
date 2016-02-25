function [t, u] = ode_CN_Broyden(odefun, tspan, y0, Nh, tol, nmax, ...
    x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin)
bm1 = 1/2; b0 = 1/2;
t = linspace(tspan(1),tspan(2),Nh+1); tau = t(2) - t(1);
u = zeros(Nh + 1, length(y0)); u(1,:) = y0;
B0 = eye(length(y0), length(y0));
for n = 1:Nh
    %fprintf('its working')
    vn = u(n,:)' + tau*b0*odefun(t(n), u(n,:)', x, mu, q_fun, f_fun, alpha_fun, beta_fun ,varargin{:});
    G = @(z, x, mu, q_fun, f_fun, alpha_fun, beta_fun)...
        z - tau*bm1*odefun(t(n+1), z, x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin{:}) - vn;
    z0 = u(n,:)' + tau*odefun(t(n), u(n,:)', x, mu, q_fun, f_fun, alpha_fun, beta_fun, varargin{:}); % better initial guess?
    [z, res, niter, B0] = broyden_TL(G, B0, z0, tol, nmax, x, mu, q_fun, f_fun, alpha_fun, beta_fun);
    u(n+1, :) = z';
end
t = t'; % to make t a column vector
return;