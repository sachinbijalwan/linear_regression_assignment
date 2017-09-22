function [ output_args ] = PlotDB( X, W, Mean, Std, label, degree )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
PlotData(X(:,2:3), label);
hold on

u = linspace((min(X(:,2))+Mean(1))*Std(1), (max(X(:,2))+Mean(2))*Std(2), 50);
v = linspace((min(X(:,3))+Mean(1))*Std(1), (max(X(:,3))+Mean(2))*Std(2), 50);
z = zeros(length(u), length(v));
for i = 1:length(u)
    for j = 1:length(v)
        normal=featuretransform([u(i) v(j)],degree);
        normal(:,2:end)=(normal(:,2:end)-Mean)./Std;
        z(i,j) = normal*W;
    end
end
z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour((u-Mean(1))/Std(1), (v-Mean(2))/Std(2), z, [0,0], 'LineWidth', 2);
    
% end
hold off


end