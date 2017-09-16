lambdas=zeros(200,1);
val=0;
error=zeros(200,1);
for i=1:length(lambdas(:,1))
lambdas(i,1)=val;        
val=val+0.01;
end
for i=1:length(lambdas(:,1))
    clear A X Y w train_y train_error test_y test_error
    filename='train.txt';
    A=initialize_variables(filename);
    lambda=lambdas(i,1);
    [X,Y]=learn_X_Y(A);
    w=mylinridgereg(X,Y,lambda);
    train_y=mylinridgeregeval(X,w);
    train_error=meansquarederr(train_y,Y);    %print
    %% training part over test part begins
    clear A X Y;
    filename='test.txt';
    A=initialize_variables(filename);
    [X,Y]=learn_X_Y(A);
    test_y=mylinridgeregeval(X,w);
    test_error=meansquarederr(test_y,Y); %print
    error(i,1)=test_error;
end
plot(lambdas,error);