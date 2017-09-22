function [ FinalW ] = GradientDecent( CostFun, InitialW, Iterations, alpha)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
FinalW=InitialW;
for it=1:Iterations
    [cost,gred]=CostFun(FinalW);
    FinalW=FinalW-alpha*gred;
    if norm(gred)<0.00001
        break;
    end
    fprintf('Iteration %d: Cost %f: norm of gerd:%f\n',it,cost,norm(gred));
end
end