function coef=int_ntcoef(x,y)
% Usage: coef=int_ntcoef(x,y)
%
% This m-file compute the coefficients of the Newton polynomial for
% the data represented by x and y
%
% x --- x interpolation nodes (row vector)
% y --- interpolation values (row vector)
% coef --- coefficients of the Newton interpolation polynomial.
 
n=max(size(x));
coef=zeros(n,1);
coef=y;
for j=1:n-1
   for i=n:-1:j+1
      coef(i)=(coef(i)-coef(i-1))/(x(i)-x(i-j));
   end
end
