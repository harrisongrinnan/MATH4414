function [ y ] = f88( x, c1, c2, b1, b2, d1, d2 )
y(1,1)=c1*x(1).*(1-b1*x(1)-d2*x(2));
y(2,1)=-c2*x(2).*(1-b2*x(2)-d1*x(1)); 
end
