function [ F ] = heat_eq_nonlinear_ode_sys_Burgers(...
    t, u, x, mu, q_fun, f_fun, alpha_fun, beta_fun )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
NN = length(x); N = NN - 2; h = x(2) - x(1); % assuming equispaced nodes
xx = x(2:end-1);
F = zeros(N, 1);
F(1) = mu*(alpha_fun(t) - 2*u(1) + u(2))/(h^2) - q_fun(xx(1), u(1))*(u(2)-alpha_fun(t))./(2*h) ...
    + f_fun(xx(1), t, u(1));
for i = 2:N-1
    F(i) = mu*(u(i-1) - 2*u(i) + u(i+1))/(h^2) - q_fun(xx(i), u(i))*(u(i+1)-u(i-1))./(2*h) ...
        + f_fun(xx(i), t, u(i));
end
F(N) = mu*(u(N-1) - 2*u(N) + beta_fun(t))/(h^2) - q_fun(xx(N), u(N))*(beta_fun(t)-u(N-1))./(2*h) ...
        + f_fun(xx(N), t, u(N));
return    

end

