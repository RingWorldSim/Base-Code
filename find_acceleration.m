function res = find_acceleration(positions, mass_of_piece, mass_Sun, position_Sun, k, l0)
%This function takes the list of positions, and calculates the acceleration for
%each point mass
    accelerations = zeros(2,length(positions));
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
        force = massForce2(mass_of_piece, mass_of_piece, mass_of_piece, mass_Sun, P0, P1, P2, position_Sun, k, l0);
        %Above line calculates a force vector on the mass
        
        acceleration = force./mass_of_piece; %Based on F = ma
        accelerations(1,i) = acceleration(1);
        accelerations(2,i) = acceleration(2);
    end
    
    res = accelerations; %Returns a column vector [x;y] accelerations
    end
