function [X,Y]=learn_X_Y(A)
X=zeros(length(A.data(:,1)),length(A.data(1,:)));
X(:,1)=1;
for i=1:length(A.data(1,:))-1
   X(:,i+1)=A.data(:,i);
end
Y=zeros(length(A.data(:,1)),1);
Y=A.data(:,length(A.data(1,:)));
