function [ x ] = newton_cotes_closed_weights( n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
cn = zeros(1, n+1);
if n == 1
    cn(1) = 1/2; cn(2) = cn(1);
elseif n == 2
    cn(1) = 1/3; cn(2) = 4/3; cn(3) = cn(1);
elseif n == 3
    cn(1) = 3/8; cn(2) = 9/8; cn(3) = cn(2); cn(4) = cn(1);
elseif n == 4
    cn(1) = 14/45; cn(2) = 64/45; cn(3) = 24/45;
    cn(4) = cn(2); cn(5) = cn(1);
elseif n == 5
    cn(1) = 19; cn(2) = 75; cn(3) = 50;
    cn(4) = cn(3); cn(5) = cn(2); cn(6) = cn(1);
    cn=cn*5/288;
elseif n == 6
    cn(1) = 41; cn(2) = 216; cn(3) = 27; cn(4) = 272;
    cn(5) = cn(3); cn(6) = cn(2); cn(7) = cn(1);
    cn=cn*1/140;
elseif n == 7
    cn(1) = 751; cn(2) = 3577; cn(3) = 1323; cn(4) = 2989;
    cn(5) = cn(4); cn(6) = cn(3); cn(7) = cn(2); cn(5) = cn(1);
    cn=cn*7/17280;
elseif n == 8
    cn(1) = 9889; cn(2) = 5888; cn(3) = -928; cn(4) = 10496; cn(5) = -4540;
    cn(6) = cn(4); cn(7) = cn(3); cn(8) = cn(2); cn(9) = cn(1);
    cn=cn*4/14175;
elseif n == 9
    cn(1) = 2857; cn(2) = 15741; cn(3) = 1080; cn(4) = 19344; cn(5) = 5778;
    cn(6) = cn(5); cn(7) = cn(4); cn(8) = cn(3); cn(9) = cn(2); cn(10) = cn(1);
    cn=cn*9/89600;
elseif n == 10
    cn(1) = 16067; cn(2) = 106300; cn(3) = -48525; cn(4) = 272400; cn(5) = -260550; cn(6) = 427368;
    cn(7) = cn(5); cn(8) = cn(4); cn(9) = cn(3); cn(10) = cn(2); cn(11) = cn(1);
    cn=cn*5/299376;
end
x = cn;
end

