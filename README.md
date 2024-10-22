# Model Predictive Contouring Control for Unicycle Robots

Inspired form [this paper](https://ieeexplore.ieee.org/abstract/document/5717042?casa_token=TZz-NFfVWaUAAAAA:H5cBRGcLZFL4-GFpyKxOwCsNyR8XkVZgOh5UyK7QLt_x0KWPZMqi-lpPfSn8mHe3yo8zRApRdSxVmOE), adapted for path following for unicycle robots. 

Computes the velocity commands for a robot, such that it tracks a given parametric spline, using nonlinear model predictive control. 

The cost function allows for a tradeoff between a better tracking of the spline, and a faster progression along it's length, towards the target.


