clear all
clc
format long
%Problem 78
eps=5.6*10^-8; gamma=0.5; s=24; tc=200; c=100; m=1; n=2; t0=180; tspan=[0 200];
f=@(t, T) 2.688-1.68*10.^-9.*T.^4; %by mathematica
[t, u]=feuler(f, tspan, t0, 200*n);
[t(10*n+1) t(20*n+1) t(60*n+1) t(120*n+1) t(180*n+1) t(200*n+1)]';
[u(10*n+1) u(20*n+1) u(60*n+1) u(120*n+1) u(180*n+1) u(200*n+1)]';

n=10;
[t1, u1]=feuler(f, tspan, t0, 200*n);
[t1(10*n+1) t1(20*n+1) t1(60*n+1) t1(120*n+1) t1(180*n+1) t1(200*n+1)]'
[u1(10*n+1) u1(20*n+1) u1(60*n+1) u1(120*n+1) u1(180*n+1) u1(200*n+1)]'

plot(t1, u1)
title('A solution curve of T vs t')
xlabel('Time'); ylabel('Temperature');


bool=1;
n=1;
while bool==1
    if (u1(n)>=199.95)
        resultu=u1(n);
        resultt=t1(n);
        bool=0;
    end
    n=n+1;
end
resultu;
resultt;

f=@(t, T) 4.*(2.688-1.68*10.^-9.*T.^4);
[t1, u1]=feuler(f, tspan, t0, 200*10);
bool=1;
n=1;
while bool==1
    if (u1(n)>=199.95)
        resultu=u1(n);
        resultt=t1(n);
        bool=0;
    end
    n=n+1;
end
resultu;
resultt;

f=@(t, T) 16.*(2.688-1.68*10.^-9.*T.^4);
[t1, u1]=feuler(f, tspan, t0, 200*10);
bool=1;
n=1;
while bool==1
    if (u1(n)>=199.95)
        resultu=u1(n);
        resultt=t1(n);
        bool=0;
    end
    n=n+1;
end
resultu;
resultt;

%Problem 79
clear all
f= @(t, y) sin(t)+y; tspan= [0 1]; y0 = 0; yx=@(t) .5.*(exp(t)-sin(t)-cos(t));
k=1;
for n=100:10:200
    [t1, u1]=ode_rk33(f, tspan, y0, n);
    err(k, 1)=max(abs(u1-yx(t1))); h(k, 1)=1/n;
    k=k+1; 
end
y=log(err);
x=[ones(11, 1) log(h)];
beta=regress(y,x);
beta(2);

%Problem 81
clear all
tspan=[0 5]; y0=[1 0]; n=500;
[t, u]=ode_rk33(@fn81, tspan, y0, n);
plot(t, u)
title('Displacement and Velocity vs Time')
xlabel('t');
legend('Displacement', 'Velocity')

results=zeros(10,2);
for i=1:10
    results(i, :)=[u(i*50+1, 1), u(i*50+1, 2)];
end
results(:,1);
results(:,2);
   
%Problem 82
clear all
tspan=[0 10]; y0=[1.5 0 0 0]; n=10/.01;
[t, u]=ode_rk4(@fn82, tspan, y0, n);
plot(t,u(:,3))
title('x2(t) vs. t')
xlabel('t'); ylabel('x_2');
[u(200, 1) u(200, 2) u(200, 3) u(200, 4)]'
[u(800, 1) u(800, 2) u(800, 3) u(800, 4)]'
quiver(u(:,1),u(:,3),u(:,2),u(:,4))
title('A phase plane trajectory of a solution to Problem 82')
xlabel('x_1'); ylabel('x_2');

%Problem 83 is to be done in mathematica
clear all






