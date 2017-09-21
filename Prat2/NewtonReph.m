function [ FinalW ] = NewtonReph( CostFun, X, label, InitialW, Iterations )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
FinalW=InitialW;
for it=1:Iterations
    sig=sigmoid(X*FinalW);
    R=diag(sig.*(1-sig));
    [cost,gred]=CostFun(FinalW);
    if sum(sig-label)/length(label)<0.0000001
        break;
    end
    FinalW=pinv(X'*R*X)*X'*R*(X*FinalW-R.^-1*(sig-label));
    fprintf("Iteration %d: cost %f\n",it,cost);
end

