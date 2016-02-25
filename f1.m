function [ y ] = f1( x )
y = zeros(400, 1);
h=1/401;
y(1, 1)=-2.*x(1)+x(2)+h^2.*(x(1).^2-(sin(pi*1*h)-pi^2).*sin(pi*1*h));
for i=2:399
   y(i,1)=x(i-1)-2.*x(i)+x(i+1)+h^2.*(x(i).^2-(sin(pi*1*h)-pi^2).*sin(pi*1*h));
end
y(400,1)=x(399)-2.*x(400)+h^2.*(x(400).^2-(sin(pi*400*h)-pi^2).*sin(pi*400*h));
end
