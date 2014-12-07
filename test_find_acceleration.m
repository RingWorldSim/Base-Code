function accelerations = test_find_acceleration(positions)
    %creates vector of accelrations and positions
        %can call separately to get positions
    %Commented out positions and replaced it with a function input. Left the code in here to help with ease of testing
    %positions = create_positions(4, 3.671*10^6); 
    %positions, mass of piece, mass of sun, position of sun, spring
    %constant
    accelerations = find_acceleration (positions, 1, 5.972e24, [0;0], 0); %call to find accelerations
end
