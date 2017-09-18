function [ output_args ] = randomlineselector( filename, out1, out2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Data=csvread(filename,0,1);
frec=0.2;
m=size(Data,1);
Cat=zeros(m,1);
pf=fopen(filename);
for i=1:m
    line=fgets(pf);
    Cat(i)=line(1);
end
disp(Cat');
disp(Data');
Ids=randperm(1:m);
fclose(pf);
pf=fopen('train.txt');
for i=1:length(Ids)*frec
    fprintf("%f",Cat(Ids(i)));
    fprintf(",%f",Data(Ids(i)),:);
    fprintf("\n");
end
pclose(pf);
pf=fopen('test.txt');
for i=i:length(Ids)
    fprintf(pf,"%c",Cat(Ids(i)));
    fprintf(pf,",%f",Data(Ids(i)),:);
    fprintf(pf,"\n");
end
pclose(pf);
end
