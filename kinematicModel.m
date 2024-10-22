function x_plus = kinematicModel(x, u)
    x_plus = zeros(3, 1);
    dt = 0.1;
    % x
    x_plus(1) = x(1) + dt * u(1) * cos(x(3));
    % y
    x_plus(2) = x(2) + dt * u(1) * sin(x(3));
    % theta
    x_plus(3) = wrapToPi(x(3) + dt * u(2));

end