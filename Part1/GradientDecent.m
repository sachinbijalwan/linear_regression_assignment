function [ FinalW ] = GradientDecent( CostFun, InitialW, Iterations, alpha )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
FinalW=InitialW;
for it=1:Iterations
    [cost,gred]=CostFun(FinalW);
    FinalW=FinalW-alpha*gred;
%    fprintf('Iteration %d: Cost %f\n',it,cost);
end
end