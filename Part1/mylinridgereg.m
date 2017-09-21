function FinalW = mylinridgereg(X,Y,lambda)
identity=lambda*eye(size(X,2));
Z=X'*X+identity;
FinalW=pinv(Z)*X'*Y;


% InitialW=rand(size(X,2),1)*0.2-0.1;
% Iterations=1000;
% alpha=.015;
% CostFun = @(w) LinearRegCost(X, Y, w, lambda);
% FinalW=GradientDecent(CostFun,InitialW,Iterations,alpha);
end
