clear all
clc
format long e
a = 0; b = 1; domain = [a,b]; 
N = 100+1;
x = linspace(a, b, N); 
h = x(2) - x(1);
% tol = 10^(-12); nmax = 100;
% h = 0.01;
% N = (b-a)/h + 1;
q_fun = @(x) 1;
f_fun = @(x) -exp(x-2.*x.^2) .* (x.* exp(x).*( -1 -x + 2.*x.^2) + exp(x.^2) .* (2 - 5.*x - 4.*x.^2 + 4.*x.^3));
alpha = 0; beta = 1;
% 
% q_vec = q_fun(x); d = [-2; 2 + 2*q_vec(2:end-1)'; (.5*1*h - 1)];
% e = -ones(N, 1);
% A = spdiags([e d e], -2:(.5*1*h - 1), N, N);
% A(1,2) = 0; A(N, N-1) = 0;
% 
 
% [x, u] = two_point_BVP(domain, N, q_fun, f_fun, alpha, beta);
% plot(x, u, 'Linewidth', 1.5)
% xlabel('x'); ylabel('y(x)')
 
%Jacobian:
% J = Jfun_3(u, x, f_fun, alpha, beta);
 
%Broydens
 
tol = 10^(-12); nmax = 1000;
d = [1; 2*ones(N-2, 1); 1]; 
e = -ones(N, 1);
B0 = spdiags([e d e], -1:1, N, N);
B0(1,2) = 0; 
B0(N, N-1) = 0;
c1 = (beta - alpha)/(b-a); 
c2 = alpha - c1*a;
u0 = c1*x' + c2;
J=Jfun_3(u0,x,q_fun,f_fun,alpha,beta); 

[u, res, niter] = broyden_TL(@two_point_nonlinear_F, J, u0, tol, nmax, x, q_fun, f_fun, alpha, beta);
[new_u,new_res,new_niter] = newtonsys_3(@two_point_nonlinear_F, @Jfun_3, f_fun, q_fun,...
    x, u0, tol, nmax, alpha, beta);
 plot(x,u,x,new_u)
%Broydens
 
% tol = 10^(-12); nmax = 100;
% d = [1; 2*ones(N-2, 1); 1]; 
% e = -ones(N, 1);
% B0 = spdiags([e d e], -1:1, N, N);
% B0(1,2) = 0; 
% B0(N, N-1) = 0;
% c1 = (beta - alpha)/(b-a); 
% c2 = alpha - c1*a;
% u0 = c1*x' + c2;
% 
% 
% [u, res, niter] = broyden_TL(@two_point_nonlinear_F, B0, u0, tol, nmax, x, q_fun, f_fun, alpha, beta);