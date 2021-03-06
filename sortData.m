function [current_positions, current_velocities] = sortData(Y)
    %The ode45 function uses a single column vector to transfer data
    %between iterations. Our data isn't stored like that, so this
    %separates the data for the column vector, Y, into the matricies that
    %our functions actually use

    positions = Y(1:length(Y)/2); %separate the positional and velocity components
    velocities = Y(length(Y)/2+1:end); %It makes it easier to rearange the lists
    current_positions = zeros([2, length(positions)/2]);
    current_velocities = zeros([2, length(velocities)/2]);

    counter = 1;
    for i = 1:length(positions)
        %Separates the X and Y data, and rearranges it in the correct
        %format for functions that calculate position and velocity.
        if mod(i, 2) == 0; %Detects even or odd numbers
            current_positions(2, counter) = positions(i);
            counter = counter + 1;
        else
            current_positions(1, counter) = positions(i);
        end    
    end
        
    counter = 1;
    for i = 1:length(velocities)
        %Separates the X and Y data, and rearranges it in the correct
        %format for functions that calculate position and velocity.
        if mod(i, 2) == 0; %Detects even or odd numbers
            current_velocities(2, counter) = velocities(i);
            counter = counter + 1;
        else
            current_velocities(1, counter) = velocities(i);
        end    
    end
end