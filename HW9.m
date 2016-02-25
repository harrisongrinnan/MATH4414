clear all
clc
format long
%Problem 86
f=@(t, y) sin(y)+exp(-t/2);
tspan=[0 1]; y0= 1; Nh=1/.001; tol=10^-12;
[t1, u1] = feuler(f, tspan, y0, Nh);
t0m=[t1(1), t1(2), t1(3), t1(4)]'
y0m=[u1(1), u1(2), u1(3)]'
[t, u] = ode_BDF3_FP(f, tspan, y0m, Nh, tol, 100);
[u(1), u(2), u(3), u(4) u(751)]'
[t(1) t(2) t(3) t(4) t(751)]'
%Problem 87
clc
[t, u] = ode_AB2BDF3_PC(f, tspan, y0m, Nh);
[u(1), u(2), u(3), u(4) u(1001)]'
[t(1) t(2) t(3) t(4) t(1001)]'
%Problem 88
clear all
format long
clc
c1=1; c2=1; b1=0; b2=0; d1=1; d2=1;
tspan=[0 6]; y0=[2 2]'; Nh=12000; f=@(t, y) f88(y, c1, c2, b1, b2, d1, d2);
[t, u]= ode_rk4(f, tspan, y0, Nh);
t(12000*5/6+1)
u(12000*5/6+1,:)
t1=[t(9424) t(9425) t(9426) t(9427)]'
u1=[u(9424) u(9425) u(9426) u(9427)]'
u2=[u(9424,2) u(9425,2) u(9426,2) u(9427,2)]'
lagrange_interp(1.5*pi(),t1,u1,0)
lagrange_interp(1.5*pi(),t1,u2,0)

t1=[t(3142) t(3143)]'
u1=[u(3142) u(3143)]'
u2=[u(3142,2) u(3143,2)]'
d3142=f(0,[u(3142) u(3142,2)])
d3143=f(0,[u(3143) u(3143,2)])

x=cubicspline(t1,u1,pi()/2,0,[d3142(1) d3143(1)])
x=cubicspline(t1,u2,pi()/2,0,[d3142(2) d3143(2)])

dy=zeros(size(u));
for idx = 1:size(u,1)
    dy(idx, :)=f(0, u(idx,:));
end
dy1=dy(:,1); dy2=dy(:,2);
A = sqrt(dy1.^2 + dy2.^2);
traj_length=quadrature_trap_comp_f_vec_nonunif(A,t)

