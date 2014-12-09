function res = create_weird_velocities(m_number, velocity)
%It's the create_velocities function, except it modifies the initial
%velocities to see what happens if it is really, really broken
    
    velocities = create_velocities(m_number, velocity);
    velocities(1,2) = 10000;
   
end