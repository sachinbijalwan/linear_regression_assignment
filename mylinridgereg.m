function w = mylinridgereg(X,Y,lambda)
% w=zeros(length(X(:,1)),1);
% identity=lambda*eye(length(X(1,:)));
% Z=transpose(X)*X+identity;
% w=inv(Z)*transpose(X)*Y;
w=rand(size(X,2),1)*.2-.1;%zeros(length(X(1,:)),1);
maxIterations=1000;
alpha=0.003;
m=size(X,1);
diffi=zeros(maxIterations,1);
first=zeros(maxIterations,1);
for j=1:maxIterations
    sum=0;
    y=mylinridgeregeval(X,w);
    sum=X'*(y-Y);
%   sum=sum*alpha;
   % length(sum(1,:))
   %length(sum(:,1))
   %length(w(:,1))
   %sum=sum/(2*length(X(1,:)));
   
   for i=1:length(w)
      % fprintf('value of w(i) %i\n',w(i));
       w(i)=w(i)-alpha*(sum(i)+2*lambda*w(i))/m;
      %fprintf('value of w(i) and sum(i) are %i %i\n',w(i),sum(i));
   end
   
   diff=meansquarederr(y,Y);
  % diffi(j)=diff;
  % first(j)=j;
  % disp(norm(sum));
end
% plot(first,diffi);
end
