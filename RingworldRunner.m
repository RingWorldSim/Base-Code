function res = RingworldRunner()
tic
%Function simulates Ringworld as a series of point masses distributed
%around a central point.

k = 0; %spring constant between the segments of Ringworld
vinitial = 29.78*10^3; % Initial velocity of each piece of the ring
position_Sun = [0;0];
mass_Sun = 1.989*10^30;


number_of_masses = 4;
mass_ring = 1000; %Total mass of the ring
ring_radius = 1.5*10^11;
mass_of_piece = mass_ring/number_of_masses;
mass_positions = create_positions(number_of_masses, ring_radius); %positions of each mass
mass_velocities = create_velocities(number_of_masses, vinitial); %velocity vector for each

year = 365*24*60*60;
time = year*10;
%%
initial_conditions = unsortData(mass_positions, mass_velocities);
[t,Y] = ode45(@differentials, [0, time], initial_conditions);

final_positions = Y(:, 1:length(Y(1,:))/2); %Gets the first half of the Y matrix
animateRingworldRunner(t, final_positions)


%%
    function res = differentials(t, Y)
        [positions, velocities] = sortData(Y);
        
        dp = velocities;
        dv = find_acceleration(positions, mass_of_piece, mass_Sun, position_Sun, k);
        
        res = unsortData(dp, dv)';
    end 

%%

toc
end