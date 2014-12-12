function [value,isterminal,direction] = events_func3(t, Y)
%This function looks to see if ANY point has exited the allowable radius
%difference. Really, if one's that far off, the ring is probably doomed.

    allowableDiff=1.5*10^3;              %allowable radius difference
    radiusDiff = max_radius_difference(Y);    % difference between the radii
    value =  radiusDiff-allowableDiff;     % equals 0 when maximum allowable radiusDiff is reached 
    isterminal = 1;                   %will terminate iteration
    direction = 0;                  %approach from either direction

end