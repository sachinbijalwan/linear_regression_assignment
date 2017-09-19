<<<<<<< HEAD
function [X,Y]=learn_X_Y(A,id)
if nargin<2 || id==0
    X=[ones(size(A.data,1),1) A.data(:,1:end-1) A.type];
    Y=A.data(:,end);
else
    Id=find(A.type(:,id)==1);
    X=[ones(length(Id),1) A.data(Id,1:end-1) A.type(Id,id)];
    Y=A.data(Id,end);
end
=======
function [X,Y]=learn_X_Y(A)
X=[ones(size(A.data,1),1) A.data(:,1:end-1)];
Y=A.data(:,end);
>>>>>>> 4019b228f06e9405e4c3cb92bc128818780cd280
end
