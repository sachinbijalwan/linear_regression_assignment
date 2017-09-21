load('../credit.mat');

%% part1
PlotData(data,label);


%% part2
degree=2;
data=featuretransform(data,degree);
mean=sum(data(:,2:end))/size(data,1);
std=(sum(data(:,2:end).^2)/size(data,1)-mean.^2).^0.5;
data(:,2:end)=(data(:,2:end)-mean)./std;
InitialW=rand(size(data,2),1)*0.2-0.1;
CostFun = @(w) LogisticReg(w, data, label, 0);
[FinalW]=GradientDecent(CostFun,InitialW,200,5);
%[FinalW]=NewtonReph(CostFun,data,label,InitialW,200);
PlotDB(data,FinalW,mean,std,label,degree);
p=Predict(data,FinalW);
figure;
PlotData(data(:,2:3),p);
fprintf("Norm of W:%f\n",sum(abs(FinalW)));
fprintf("Accurecy:%f\n",sum(p==label)/size(label,1));