function [t, u] = ode_rk4(odefun, tspan, y0, Nh, varargin)
% Usage: [t, u] = ode_rk4(odefun, tspan, y0, Nh, varargin)
a21=1/2; 
a31=0; a32=1/2; 
a41=0; a42=0; a43=1;
b1=1/6; b2=1/3; b3=1/3; b4=1/6;
c2=1/2; c3=1/2; c4=1;
% prepare the nodes:
t = linspace(tspan(1),tspan(2),Nh+1); h = t(2) - t(1);
u = zeros(Nh + 1, length(y0)); u(1,:) = (y0(:))'; w = y0(:);
for n = 1:Nh
K1 = odefun(t(n), w, varargin{:});
K2 = odefun(t(n) + c2.*h, w + h.*a21.*K1, varargin{:});
K3 = odefun(t(n) + c3.*h, w + h.*(a31.*K1+a32.*K2), varargin{:});
K4 = odefun(t(n) + c3.*h, w + h.*(a41.*K1+a42.*K2*a43.*K3), varargin{:});
w = w + h*(b1*K1 + b2*K2 + b3*K3+b4*K4);
u(n+1,:) = w';
end
t = t'; % to make t a column vector
return;