function tenth_part()
lambda=0.45;
frec=0.7;
A=initialize_variables('linregdata.txt');
[TrainX,TrainY,TestX,TestY]=learn_X_Y(A,frec);
Mean=mean(TrainX(:,2:end));
Std=std(TrainX(:,2:end));
TrainX(:,2:end)=(TrainX(:,2:end)-Mean)./Std;
TestX(:,2:end)=(TestX(:,2:end)-Mean)./Std;
w=mylinridgereg(TrainX,TrainY,lambda);
train_y=mylinridgeregeval(TrainX,w);
test_y=mylinridgeregeval(TestX,w);
figure(3);
subplot(1,2,1);
plot(TrainY,train_y,'r+');
lim=max(max(train_y),max(TrainY));
xlim([0,lim]);
ylim([0,lim]);
hold on;
plot(0:lim,0:lim,'g-','LineWidth',1);
subplot(1,2,2);
plot(TestY,test_y,'b+');
lim=max(max(test_y),max(TestY));
xlim([0,lim]);
ylim([0,lim]);
hold on;
plot(0:lim,0:lim,'g-','LineWidth',1);
end