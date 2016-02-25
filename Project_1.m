%Problem 1
[zero, res, niter] = bisection(@(x) x.^3 -(1.35-exp(-8.*x)).*x.^2+0.5.*x...
   -0.0375,0.6,0.8,10^-12,1000);

%Problem 2
[zero, res, niter] = newton(@(x) sin(0.1+(4.5-exp(-5.*x)).*x^2-x.^3),...
    @(x) (2.*(4.5-exp(-5.*x)).*x-3.*x.^2+5.*exp(-5.*x).*x.^2).*cos(0.1+(4.5-exp(-5.*x)).*x.^2-x.^3),...
    0.9,10^-12,2);
[zero, res, niter] = newton(@(x) sin(0.1+(4.5-exp(-5.*x)).*x^2-x.^3),...
    @(x) (2.*(4.5-exp(-5.*x)).*x-3.*x.^2+5.*exp(-5.*x).*x.^2).*cos(0.1+(4.5-exp(-5.*x)).*x.^2-x.^3),...
    0.9,10^-12,1000);

%Problem 3
x0=[0.1; 0.1; 0.1; 1.3*10^5];
x0;
jac(x0);
f(x0);
[x, res, niter] = newtonsys(@(x) f(x),@(x) jac(x),x0,10^-10,...
                                 1000);

%Problem 4
x=[-55 -45 -35 -25 -15 -5 5 15 25 35 45 55 65];
x2=[-55 -25 5 35 65];
y=[6.1 5.95 5.62 5.35 5.07 4.97 4.95 5.02 5.3 5.7 5.92 6.02 6.05];
y2=[6.1 5.35 4.95 5.7 6.05];
lagrange_interp(17,x,y,0);
lagrange_interp(17,x2,y2,0);
lagrange_interp(60,x,y,0);
lagrange_interp(60,x2,y2,0);
cubicspline(x,y,17);
cubicspline(x2,y2,17);
cubicspline(x,y,60);
cubicspline(x2,y2,60);
z=linspace(-55, 65);
zLP=lagrange_interp(z,x2,y2,0);
zLF=lagrange_interp(z,x,y,0);
zCP=cubicspline(x2,y2,z);
zCF=cubicspline(x,y,z);

%Problem 5
[x5, res5, niter5] = newtonsys(@(x) f1(x), @(x) jac1(x), ones(400, 1), 10^-12, 10000);
[x5(172) res5 niter5]

B=jac1(ones(400, 1));
[x5, res5, niter5] = broyden(@(x) f1(x), B, ones(400, 1), 10^-12, 10000);
[x5(172) res5 niter5]

%Problem 6
x1 = [0 1 4]; y1 = [0 2 4];
t1 = [0 1 2]; ti1 = [0:0.01:2];
x2 = [0 3 4]; y2 = [0 1 4];
t2 = [0 2 3]; ti2 = [0:0.01:3];
xL1=lagrange_interp(ti1,t1,x1,0);
yL1=lagrange_interp(ti1,t1,y1,0);
xL2=lagrange_interp(ti2,t2,x2,0);
yL2=lagrange_interp(ti2,t2,y2,0);
[lagrange_interp(1.5, t1, x1, 0) lagrange_interp(1.5, t1, y1, 0)];
[lagrange_interp(0.5, t2, x2, 0) lagrange_interp(0.5, t2, y2, 0)];

plot(xL1, yL1, xL2, yL2)
axis([-0.25, 4.25, -0.5, 4.25]);
grid on;
[zero, res, niter] = bisection(@(z) lagrange_interp(z,t1,x1,0)-2.75,1,2,10^-12,10000);
[lagrange_interp(zero, t1, x1, 0) lagrange_interp(zero, t1, y1, 0)]

[zero, res, niter] = bisection(@(z) lagrange_interp(z,t2,x2,0)-2.75,0,2,10^-12,10000);
[lagrange_interp(zero, t2, x2, 0) lagrange_interp(zero, t2, y2, 0)]


