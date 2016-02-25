clear all
clc
format long e
a = 0; b = 1; domain = [a, b]; tspan = [0, 5];
mu = 1; q_fun = @(x, y) y;
f_fun = @(x, t, y) 3*cos(t + x.*(1-x))-(2*x-1)*(1-2*x+cos(t+x*(1-x)))*y;
alpha_fun = @(t) sin(t); beta_fun = @(t) sin(t);
y0_fun = @(x) sin(x - x.^2);
h = 0.01; Nh = (b-a)/h - 1; x = linspace(a, b, Nh+2);
Nt = 5000; u0 = y0_fun(x(2:end-1)');
tol = 10^(-7); nmax = 500;
tic
[t, u] = ode_CN_Broyden(@heat_eq_nonlinear_ode_sys_Burgers, tspan, u0, Nt, ...
    tol, nmax, x, mu, q_fun, f_fun, alpha_fun, beta_fun);
u = [alpha_fun(t), u, beta_fun(t)];
time_CN_B = toc

It = find(abs(t-2.51) <= 10^-5)
Ix = find(abs(x-0.75) <= 10^-5)

n_skip = 1; t_p = t(1:n_skip:end); u_p = u(1:n_skip:end, :);
surf(x, t_p, u_p); shading INTERP
xlabel('x axis'); 
ylabel('t axis');
zlabel('y axis');
title('Plot of y(x,t) on x,t = [0,1]x[0,5]')
axis([0, 1, 0, 5, -1.1, 1.1])
view(-109, 18)

yp=u(It,Ix);
yp1=u(It,Ix-1);
yp2=u(It,Ix+1);

dy=(yp1-2*yp+yp2)/(h^2) - yp*(yp2-yp1)/(2*h) + f_fun(.75,2.51,yp)

e=find(t==2.75);
figure;
plot(x,u(e,:))
title('Plot of y(x,2.75) on x=[0,1]');
xlabel('x axis');
ylabel('y axis');
axis([0, 1, 0.1, 0.5]);

for i=1:length(t)-1
    if(pi>= t(i)) && (pi <= t(i+1))
        It_d=i; break;
    end
end
tt=3/pi;
for i=1:length(t)-1
    if(tt >= x(i)) && (tt <= x(i+1))
        Ix_d=i; break;
    end
end
x_int = x(Ix_d-1:Ix_d+2);  u_int = u(It_d-1:It_d+2, Ix_d-1:Ix_d+2);
coef_x = int_ntcoef(x_int, u_int);
y1 = int_poly_eval_horner(3/pi, x_int, coef_x)
% t_int = t(It_d-1:It_d+1);  u_int = u(It_d-1:It_d+1, Ix_d);
% coef_y = int_ntcoef(t_int, u_int);
% y2 = int_poly_eval_horner(pi, t_int, coef_y)
% t_int = t(It_d-1:It_d+1);  u_int = u(It_d-1:It_d+1, Ix_d+1);
% coef_y = int_ntcoef(t_int, u_int);
% y3 = int_poly_eval_horner(pi, t_int, coef_y)
% x_int=x(Ix_d-1: Ix_d+1); u_int=[y1 y2 y3];
% coef_y = int_ntcoef(x_int, u_int);
% yF = int_poly_eval_horner(tt, x_int, coef_y)