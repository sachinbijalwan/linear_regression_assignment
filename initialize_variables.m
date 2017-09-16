function A=initialize_variables(filename)
clc;
% filename='linregdata.txt';
A=importdata(filename,',');
for i=1:length(A.data(1,:))-1
    A.data(:,i)=zscore(A.data(:,i)); % function for performing
                                     % standardization of line
end
type=zeros(length(A.textdata(:,1)),3);

for i=1:length(A.textdata(:,1))
    if(A.textdata(i)=="M")
        type(i,:)=[0,0,1];
    end
    if(A.textdata(i)=="F")
            type(i,:)=[1,0,0];
    end
    if(A.textdata(i)=="I")
            type(i,:)=[0,1,0];
    end
end
A.type=type;                    %type would contain male,female or infant
% A.ans[1]=A.ans[1];
% A.ans[2]=A.ans[2];