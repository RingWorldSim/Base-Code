function [accelerations] = test_find_acceleration(positions,m_number)
    %creates vector of accelrations and positions
        %can call separately to get positions
    %positions = create_positions(4, 3.671*10^6); 
    %positions, mass of piece, mass of sun, position of sun, spring
    %constant
    positions=reshape(positions,[2,m_number]);
    accelerations = find_acceleration (positions, 1, 5.972e24, [0;0], 0)';
    accelerations=reshape(accelerations,[m_number*2,1]);
end
