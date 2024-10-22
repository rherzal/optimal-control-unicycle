function headingAngle = headingParametricSpline(t, P)

    P0x = P(1, 1);
    P0y = P(2, 1);
    P1x = P(1, 2);
    P1y = P(2, 2);
    P2x = P(1, 3);
    P2y = P(2, 3);
    P3x = P(1, 4);
    P3y = P(2, 4);
    
    headingAngle = atan2(3*P3y*t^2 - 3*P2y*t^2 - 3*P0y*(t - 1)^2 + 3*P1y*(t - 1)^2 + 3*P1y*t*(2*t - 2) - 2*P2y*t*(3*t - 3), 3*P3x*t^2 - 3*P2x*t^2 - 3*P0x*(t - 1)^2 + 3*P1x*(t - 1)^2 + 3*P1x*t*(2*t - 2) - 2*P2x*t*(3*t - 3));
    
end