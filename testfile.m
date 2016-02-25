a = 0; b = 1; domain = [a, b]; tspan = [0, 5];
mu = 1; q_fun = @(x, y) cos(x).*sin(y);
f_fun = @(x, t, y) -3*sin(t + x.*(2-x)) + y.*(4*(x-1).^2 + cos(x).*sin(y));
alpha_fun = @(t) cos(t); beta_fun = @(t) cos(1 + t);
y0_fun = @(x) cos(2*x - x.^2);
h = 0.01; Nh = (b-a)/h - 1; x = linspace(a, b, Nh+2);
Nt = 500; u0 = y0_fun(x(2:end-1)');
tol = 10^(-7); nmax = 500;
tic
[t, u] = ode_CN_Broyden(@heat_eq_nonlinear_ode_sys, tspan, u0, Nt, ...
tol, nmax, x, mu, q_fun, f_fun, alpha_fun, beta_fun);
u = [alpha_fun(t), u, beta_fun(t)];
time_CN_B = toc