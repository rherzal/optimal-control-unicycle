function cost = lFunction(robotState, robotInput, P)

    [splinePoint, t] = minimumToCurve([robotState(1); robotState(2)], P);
   
    
    contouringError = norm(splinePoint - [robotState(1); robotState(2)], 2);
    lagError = (1 - t);
    
    q0 = 100;
    q1 = 10;
    
    R = [ 0 0 ;
          0 0.01];

    cost = contouringError ^ 2 * q0 + robotInput * R * robotInput' + lagError ^ 2  * q1; 

    
end