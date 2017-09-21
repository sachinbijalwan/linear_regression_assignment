function [x]=temp(x,n)
if (n==1)
    return;
else
    L = temp(x(1:n/2),n/2);
    R = temp(x((n/2)+1:n),n/2);
    for I=1:n/2
        x(I)=L(I)+R(I)*exp(-2*pi*i*I/n);
    end
    for I=1:n/2
        x(I+n/2)=L(I)-R(I)*exp(-2*pi*i*I/n);
    end
end