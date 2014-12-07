function res = unsortData(positions, velocities)
    %Takes in the current positions and velocities, and translates them
    %into a single column vector, so it can go back out of ode45
        
    counter = 1;
    while counter < length(positions(1,:))
        results(counter) = positions(1,counter);
        counter = counter + 1;
        results(counter) = positions(2,counter);
        counter = counter + 1;
    end
       
    
    while counter - length(positions(1,:))< length(velocities(1,:))
        results(counter) = velocities(1,counter - length(positions(1,:)));
        counter = counter + 1;
        results(counter) = velocities(2,counter - length(positions(1,:)));
        counter = counter + 1;
    end
        
    res = results;
end