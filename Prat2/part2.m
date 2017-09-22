load('credit.mat');
data=[ones(size(data,1),1) data];

%% Que1
PlotData(data(:,2:3),label);
pause;

%% Que2
Mean=sum(data(:,2:end))/size(data,1);
Std=(sum(data(:,2:end).^2)/size(data,1)-Mean.^2).^0.5;
data(:,2:end)=(data(:,2:end)-Mean)./Std;
InitialW=rand(size(data,2),1)*0.2-0.1;

% fprintf("\n \nGradient descent:::::::::::::::::::::::::\n");
% CostFun = @(w) LogisticReg(w, data, label, lambda);
% [FinalW]=GradientDecent(CostFun,InitialW,200,8);
% figure(1);
% subplot(1,2,1);
% PlotData(data(:,2:3),label);
% PlotDB(data,FinalW,Mean,Std,label,1);
% title('gradient descent');
% p=Predict(data,FinalW);
% fprintf("Accurecy:%f\n",sum(p==label)/size(label,1));
% 
% fprintf("\n \nNewton Raphson:::::::::::::::::::::::::\n");
% [FinalW]=NewtonReph(CostFun,data,InitialW,200,lambda);
% subplot(1,2,2);
% PlotData(data(:,2:3),label);
% PlotDB(data,FinalW,Mean,Std,label,1);
% title('newton raphson');
% p=Predict(data,FinalW);
% fprintf("Accurecy:%f\n",sum(p==label)/size(label,1));
% pause;

%% Que3
Id=randperm(size(data,1));
%for degree=1:5
for degree=1:5
    data=featuretransform(data(:,2:3),degree);
    Frec=round(0.6*size(data,1));
    TrainData=data(Id(1:Frec),:);
    TrainLabel=label(Id(1:Frec));
    TestData=data(Id(Frec+1:end),:);
    TestLabel=label(Id(Frec+1:end));

    Mean=sum(TrainData(:,2:end))/size(TrainData,1);
    Std=(sum(TrainData(:,2:end).^2)/size(TrainData,1)-Mean.^2).^0.5;
    TrainData(:,2:end)=(TrainData(:,2:end)-Mean)./Std;
    TestData(:,2:end)=(TestData(:,2:end)-Mean)./Std;
    InitialW=rand(size(TrainData,2),1)*0.2-0.1;
    lambda=0.01;
    CostFun = @(w) LogisticReg(w, TrainData, TrainLabel, lambda);
    [FinalW]=NewtonReph(CostFun,TrainData,InitialW,200,lambda);
    p=Predict(TrainData,FinalW);
    figure;
    PlotData(TrainData(:,2:3),TrainLabel);
    PlotDB(TrainData,FinalW,Mean,Std,TrainLabel,degree);
    fprintf("Norm of W:%f\n",sum(abs(FinalW)));
    fprintf("degree:%d",degree);
    fprintf("Trainaccurecy:%f\t",sum(p==TrainLabel)/size(TrainLabel,1));
    p=Predict(TestData,FinalW);
    fprintf("Testaccurecy:%f\n",sum(p==TestLabel)/size(TestLabel,1));

end
pause;

%% Que 6:
clc;
degree=2;
%Id=randperm(size(data,1));
lambdas=0:0.005:.1;
Acc=zeros(2,length(lambdas));
for i=1:length(lambdas)
    data=featuretransform(data(:,2:3),degree);
    Frec=round(0.6*size(data,1));
    TrainData=data(Id(1:Frec),:);
    TrainLabel=label(Id(1:Frec));
    TestData=data(Id(Frec+1:end),:);
    TestLabel=label(Id(Frec+1:end));

    Mean=sum(TrainData(:,2:end))/size(TrainData,1);
    Std=(sum(TrainData(:,2:end).^2)/size(TrainData,1)-Mean.^2).^0.5;
    TrainData(:,2:end)=(TrainData(:,2:end)-Mean)./Std;
    TestData(:,2:end)=(TestData(:,2:end)-Mean)./Std;
    InitialW=rand(size(TrainData,2),1)*0.2-0.1;
    CostFun = @(w) LogisticReg(w, TrainData, TrainLabel, lambdas(i));
    [FinalW]=NewtonReph(CostFun,TrainData,InitialW,200,lambdas(i));
    p=Predict(TrainData,FinalW);
    Acc(1,i)=sum(p==TrainLabel)/size(TrainLabel,1);
    p=Predict(TestData,FinalW);
    Acc(2,i)=sum(p==TestLabel)/size(TestLabel,1);
end
disp([lambdas' Acc']);