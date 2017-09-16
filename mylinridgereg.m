function w = mylinridgereg(X,Y,lambda)
w=zeros(length(X(:,1)),1);
identity=lambda*eye(length(X(1,:)));
Z=transpose(X)*X+identity;
w=inv(Z)*transpose(X)*Y;

