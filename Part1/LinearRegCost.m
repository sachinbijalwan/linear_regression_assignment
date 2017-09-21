function [ cost, gred ] = LinearRegCost( X, Y, W, lambda)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
temp=X*W-Y;
cost=(temp'*temp)/(2*length(Y))+lambda*(W'*W)/2;
gred=(X'*temp)/length(Y)+lambda*W;
end

