function [ y ]  = jac1(x)
y = zeros(400, 400);
h=1/401;
y(1, 1)=-2+2.*h^2*x(1);
for i=2:400
   y(i, i)=-2+2.*h^2*x(i);
   y(i,i-1)=1;
   y(i-1,i)=1;
end
end