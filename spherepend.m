function [ v ] = spherepend(t, u )
%u1, u2, u3 are x1, x2, x3.
%u4, u5, u6 are x1', x2', x3'.
%assignment of variables.
mass=1;%NEED SOMETHING HERE
g=9.8;
F=[0;0;-mass*g];
H=2*eye(3);
v=zeros(6,1);
%Here we calculate the helper constants
xp=zeros(3,1);
xp(1:3)=u(4:6);
G=[2*u(1); 2*u(2); 2*u(3)];
% test1=mass*xp;
% 
% test2=test1*H;
% test3=test2*xp';
% test4=F'*G;
% test5=test3+test4;
% test6=G'*G;
% test7=test5/test6;
lambda=(mass*xp'*H*xp+F'*G)/(G'*G);

%v1, v2, v3 are u1', u2', u3'
v(1) = u(4);
v(2) = u(5);
v(3) = u(6);
%v4, v5, and v6 are more complicated.
for k=1:3
    v(k+3)=(F(k)-lambda*G(k))/mass;
end
end

