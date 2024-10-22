clear all;
clc;

robotStateSpace = {};
robotStateSpace{1} = linspace(0.0, 2, 101);         % x
robotStateSpace{2} = linspace(0.0, 2, 101);         % y 
robotStateSpace{3} = linspace(-pi, pi, 11);
% theta

    P = [0.0 2.0 0.0  2.0;
     0.0 0.0 2.0  2.0];

M = zeros(length(robotStateSpace{1}), length(robotStateSpace{2}));
%%
for ix1 = 1:length(robotStateSpace{1})
    for ix2 = 1:length(robotStateSpace{2})
        action = [0 0];
        robotState = [robotStateSpace{1}(ix1) robotStateSpace{2}(ix2) 0];
        M(ix2, ix1) = lFunction(robotState, action, P);
    end
end

theta = 0:0.01:1;
points = zeros(2, length(theta));
for i = 1:length(theta)
    points(:, i) = parametricSpline(theta(i), P);
end


[X, Y] = meshgrid(robotStateSpace{1}, robotStateSpace{2});
hold on;
surf(X, Y, M);
view(2);
plot(points(1, :), points(2, :), 'r', 'LineWidth',1);
hold off;

%%
% theta = 0:0.01:1;
% points = zeros(2, length(theta));
% for i = 1:length(theta)
%     points(:, i) = parametricSpline(theta(i), P);
% end
% 
% [point, tau] = minimumToCurve([0; 0.5], P);
% 
% hold on;
% plot(points(1, :), points(2, :), 'r', 'LineWidth',1);
% plot(point(1), point(2), 'b*');
% hold off;
% 
% lFunction([0; 0; 0.0], [0;0], P)