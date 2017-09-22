function seventh_part()
lambdas=zeros(200,1);
val=0;
error=zeros(200,1);
filename='linregdata.txt';
for i=1:length(lambdas(:,1))
lambdas(i,1)=val;        
val=val+1;
end
for i=1:length(lambdas(:,1))
    clear A X Y w train_y train_error test_y test_error
    % filename='train.txt';
    A=initialize_variables(filename);
    lambda=lambdas(i,1);
    e=0;
    [train_X,train_Y,test_X,test_Y]=learn_X_Y(A,e);
    w=mylinridgereg(train_X,train_Y,lambda);
    % train_out_y=mylinridgeregeval(train_X,w);
    % train_error=meansquarederr(train_out_y,train_Y);    %print
    % training part over test part begins
    % clear A X Y;
    % filename='test.txt';
    % A=initialize_variables(filename);
    % [X,Y]=learn_X_Y(A);
    test_out_y=mylinridgeregeval(test_X,w);
    test_error=meansquarederr(test_out_y,test_Y); %print
    error(i,1)=test_error;
end
plot(lambdas,error);
end