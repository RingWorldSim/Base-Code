function [value,isterminal,direction] = events_func(t, W)
    % stop the integration when the ball gets to the wall.
    radiusDiff = 1e2;                  % difference between the radii
    value = W(1) - radiusDiff;        % equals 0 when maximum allowable radiusDiff is reached 
    isterminal = 1;                   %will terminate iteration
    direction = 1;                  %approach from either direction
end
