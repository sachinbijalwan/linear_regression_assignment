function [X,Y]=learn_X_Y(A)
X=[ones(size(A.data,1),1) A.data(:,1:end-1)];
Y=A.data(:,end);
end
