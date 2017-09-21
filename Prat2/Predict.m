function [ pre ] = Predict( data, W )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

pre=data*W;
pre=(pre>=0);

end