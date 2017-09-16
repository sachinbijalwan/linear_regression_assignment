clear count1 count2;
count1=0;
count2=0;
for i=1:length(train_error(:,1))
    if(train_error(i,1)<1 && train_error(i,1)>-1)
        count1=count1+1;
    else
        count2=count2+1;
    end
end