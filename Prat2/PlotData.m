function [ ] = PlotData( X, Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=size(X,1);
P=[];
N=[];
for i=1:m
    if Y(i)==1
        P=[P;X(i,:)];
    else
        N=[N;X(i,:)];
    end
end
disp(size(P));
disp(size(N));
if size(P,1)~=0
    plot(P(:,1),P(:,2),'bx');
    hold on;
end
if size(N,1)~=0
    plot(N(:,1),N(:,2),'ro');
end
hold off;
end

