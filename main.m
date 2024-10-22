clear all;
clc;

robotStateSpace = {};
robotStateSpace{1} = linspace(0.0, 2, 11);         % x
robotStateSpace{2} = linspace(0.0, 2, 11);         % y 
robotStateSpace{3} = linspace(-pi, pi, 11);        % theta

robotInputSpace = {};
robotInputSpace{1} = linspace(0, 1, 5);
robotInputSpace{2} = linspace(-3, 3, 11);

dt = 0.1;
t = 0:dt:10;
N = length(t);


P = [0.0 2.0 0.0  2.0;
     0.0 0.0 2.0  2.0];

predictionHorizon = 10;
controlHorizon = 1;

%%

mpcProblem = nlmpc(3, 3, 2);

mpcProblem.Ts = dt;
mpcProblem.ControlHorizon = controlHorizon;
mpcProblem.Model.IsContinuousTime = false;
mpcProblem.Model.StateFcn = 'kinematicModel';

mpcProblem.States(1).Min = -0.1;
mpcProblem.States(2).Min = -0.1;
mpcProblem.States(3).Min = -pi;

mpcProblem.States(1).Max = 2.1;
mpcProblem.States(2).Max = 2.1;
mpcProblem.States(3).Max = pi;

mpcProblem.States(1).Name = 'x';
mpcProblem.States(2).Name = 'y';
mpcProblem.States(3).Name = 'theta';

mpcProblem.States(1).Units = 'm';
mpcProblem.States(2).Units = 'm';
mpcProblem.States(3).Units = 'rad';



mpcProblem.Optimization.ReplaceStandardCost = true;
mpcProblem.Optimization.CustomCostFcn = "jFunction";


%% 

x0 = [0.0 0.0 0.0];
x = zeros(N, 3);
x(1, :) = x0;
u = zeros(N, 2);

for i = 1:(N-1)
    u(i+1, :) = nlmpcmove(mpcProblem, x(i, :), u(i, :));
    x(i+1, :) = kinematicModel(x(i, :), u(i+1, :));
end


%% 

theta = 0:0.01:1;
points = zeros(2, length(theta));
for i = 1:length(theta)
    points(:, i) = parametricSpline(theta(i), P);
end

figure;
hold on;
plot(x(:, 1), x(:, 2));
plot(points(1, :), points(2, :));
hold off;


