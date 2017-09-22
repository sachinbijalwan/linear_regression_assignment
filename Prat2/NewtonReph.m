function [ FinalW ] = NewtonReph( CostFun, X, InitialW, Iterations, lambda )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
FinalW=InitialW;
[m,n]=size(X);
for it=1:Iterations
    sig=sigmoid(X*FinalW);
    R=diag(sig.*(1-sig));
    [cost,gred]=CostFun(FinalW);
    if norm(gred)<0.00001
        break;
    end
%    FinalW=pinv(X'*R*X)*X'*R*(X*FinalW-R.^-1*(sig-label));
    L=lambda*eye(n,n);
    L(1,1)=0;
    FinalW=FinalW-(pinv(X'*R*X+L))*(m*gred);
    fprintf("Iteration %d: cost %f: H:%f\n",it,cost,norm(R));
end