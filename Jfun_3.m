function J = Jfun_3( u, x, q_fun, f_fun, alpha, beta )
N = length(u); 
J = zeros(size(u));
h = x(2) - x(1);
J(1,1) = 1;
J(N,N) = 1;
    for i = 2:N-1
        J(i, i-1) = -1 - 0.5*u(i)*h;
        J(i, i) = 2 + 0.5*h*u(i-1)-0.5.*h.^2*u(i-1);
        J(i, i+1) = -1 + 0.5*u(i)*h;
    end
end