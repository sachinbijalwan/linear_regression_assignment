function FinalW = mylinridgereg(X,Y,lambda)
% identity=lambda*eye(length(X(1,:)));
% Z=transpose(X)*X+identity;
% FinalW=inv(Z)*transpose(X)*Y;


InitialW=rand(size(X,2),1)*0.2-0.1;
Iterations=1000;
alpha=.015;
CostFun = @(w) LinearRegCost(X, Y, w, lambda);
FinalW=GradientDecent(CostFun,InitialW,Iterations,alpha);
end
