function res = unsortData(positions, velocities)
    %Takes in the current positions and velocities, and translates them
    %into a single column vector, so it can go back out of ode45
        
    counter = 1;
    results_counter = 1;
    while counter <= length(positions(1,:))
        results(results_counter) = positions(1,counter);
        results_counter = results_counter + 1;
        results(results_counter) = positions(2,counter);
        results_counter = results_counter + 1;
        counter = counter + 1;
    end
       
    counter = 1;
    while counter <= length(velocities(1,:))
        results(results_counter) = velocities(1,counter);
        results_counter = results_counter + 1;
        results(results_counter) = velocities(2,counter);
        results_counter = results_counter + 1;
        counter = counter + 1;
    end
        
    res = results';
end