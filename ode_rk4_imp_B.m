function [t, u] = ode_rk4_imp_B(odefun, tspan, y0, Nh, tol, nmax, varargin)
a11 = 1/4; a12 = (3 - 2*sqrt(3))/12;
a21 = (3 + 2*sqrt(3))/12; a22 = 1/4;
b1 = 1/2; b2 = 1/2;
c1 = (3 - sqrt(3))/6; c2 = (3 + sqrt(3))/6;
N = length(y0);
m = 2*N;
t = linspace(tspan(1), tspan(2), Nh + 1)'; h = t(2) - t(1);
u = zeros(length(t), N);
u(1,:) = y0(:)';
k1 = 1:N; k2 = N+1:m;
B0 = speye(m, m);
k = [y0(:); y0(:)];
for idx = 1:length(t)-1
    un = u(idx,:)'; tn = t(idx);
    G = @(K) [K(k1) - odefun(tn+c1*h,un+h*(a11*K(k1)+a12*K(k2)))';
    K(k2) - odefun(tn+c2*h,un+h*(a21*K(k1)+a22*K(k2)))'];
    [k, ~, ~, B0] = broyden1(G, B0, k, tol, nmax);
    u(idx+1,:) = un' + h*(b1*k(k1) + b2*k(k2))';
end

