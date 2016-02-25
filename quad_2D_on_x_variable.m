function F = quad_2D_on_x_variable(y, integrand, fun_c, fun_d, ...
M, quad_simple, n_s)
F = zeros(size(y));
for i = 1:length(y);
f_tmp = @(x) integrand(x, y(i));
c = fun_c(y(i)); d = fun_d(y(i));
F(i) = quadrature_comp(f_tmp, c, d, M, quad_simple, n_s);
end
return;