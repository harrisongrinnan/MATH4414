
function [x, u] = two_point_BVP(domain, N, q_fun, f_fun, alpha, beta)
a = domain(1); b = domain(2);
x = linspace(a, b, N); h = x(2) - x(1);
% form the matrix for the FD equations
q_vec = q_fun(x); d = [1; 2 + h^2*q_vec(2:end-1)'; 1];
e = -ones(N, 1);
A = spdiags([e d e], -1:1, N, N); A(1,2) = 0; A(N, N-1) = 0;
% form the vector for the FD equations:
F = [alpha; h^2*f_fun(x(2:N-1)'); beta];
% solve the FD equations:
u = A\F;
return;
