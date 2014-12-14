function final_time= RingworldOtherSweep(ratio, vinitial)
%Function simulates Ringworld as a series of point masses distributed
%around a central point.
close all
k = 1; %spring constant between the segments of Ringworld (N/m)
%vinitial = 29800; % Initial velocity of each piece of the ring 29800
position_Sun = [0;0];



number_of_masses = 15;
mass_ring = 1.8*10^20; %Total mass of the ring
mass_Sun = ratio*mass_ring;
ring_radius = 1.5*10^11;
% mass_ring = 1e5;
% ring_radius = 50;
% vinitial = 2980;
 %mass_Sun = 0;
mass_of_piece = mass_ring/number_of_masses;
mass_positions = create_positions(number_of_masses, ring_radius); %positions of each mass

mass_velocities = create_velocities(number_of_masses, vinitial); %velocity vector for each
%mass_velocities = create_weird_velocities(number_of_masses, vinitial); %velocity vector for each


l0=norm(mass_positions(:,1)-mass_positions(:,2));  %calculates free length of spring

year = 365*24*60*60;
time = year*30;

%making timescale
time_scale = 3/year;

%%
initial_conditions = unsortData(mass_positions, mass_velocities);

options = odeset('Events', @events_func2); %call to events function
% [t,Y] = ode23(@differentials, [0:time/1000:time], initial_conditions, options);
[t,Y] = ode23(@differentials, [0,time], initial_conditions, options);
time

final_positions = Y(:, 1:length(Y(1,:))/2); %Gets the first half of the Y matrix
final_time=t(end)
%animateRingworldRunner(t, final_positions, time_scale);


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
