function [ X, mean, std ] = Normalize( X )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
mean=sum(X)/size(X,1);
std=(sum(X.^2)/size(X,1)-mean.^2).^0.5;
X=(X-mean)/std;
end

