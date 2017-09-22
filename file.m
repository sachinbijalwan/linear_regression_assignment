a=fopen('linregdata.txt');
c=textscan(a,'%c,%f,%f,%f,%f,%f,%f,%f,%d');
fclose(a);
b=fopen('test_train.txt','w');
d=cell2mat(c(1,2));
fprintf(b,'%f,%f,%f,%f,%f,%f,%f,%d\n',cell2mat(c(1,2)),cell2mat(c(1,3)),cell2mat(c(1,4)),cell2mat(c(1,5)),cell2mat(c(:,6)),cell2mat(c(:,7)),cell2mat(c(:,8)),cell2mat(c(:,9)));
fclose(a);
d
% fclose(b);
