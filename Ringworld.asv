function res = Ringworld()
%Function simulates Ringworld as a series of point masses distributed
%around a central point.

k = 1; %spring constant between the segments of Ringworld
vinitial = 1; % Initial velocity of each piece of the ring
position_Sun = [0;0];
mass_Sun = 100;


number_of_masses = 20;
mass_ring = 10; %Total mass of the ring
ring_radius = 10;
mass_of_piece = mass_ring/number_of_masses;
mass_positions = create_positions(number_of_masses, ring_radius) %positions of each mass
mass_velocities = create_velocities(number_of_masses, vinitial) %velocity vector for each

%%
% initial_conditions = [mass_positions; mass_velocities];
% [t,Y] = ode45(@differentials, [0, 100], initial_conditions);
% 
% end_results = Y(2);
% plot(end_results)

%%
    function res = differentials(t, Y)
    
        positions = Y(1);
        velocities = Y(2);
    
        dp = velocities; %delta position is velocity.
        dv = find_acceleration(positions); %Change in velocities requires us to figure out
                                           %acceleration for each point -
                                           %force function requires their
                                           %positions
        
        res = [dp;dv];
    end



end