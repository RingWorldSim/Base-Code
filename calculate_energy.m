function [spring_energy, kinetic_energy, potential_energy, total_energy] = calculate_energy(Y, k, MStar, mass_piece, initial_distance)
    [positions, velocities] = sortData(Y);
    
    G=6.67e-11;
    
    spring_energy = 0;
    kinetic_energy = 0;
    potential_energy = 0;
    
    for i = 1:length(positions)
        %This next bit of code is used to figure out which masses are
        %next to the current mass, accounting for the fact that the
        %array is actually representing pieces of a circle
        M0_index = i; %M0 is the mass the force acts on
        if i == 1;
            M1_index = length(positions); %M1 is mass counterclockwise on the circle
        else
            M1_index = i-1;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        P0 = [positions(1, M0_index);positions(2, M0_index)];
        P1 = [positions(1, M1_index);positions(2, M1_index)];
        
        stretch = abs(norm(P0-P1) - initial_distance);
        spring_energy = spring_energy + .5 * k * stretch^2;
    end
    
    for i = 1:length(positions)
        M0_index = i;
        P0 = [positions(1, M0_index);positions(2, M0_index)];
        V0 = [velocities(1, M0_index);velocities(2, M0_index)];
        
        h = norm(P0);
        
        
        kinetic_energy = kinetic_energy + .5 * mass_piece * norm(V0)^2;
        potential_energy = potential_energy + G*mass_piece*MStar/h;
    end
    
    total_energy = spring_energy + kinetic_energy + potential_energy;
end