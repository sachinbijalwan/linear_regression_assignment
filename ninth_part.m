function [all_error,all_lambda,all_fraction,all_w]=ninth_part(s)
val=0.1;
fractions=zeros(9);
all_error=0;
all_c=0;
all_lambda=0;
all_fraction=0;
all_w=zeros(11);
for i=1:size(fractions,1)
    fractions(i)=val;
    val=val+0.1;
end
Min_error=zeros(size(fractions,1));
Min_lambda=zeros(size(fractions,1));
for j=1:size(fractions,1)
lambdas=zeros(100,1);
val=0;
test_error=0;
%train_error=zeros(100,1);
filename='linregdata.txt';
fraction=fractions(j);
for i=1:length(lambdas(:,1))
lambdas(i,1)=val;        
val=val+0.2;
end
A=initialize_variables(filename);
e=1;
[train_X,train_Y,test_X,test_Y]=learn_X_Y(A,e,fraction);
min_error=0;
min_lambda=0;
for i=1:length(lambdas(:,1))
    % clear A X Y w train_y train_error test_y test_error
    % filename='train.txt';
    lambda=lambdas(i,1);
    w=mylinridgereg(train_X,train_Y,lambda);
   % train_out_y=mylinridgeregeval(train_X,w);
    %train_error(i)=meansquarederr(train_out_y,train_Y);    %print
    % training part over test part begins
    % clear A X Y;
    % filename='test.txt';
    % A=initialize_variables(filename);
    % [X,Y]=learn_X_Y(A);
    test_out_y=mylinridgeregeval(test_X,w);
    test_error=meansquarederr(test_out_y,test_Y); %print
    if(i==1 || min_error>test_error)
        min_error=test_error;
        min_lambda=lambda;
      if(min_error<all_error || all_c==0)
         all_error=min_error;
         all_lambda=lambda;
         all_fraction=fraction;
         all_w=w;
      end
    end
    % test_error(i,1)=test_error;
end
Min_error(j)=min_error;
Min_lambda(j)=min_lambda;
% figure
% subplot(1,2,1)
% plot(lambdas,test_error)
% s=['test error :fraction ',num2str(fraction)];
% title(s)
% ylim([0,20])
% subplot(1,2,2)
% plot(lambdas,train_error)
% s=['train error plot:fraction ',num2str(fraction)];
% title(s)
% ylim([0,20])
end
if(nargin==0)
figure
subplot(2,1,1)
plot(fractions,Min_error);
title('Min error graph');
subplot(2,1,2)
plot(fractions,Min_lambda);
title('Corresponding lambda graph');
end
end