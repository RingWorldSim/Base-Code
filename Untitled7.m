positions = create_positions(8, 1.5*10^11); 
%     positions, mass of piece, mass of sun, position of sun, spring
%     constant
accelerations = find_acceleration (positions, 1000/4, 5.972e24, [0;0], 0)