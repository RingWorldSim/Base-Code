function [value,isterminal,direction] = events_func(t, Y)
    % stop the integration when the ball gets to the wall.
    allowableDiff=1e2;              %allowable radius difference
    radiusDiff = radius_difference(Y);    % difference between the radii
    value =  radiusDiff-allowableDiff;     % equals 0 when maximum allowable radiusDiff is reached 
    isterminal = 1;                   %will terminate iteration
    direction = 0;                  %approach from either direction
end
