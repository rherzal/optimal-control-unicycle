function point = parametricSpline (t, P)
    % cubic bezier curve
    P0 = P(:, 1);
    P1 = P(:, 2);
    P2 = P(:, 3);
    P3 = P(:, 4);

    point = (1 - t)^3 * P0 + 3 * (1 - t)^2 * t * P1 + 3 * (1 - t) * t^2 * P2 + t^3 * P3;
end