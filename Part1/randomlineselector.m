function [TrainX, TrainY, TestX, TestY] = randomlineselector(A, frec)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Data=csvread(filename,0,1);
% m=size(Data,1);
% Cat=zeros(m,1);
% pf=fopen(filename);
% for i=1:m
%     line=fgets(pf);
%     Cat(i)=line(1);
% end
% Ids=randperm(m);
% fclose(pf);
% pf=fopen(out1,'w');
% for i=1:length(Ids)*frec
%     fprintf(pf,"%c",Cat(Ids(i)));
%     fprintf(pf,",%f",Data(Ids(i),:));
%     fprintf(pf,"\n");
% end
% fclose(pf);
% pf=fopen(out2,'w');
% for i=i:length(Ids)
%     fprintf(pf,"%c",Cat(Ids(i)));
%     fprintf(pf,",%f",Data(Ids(i),:));
%     fprintf(pf,"\n");
% end
% fclose(pf);
m=size(A.data,1);
Ids=randperm(m);
TrainM=floor(m*frec);
TrainX=[ones(TrainM,1) A.data(Ids(1:TrainM),1:end-1) A.type(Ids(1:TrainM),:)];
TrainY=A.data(Ids(1:TrainM),end);
TestX=[ones(m-TrainM,1) A.data(Ids(TrainM+1:end),1:end-1) A.type(Ids(TrainM+1:end),:)];
TestY=A.data(Ids(TrainM+1:end),end);
end
