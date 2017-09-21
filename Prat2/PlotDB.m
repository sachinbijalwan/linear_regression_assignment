function [ output_args ] = PlotDB( X, W, mean, std, label, degree )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
PlotData(X(:,2:3), label);
hold on

% if size(X, 2) <= 3
%     % Only need 2 points to define a line, so choose two endpoints
%     plot_x = [min(X(:,2))-2,  max(X(:,2))+2];
% 
%     % Calculate the decision boundary line
%     plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));
% 
%     % Plot, and adjust axes for better viewing
%     plot(plot_x, plot_y)
%     
%     % Legend, specific for the exercise
%     legend('Admitted', 'Not admitted', 'Decision Boundary')
%     axis([30, 100, 30, 100])
% else
    % Here is the grid range
    u = linspace(-2, 10, 50);
    v = linspace(-2, 10, 50);
    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            normal=featuretransform([u(i) v(j)],degree);
            normal(:,2:end)=(normal(:,2:end)-mean)./std;
            z(i,j) = normal*W;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour((u-mean(1))/std(1), (v-mean(2))/std(2), z, [0,0], 'LineWidth', 2);
    
% end
hold off


end

