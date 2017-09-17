function error=meansquarederr(X,Y)
% error=zeros(length(X(:,1)),1);
% for i=1:length(X(:,1))
%     error(i,1)=X(i,1)-Y(i,1);
% end
error=0;
for i=1:size(Y,1)
error=error+(X(i)-Y(i))*(X(i)-Y(i));
end
error=error/(2*size(Y,1));