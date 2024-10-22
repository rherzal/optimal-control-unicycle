function cost = jFunction(X,U,e,data, param)
    P = [0.0 2.0 0.0  2.0;
     0.0 0.0 2.0  2.0];


    cost = 0;
    N = data.PredictionHorizon;

    for i = 1:N+1
        cost = cost + lFunction(X(i, :), U(i, :), P);
    end
end