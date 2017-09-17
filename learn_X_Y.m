function [X,Y]=learn_X_Y(A)
X=[ones(size(A.data,1),1) A.data];
Y=A.data(:,end);
end
