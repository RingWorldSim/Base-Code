function res = RingworldRunnerValidation()
%Function simulates Ringworld as a series of point masses distributed
%around a central point.
close all %closes graphing window
k = 10^15; %spring constant between the segments of Ringworld (N/m)
vinitial = 29800; % Initial velocity of each piece of the ring
position_Sun = [0;0];
mass_Sun = 1.989*10^30;


number_of_masses = 15;
mass_ring = 1.8*10^27; %Total mass of the ring
ring_radius = 1.5*10^11;
mass_of_piece = mass_ring/number_of_masses;
mass_positions = create_positions(number_of_masses, ring_radius); %positions of each mass

%can toggle between normal velocities and weird velocities
%mass_velocities = create_velocities(number_of_masses, vinitial); %velocity vector for each
mass_velocities = create_expanding_velocities(number_of_masses, vinitial, 1000); %velocity vector for each


l0=norm(mass_positions(:,1)-mass_positions(:,2));  %calculates free length of spring

year = 365*24*60*60;
time = year*10;

%making timescale
time_scale = 3/year;



%%
initial_conditions = unsortData(mass_positions, mass_velocities);
tic
options = odeset('Events', @events_func); %call to events function
[t,Y] = ode23(@differentials, [0:time/1000:time], initial_conditions);
toc

final_positions = Y(:, 1:length(Y(1,:))/2); %Gets the first half of the Y matrix
%animateRingworldRunner(t, final_positions, time_scale);

%%
for i  = 1:length(t)
    [spring_energy(i), kinetic_energy(i), potential_energy_sun(i), potential_energy_pieces(i), total_energy(i)] = calculate_energy(Y(i,:), k, mass_Sun, mass_of_piece, l0);
end
hold on

plot(t, spring_energy, 'g')
plot(t, kinetic_energy, 'r')
plot(t, potential_energy_sun, 'b')
plot(t, potential_energy_pieces, 'm')
plot(t, total_energy, 'k')


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
