%Problem 1
x=linspace(0,pi,50);
y1=cos(x.^2);
y2=exp(-sin(x.^2))+cos(x);
a=0; b=pi; a1 = 2.40451; a2 = 2.90258;
fun_g1=@(x) cos(x.^2); fun_g2=@(x) exp(-sin(x.^2))+cos(x);
M = 50; n_s = 3;
integrand=@(x, y) exp(-sin(x.^2/10)-y.^2);

int_val1 = abs(quadrature_comp(@quad_2D_on_y_variable, a, a1, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s));
int_val2 = abs(quadrature_comp(@quad_2D_on_y_variable, a1, a2, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s));
int_val3 = abs(quadrature_comp(@quad_2D_on_y_variable, a2, b, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s));
                            
int_val = int_val1+int_val2+int_val3;

%Problem 2
a=0; b=1;
fun_g1=@(x) 0.*x; fun_g2=@(x) (1-x.^2).^.5;
M = 50; n_s = 3;
integrand=@(x, y) (2).^.5+0.*x+0.*y;
int_val = abs(quadrature_comp(@quad_2D_on_y_variable, a, b, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s));
                            
                           

%Problem 3
a=-(.75^2); b=(.75^2);
fun_g1=@(y) 0.5+0.*y; fun_g2=@(y) (1-y.^2).^.5;
M = 50; n_s = 3;
integrand=@(x, y) sin(x.^2+2.*y);
int_val = abs(quadrature_comp(@quad_2D_on_x_variable, a, b, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s));
                            
                           
%Problem 4
t=linspace(0,2*pi);
x=t-0.5.*sin(t);
y=1-0.5.*cos(t);
% plot(x,y);
% axis([-0.1, 2*pi+0.1, 0, 2.5]);
% axis equal;
f=@(t) (1.25-cos(t)).^.5; a = 0;
result = 0;
for i=1:50
    result = result+quadrature_NCC(f, a+(i-1).*pi/25,a+i.*pi/25,2);
end
result;

%Problem 5
a=0; b=2*pi;
fx=@(t) t - 0.5.*sin(t); fy=@(t) 1 - 0.5.*cos(t); dx=@(t) 1-0.5.*cos(t);
fun_g1=@(x) 0.*x; fun_g2=@(x) fun_xy_param_x2y(x,fx,fy,dx);
fun_g2(0)
M = 30; n_s = 2;
integrand=@(x, y) 1+0.*x+0.*y;
int_val = abs(quadrature_comp(@quad_2D_on_x_variable, a, b, M, @quadrature_NCC, n_s, ...
                                integrand, fun_g2, fun_g1, M, @quadrature_NCC, n_s))
