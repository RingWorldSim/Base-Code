function res = RingworldRunner()
%Function simulates Ringworld as a series of point masses distributed
%around a central point.

k = .0000001; %spring constant between the segments of Ringworld (N/m)
vinitial = 29800; % Initial velocity of each piece of the ring
position_Sun = [0;0];
mass_Sun = 1.989*10^30;


number_of_masses = 13;
mass_ring = 1000; %Total mass of the ring
ring_radius = 1.5*10^11;
mass_of_piece = mass_ring/number_of_masses;
mass_positions = create_positions(number_of_masses, ring_radius); %positions of each mass
mass_velocities = create_velocities(number_of_masses, vinitial); %velocity vector for each
l0=norm(mass_positions(:,1)-mass_positions(:,2));  %calculates free length of spring

year = 365*24*60*60;
time = year*10;

%making timescale
time_scale = 1/year;

%%
initial_conditions = unsortData(mass_positions, mass_velocities);
tic
[t,Y] = ode23(@differentials, [0, time], initial_conditions);
toc

final_positions = Y(:, 1:length(Y(1,:))/2); %Gets the first half of the Y matrix
animateRingworldRunner(t, final_positions, time_scale);


%%
    function res = differentials(t, Y)
        [positions, velocities] = sortData(Y);
        dp = velocities;
        dv = find_acceleration(positions, mass_of_piece, mass_Sun, position_Sun, k, l0);
        %dv = zeros(2, length(positions));
        
        res = unsortData(dp, dv);
    end 

%%
end