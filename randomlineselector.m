function [ ] = randomlineselector( filename, frec)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Data=csvread(filename,0,1);
m=size(Data,1);
Cat=zeros(m,1);
pf=fopen(filename);
for i=1:m
    line=fgets(pf);
    Cat(i)=line(1);
end
Ids=randperm(m);
Train_X=

fclose(pf);
pf=fopen(out1,'w');
for i=1:length(Ids)*frec
    fprintf(pf,"%c",Cat(Ids(i)));
    fprintf(pf,",%f",Data(Ids(i),:));
    fprintf(pf,"\n");
end
fclose(pf);
pf=fopen(out2,'w');
for i=i:length(Ids)
    fprintf(pf,"%c",Cat(Ids(i)));
    fprintf(pf,",%f",Data(Ids(i),:));
    fprintf(pf,"\n");
end
fclose(pf);
end
