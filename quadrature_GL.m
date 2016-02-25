function [ sum ] = quadrature_GL(f, n, varargin )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x = gaussian_quadr_nodes_ref(n);
y = f(x,varargin{:});
weight = gaussian_quadr_weights_ref(n);
d=dot(y,weight);
sum = d;
end

