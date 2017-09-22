function sixth_part()
filename='linregdata.txt';
A=initialize_variables(filename);
lambda=0.3;
e=0;
[train_X,train_Y,test_X,test_Y]=learn_X_Y(A,e);
w=mylinridgereg(train_X,train_Y,lambda);
test_out_y=mylinridgeregeval(test_X,w);
test_error=meansquarederr(test_out_y,test_Y);    
q=zeros(3);
p=zeros(3);
for i=1:3
[p(i),q(i)]=max(w);
p(i)=w(q(i));
w(q(i))=0;
end
for i=1:3
    w(q(i))=p(i);
end
fprintf('most significant values \n');
q
for i=1:3
    [p(i),q(i)]=min(abs(w));
    w(q(i))=max(w);
end
for i=1:3
   w(q(i))=0;
end
removed_y=mylinridgeregeval(test_X,w);
removed_error=meansquarederr(removed_y,test_Y);
fprintf('train error is %f and error after removing 3 least significant attributes',test_error,removed_error);
for i=1:3
    w(q(i))=p(i);
end
end