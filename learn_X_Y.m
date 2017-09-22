function [train_X,train_Y,test_X,test_Y]=learn_X_Y(A,i,fraction)
if(i~=0)
A.data=A.data(randperm(length(A.data(:,1))),:);
end

if(nargin<3)
    fraction=0.4;
end
size=length(A.data(:,1));
train_size=fraction*size;
train_size=ceil(train_size);
test_size=size-train_size;
train_Y=zeros(train_size,1);
test_Y=zeros(test_size,1);
train_X=zeros(train_size,length(A.data(1,:)));
test_X=zeros(test_size,length(A.data(1,:)));
train_X(:,1)=1;
for i=1:length(A.data(1,:))-1
   train_X(:,i+1)=A.data(1:train_size,i);
end
test_X(:,1)=1;
for i=1:length(A.data(1,:))-1
    test_X(:,i+1)=A.data(train_size+1:end,i);
end
train_Y=A.data(1:train_size,end);
test_Y=A.data(train_size+1:end,end);
end