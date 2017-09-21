lambdas=linspace(0,1,100)';
val=0;
Testerror=zeros(100,1);
Trainerror=zeros(100,1);
A=initialize_variables('linregdata.txt');
[TrainX,TrainY,TestX,TestY]=randomlineselector(A,0.2);
Mean=mean(TrainX(:,2:end));
Std=std(TrainX(:,2:end));
TrainX(:,2:end)=(TrainX(:,2:end)-Mean)./Std;
TestX(:,2:end)=(TestX(:,2:end)-Mean)./Std;
for i=1:length(lambdas)
    fprintf("Iter:%d\n",i);
    lambda=lambdas(i);
    w=mylinridgereg(TrainX,TrainY,lambda);
    train_y=mylinridgeregeval(TrainX,w);
    train_error=meansquarederr(train_y,TrainY);
    Trainerror(i)=train_error;
    % training part over test part begins
    test_y=mylinridgeregeval(TestX,w);
    test_error=meansquarederr(test_y,TestY); %print
    Testerror(i)=test_error;
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
A=initialize_variables('linregdata.txt');
[TrainX,TrainY,TestX,TestY]=randomlineselector(A,0.2);
Mean=mean(TrainX(:,2:end));
Std=std(TrainX(:,2:end));
TrainX(:,2:end)=(TrainX(:,2:end)-Mean)./Std;
TestX(:,2:end)=(TestX(:,2:end)-Mean)./Std;
lambda=0;
id=0;
w=mylinridgereg(TrainX,TrainY,lambda);
[M,Mi]=max(abs(w));
fprintf("The most significant attribute index: %d with the weight value: %f\n",Mi,w(Mi));
train_y=mylinridgeregeval(TrainX,w);
train_error=meansquarederr(train_y,TrainY);
% training part over test part begins
test_y=mylinridgeregeval(TestX,w);
test_error=meansquarederr(test_y,TestY); %print
fprintf("Before: train error: %f :: test error: %f\n",train_error,test_error);

%disp(w');
Ids=1:length(w);
for i=1:2
    [M,Mi]=min(abs(w));
    Ids(Mi)=[];
    w(Mi)=[];
end
%disp(w');
TrainX=TrainX(:,Ids);
w=mylinridgereg(TrainX,TrainY,lambda);
train_y=mylinridgeregeval(TrainX,w);
train_error=meansquarederr(train_y,TrainY); %print
TestX=TestX(:,Ids);
test_y=mylinridgeregeval(TestX,w);
test_error=meansquarederr(test_y,TestY); %print
fprintf("After: train error: %f :: test error: %f\n",train_error,test_error);

%% part 7: partition and part:8 plot
iter=100;
A=initialize_variables('linregdata.txt');
lambdas=linspace(0,1,10)';
frec=0.1:0.1:0.9;%[0.1 0.3 0.5 0.7 0.9];
Testerror=zeros(length(frec),length(lambdas));
Trainerror=zeros(length(frec),length(lambdas));
figure(1);
for Fr=1:length(frec)
    fprintf("Frec:%f\n",frec(Fr));
    for j=1:iter
        [TrainX,TrainY,TestX,TestY]=randomlineselector(A,frec(Fr));
        Mean=mean(TrainX(:,2:end));
        Std=std(TrainX(:,2:end));
        TrainX(:,2:end)=(TrainX(:,2:end)-Mean)./Std;
        TestX(:,2:end)=(TestX(:,2:end)-Mean)./Std;
        for i=1:length(lambdas)
            lambda=lambdas(i);
            w=mylinridgereg(TrainX,TrainY,lambda);
            train_y=mylinridgeregeval(TrainX,w);
            train_error=meansquarederr(train_y,TrainY);
            Trainerror(Fr,i)=Trainerror(Fr,i)+train_error;
            % testing
            test_y=mylinridgeregeval(TestX,w);
            test_error=meansquarederr(test_y,TestY);
            Testerror(Fr,i)=Testerror(Fr,i)+test_error;
        end
    end
end
Trainerror=Trainerror/iter;
Testerror=Testerror/iter;
Min=min(min([Trainerror Testerror]));
Max=max(max([Trainerror Testerror]));
for Fr=1:length(frec)
    subplot(2,length(frec),Fr);
    plot(lambdas,Trainerror(Fr,:),'r-');%-min(Trainerror))/(max(Trainerror)-min(Trainerror)),'r-');
    title('training error');
    xlabel('lambda');
    ylabel('error');
    ylim([Min,Max]);
    subplot(2,length(frec),Fr+length(frec));
    plot(lambdas,Testerror(Fr,:),'b-');%-min(Testerror))/(max(Testerror)-min(Testerror)),'b-');
    title('testing error');
    xlabel('lambda');
    ylabel('error');
    ylim([Min,Max]);
end
% part 9: ploting min-frec and argmin_lambda-frec graphs

[Min,LMin]=min(Testerror,[],2);
figure(2);
subplot(1,2,1);
plot(frec,Min);
subplot(1,2,2);
plot(frec,lambdas(LMin));

%% part 10: for optimal lambda and frection
lambda=0.45;
frec=0.7;
A=initialize_variables('linregdata.txt');
[TrainX,TrainY,TestX,TestY]=randomlineselector(A,frec);
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