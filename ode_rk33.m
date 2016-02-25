function [t, u] = ode_rk33(odefun, tspan, y0, Nh, varargin)
% Usage: [t, u] = ode_rk33(odefun, tspan, y0, Nh, varargin)
%
% Copyrighted by Tao Lin, 10/2014
% prepare the parameters in this rk33 method:
a21=1/2; a31 = -1; a32 = 2;
b1=1/6; b2=2/3; b3=1/6;
c2=1/2; c3=1;
% prepare the nodes:
t = linspace(tspan(1),tspan(2),Nh+1); h = t(2) - t(1);
u = zeros(Nh + 1, length(y0)); u(1,:) = (y0(:))'; w = y0(:);
for n = 1:Nh
K1 = odefun(t(n), w, varargin{:});
K2 = odefun(t(n) + c2.*h, w + h.*a21.*K1, varargin{:});
K3 = odefun(t(n) + c3.*h, w + h.*(a31.*K1+a32.*K2), varargin{:});
w = w + h*(b1*K1 + b2*K2 + b3*K3);
u(n+1,:) = w';
end
t = t'; % to make t a column vector
return;