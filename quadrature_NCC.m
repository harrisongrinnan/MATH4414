function [ sum ] = quadrature_NCC(f, a, b, n, varargin )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x = newton_cotes_closed_nodes(a, b, n);
y = f(x,varargin{:});
weight = newton_cotes_closed_weights(n);
d=dot(y,weight);
sum = (b-a)/(n)*d;
end

