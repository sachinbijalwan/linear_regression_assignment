function [A]=initialize_variables(filename)
A=importdata(filename,',');
A.type=zeros(size(A.textdata,1),3);
A.type(:,1)=(A.textdata=="M");
A.type(:,2)=(A.textdata=="F");
A.type(:,3)=(A.textdata=="I");
end