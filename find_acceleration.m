function res = find_acceleration(positions)
%This function takes the list of positions, and calculates the acceleration for
%each point mass
    for i = length(positions)
        %This next bit of code is used to figure out which masses are
        %next to the current mass, accounting for the fact that the
        %array is actually representing pieces of a circle
        M0_index = i;
        if i == 1;
            M1_index = length(positions);
            M2_index = 2;
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
        force = massForce(mass_of_piece, mass_of_piece, mass_of_piece, mass_Sun, P0, P1, P2, position_Sun, k, k);
        accelerations(i) = force./mass_of_piece;
    end
    
    res = accelerations;
    end