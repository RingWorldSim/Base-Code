function res = max_radius_difference(Y)
    %Calculates the average orbital radius of the points
    [positions, velocities] = sortData(Y);

    radii = 0; %a vector containing all of the distances from the sun
    for i = 1:length(positions)
        radii = radii + norm(positions(:,i));
    end
    
    res = max(radii);
    
end