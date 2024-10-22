function [point, t] = minimumToCurve(givenPoint, P)
    t = 0.5;
    alpha = 0.01;
    iterations = 50;

%     syms t P0x P0y P1x P1y P2x P2y P3x P3y X Y J(t) fx(t) fy(t)
% 
%     % (1 - t)^3 * P0 + 3 * (1 - t)^2 * t * P1 + 3 * (1 - t) * t^2 * P2 + t^3 * P3;
%      
%     fy(t) = (1 - t)^3 * P0y + 3 * (1 - t)^2 * t * P1y + 3 * (1 - t) * t^2 * P2y + t^3 * P3y;
%     fx(t) = (1 - t)^3 * P0x + 3 * (1 - t)^2 * t * P1x + 3 * (1 - t) * t^2 * P2x + t^3 * P3x;
%     
%     J(t) = (fy(t) - Y) ^ 2 + (fx(t) - X) ^ 2;
%     
%     diff(J, t)


    X = givenPoint(1);
    Y = givenPoint(2);
    P0x = P(1, 1);
    P0y = P(2, 1);
    P1x = P(1, 2);
    P1y = P(2, 2);
    P2x = P(1, 3);
    P2y = P(2, 3);
    P3x = P(1, 4);
    P3y = P(2, 4);
    
    
    for i = 1:iterations
        gradient = 2*(X - P3x*t^3 + P0x*(t - 1)^3 - 3*P1x*t*(t - 1)^2 + P2x*t^2*(3*t - 3))*(3*P2x*t^2 - 3*P3x*t^2 + 3*P0x*(t - 1)^2 - 3*P1x*(t - 1)^2 - 3*P1x*t*(2*t - 2) + 2*P2x*t*(3*t - 3)) + 2*(Y - P3y*t^3 + P0y*(t - 1)^3 - 3*P1y*t*(t - 1)^2 + P2y*t^2*(3*t - 3))*(3*P2y*t^2 - 3*P3y*t^2 + 3*P0y*(t - 1)^2 - 3*P1y*(t - 1)^2 - 3*P1y*t*(2*t - 2) + 2*P2y*t*(3*t - 3));
        t = t - alpha * gradient;
    end

    if t < 0
        t = 0;
    elseif t > 1
        t = 1;
    end
    
    point = parametricSpline(t, P);
    
end 