function [J] = jacob(Ffun,x,h)
%NEWTONSYS Finds a zero of a nonlinear system
% [ZERO,RES,NITER]=NEWTONSYS(FFUN,JFUN,X0,TOL,NMAX)
% tries to find the vector ZERO, zero of a nonlinear
% system defined in FFUN with jacobian matrix defined
% in the function JFUN, nearest to the vector X0.
% The variable RES returns the residual in ZERO
% while NITER returns the number of iterations needed
% to compute ZERO. FFUN and JFUN are function handles
% associated with anonymous functions or MATLAB
% functions stored in M-files.
f=Ffun(x);
l=length(f);
ey=eye(l);
J=zeros(l,l);
    for i=1:l
       x=ones(l);
       x(i)=1+h;
       J(:,i)=((Ffun(x)-f)/h);
    end
    
end