function [ Cost, Gred ] = LogisticReg( W, data, label, lambda)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
m=size(data,1);
sig=sigmoid(data*W);
Cost=(-(label'*log(sig)+(1-label)'*log(1-sig))+lambda*(W'*W))/(2*m);
Gred=(data'*(sig-label)+lambda*W)/m;
end

