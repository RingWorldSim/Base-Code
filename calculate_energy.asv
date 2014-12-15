function [spring_energy, kinetic_energy, potential_energy_sun, potential_energy_pieces, total_energy] = calculate_energy(Y, k, MStar, mass_piece, initial_distance)
    [positions, velocities] = sortData(Y);
    
    G=6.67e-11;
    
    spring_energy = 0;
    kinetic_energy = 0;
    potential_energy_sun = 0;
    potential_energy_pieces = 0;
    
    for i = 1:length(positions)
        %This next bit of code is used to figure out which masses are
        %next to the current mass, accounting for the fact that the
        %array is actually representing pieces of a circle
        M0_index = i; %M0 is the mass the force acts on
        if i == 1;
            M1_index = length(positions); %M1 is mass counterclockwise on the circle
            M2_index = 2; %M2 is the next mass clockwise on the circle
        elseif i == length(positions);
            M1_index = i-1;
            M2_index = 1;
        else
            M1_index = i-1;
            M2_index = i+1;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        P0 = [positions(1, M0_index);positions(2, M0_index)];
        P1 = [positions(1, M1_index);positions(2, M1_index)];
        P2 = [positions(1, M2_index);positions(2, M2_index)];
        V0 = [velocities(1, M0_index);velocities(2, M0_index)];
        
        %Spring Energy
        stretch = abs(norm(P0-P1) - initial_distance);
        spring_energy = spring_energy + .5 * k * stretch^2;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %Kinetic and basic potential
        h = norm(P0);
        kinetic_energy = kinetic_energy + .5 * mass_piece * norm(V0)^2;
        potential_energy_sun = potential_energy_sun + G*mass_piece*MStar/h;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %Between the mass and its neighbors
        potential1 = G*mass_piece^2/norm(P0-P1);
        potential2 = G*mass_piece^2/norm(P0-P2);
        potential_energy_pieces = potential1 + potential2 ;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    
    total_energy = spring_energy + kinetic_energy + potential_energy_sun + potential_energy_pieces;
end