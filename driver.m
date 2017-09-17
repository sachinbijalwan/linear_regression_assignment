lambdas=linspace(0,1,100)';
val=0;
Testerror=zeros(100,1);
Trainerror=zeros(100,1);
for i=1:length(lambdas)
    fprintf("Iter:%d\n",i);
    clear A X Y w train_y train_error test_y test_error
    filename='train.txt';
    A=initialize_variables(filename);
    lambda=lambdas(i);
    [X,Y]=learn_X_Y(A);
    w=mylinridgereg(X,Y,lambda);
    train_y=mylinridgeregeval(X,w);
    train_error=meansquarederr(train_y,Y);
    Trainerror(i)=train_error;
    train_error=(X*w-Y)'*(X*w-Y)/(length(Y)^2);
    %% training part over test part begins
    clear A X Y;
    filename='test.txt';
    A=initialize_variables(filename);
    [X,Y]=learn_X_Y(A);
    test_y=mylinridgeregeval(X,w);
    test_error=meansquarederr(test_y,Y); %print
    Testerror(i,1)=test_error;
    test_error=(X*w-Y)'*(X*w-Y)/(length(Y)^2);
    fprintf("train error: %f :: test error: %f\n",train_error,test_error);
end
plot(lambdas,Trainerror,'r-');
hold on;
plot(lambdas,Testerror,'b-');