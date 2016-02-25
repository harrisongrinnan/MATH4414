function [ y ] = d43c( f, x, h )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=(-f(x-2*h)-12*f(x)+16*f(x+h)-3*f(x+2*h))/(12*h);
end

