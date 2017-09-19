lambdas=linspace(0,1,100)';
val=0;
Testerror=zeros(100,1);
Trainerror=zeros(100,1);
for i=1:length(lambdas)
    fprintf("Iter:%d\n",i);
    clear A X Y w train_y train_error test_y test_error
    randomlineselector('linregdata.txt',0.2);
    filename='train.txt';
    A=initialize_variables(filename);
    lambda=lambdas(i);
    [X,Y]=learn_X_Y(A);
    w=mylinridgereg(X,Y,lambda);
    train_y=mylinridgeregeval(X,w);
    train_error=meansquarederr(train_y,Y);
    Trainerror(i)=train_error;
    %% training part over test part begins
    clear A X Y;
    filename='test.txt';
    A=initialize_variables(filename);
    [X,Y]=learn_X_Y(A);
    test_y=mylinridgeregeval(X,w);
    test_error=meansquarederr(test_y,Y); %print
    Testerror(i,1)=test_error;
    fprintf("train error: %f :: test error: %f\n",train_error,test_error);
end
subplot(1,2,1);
plot(lambdas,Trainerror,'r-');%-min(Trainerror))/(max(Trainerror)-min(Trainerror)),'r-');
title('training error');
xlabel('lambda');
ylabel('error');
subplot(1,2,2);
plot(lambdas,Testerror,'b-');%-min(Testerror))/(max(Testerror)-min(Testerror)),'b-');
title('testing error');
xlabel('lambda');
ylabel('error');
%disp([max(Trainerror) min(Trainerror);max(Testerror) min(Testerror)]);


%% part 6: most and least significant attributes
filename='train.txt';
A=initialize_variables(filename);
lambda=0;
id=0;
[X,Y]=learn_X_Y(A,id);
w=mylinridgereg(X,Y,lambda);
[M,Mi]=max(abs(w));
fprintf("The most significant attribute index: %d with the weight value: %f\n",Mi,w(Mi));
train_y=mylinridgeregeval(X,w);
train_error=meansquarederr(train_y,Y);
Trainerror(i)=train_error;
% training part over test part begins
clear A X Y;
filename='test.txt';
A=initialize_variables(filename);
[X,Y]=learn_X_Y(A,id);
test_y=mylinridgeregeval(X,w);
test_error=meansquarederr(test_y,Y); %print
Testerror(i,1)=test_error;
fprintf("Before: train error: %f :: test error: %f\n",train_error,test_error);

disp(w');
Ids=1:length(w);
for i=1:2
    [M,Mi]=min(abs(w));
    Ids(Mi)=[];
    w(Mi)=[];
end
disp(w');
filename='train.txt';
A=initialize_variables(filename);
[X,Y]=learn_X_Y(A,id);
X=X(:,Ids);
w=mylinridgereg(X,Y,lambda);
train_y=mylinridgeregeval(X,w);
train_error=meansquarederr(train_y,Y); %print
filename='test.txt';
A=initialize_variables(filename);
[X,Y]=learn_X_Y(A,id);
X=X(:,Ids);
test_y=mylinridgeregeval(X,w);
test_error=meansquarederr(test_y,Y); %print
fprintf("After: train error: %f :: test error: %f\n",train_error,test_error);

%% part 7: partition

for i=0.2:0.2:1
    figure(['partition' i*10+'0' '0']);
    for j=1:100
        randomlineselector('linregdata.txt','train.txt','test.txt');
end
