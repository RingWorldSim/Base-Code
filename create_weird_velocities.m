function res = create_weird_velocities(m_number, velocity)
%It's the create_velocities function, except it modifies the initial
%velocities to see what happens if it is really, really broken
    
    velocities = create_velocities(m_number, velocity);
    velocities(2, 1) = 10000;
    res = velocities;
    %     for i = 1:length(velocities(1,:))
%        velocity = velocities(:,i);
%        vhat = velocity/norm(velocity);
%        velocity = velocity + extra_velocity*vhat;
%        velocities(1, i) = velocity(1);
%        velocities(2, i) = velocity(2);
%     end
%     res = velocities;
   
end