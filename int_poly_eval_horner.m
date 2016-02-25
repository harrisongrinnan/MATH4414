function p=int_poly_eval_horner(t,xnod,coef)
% Usage: p=int_poly_eval_horner(t,xnod,coef)
%
% This m-function evaluates the Newton interpolation polynomial represented by at t.
%
% xnod --- nodes
% coef --- coefficients of the Newton polynomial
% t --- where the polynomial is evaluated
%
% Use with caution, there is absolutely no guaranty on the correctness of
% this code.
%
% copyrighted by Tao Lin
 
n=max(size(coef));
 
[row,col]=size(t);
p=coef(n)*ones(row,col);
for i=n-1:-1:1
   p = coef(i) + p.*(t-xnod(i));
end
 
return;