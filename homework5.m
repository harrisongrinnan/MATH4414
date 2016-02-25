x=[-55 -45 -35 -25 -15 -5 5 15 25 35 45 55 65];
y=[3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.62 3.52];
z=linspace(-55, 65);
z2 = lagrange_interp(z,x,y,0);
size(z2);
size(z);
plot(z,z2);
z=-50
lagrange_interp(z,x,y,0)
z=-20
lagrange_interp(z,x,y,0)
z=-10
lagrange_interp(z,x,y,0)
z=0
lagrange_interp(z,x,y,0)
z=10
lagrange_interp(z,x,y,0)
z=17
lagrange_interp(z,x,y,0)
clear('z');
[zero, res, niter] = bisection(@(z) cubicspline(x,y,z)-3.225,0,20,10^-12,10000);
x=[-55 -25 5 35 65];
y=[-3.25 -3.2 -3.02 -3.32 -3.1];
lagrange_interp(16.5, x, y, 1)