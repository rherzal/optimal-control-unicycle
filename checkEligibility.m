function eligible = checkEligibility(robotState)
    if robotState(1) >= 0.0 && robotState(1) <= 3.0 && robotState(2) >= 0.0 && robotState(2) <= 3.0 && robotState(3) >= -pi && robotState(3) <= pi
        eligible = true;
    else
        eligible = false;
    end
end