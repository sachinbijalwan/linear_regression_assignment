function [ X ] = featuretransform( X, degree )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X=[ones(size(X,1),1) X];
for it=2:degree
    for i=0:it
        X=[X (X(:,2).^i).*(X(:,3).^(it-i))];
    end
end

end

