function res = test_find_acceleration()
    positions = create_positions(4, 6.371*10^6) 
    
    %positions, mass of piece, mass of sun, position of sun, spring
    %constant
    accelerations = find_acceleration (positions, 1, 5.972e24, [0;0], 0);
    display(accelerations)
    
end