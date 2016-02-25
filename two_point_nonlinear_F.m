
function F = two_point_nonlinear_F(u, x, q_fun, f_fun, alpha, beta)
N = length(u); 
F = zeros(size(u));
h = x(2) - x(1);
F(1) = u(1) - alpha;
F(N) = u(N) - beta;
    for i = 2:N-1
        F(i) = -u(i-1) + 2*(u(i)) - u(i+1) + h*0.5*(u(i)) * (u(i+1) - u(i-1)) - h^2*f_fun(x(i));
    end
return;