function A=initialize_variables(filename)
% clc;
% filename='linregdata.txt';
A=importdata(filename,',');
for i=1:length(A.data(1,:))-1
    A.data(:,i)=zscore(A.data(:,i)); % function for performing
                                     % standardization of line
end
A.data(:,11)=A.data(:,8);
A.data(:,8)=(A.textdata=="M");
A.data(:,9)=(A.textdata=="F");
A.data(:,10)=(A.textdata=="I");
end