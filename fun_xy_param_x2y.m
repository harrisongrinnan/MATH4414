function f = fun_xy_param_x2y(u, fun_x_param, fun_y_param, fun_x_param_d)
t=newton(@(x) fun_x_param(x)-u,fun_x_param_d,pi,10^-15,1000);
f=fun_y_param(t);

end