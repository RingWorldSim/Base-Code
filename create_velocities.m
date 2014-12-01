function res = create_velocities(m_number, velocity)
%This function takes in m_number, the number of masses, and velocity, the
%velocity each mass moves at. It uses these to create the vector
%velocities for each piece of the ring, assuming that it's currently moving
%in a circle
%
%The velocities are returned in a matrix where each column contains an
%x and y coordinate (x on top)
    
    theta = 2*pi/m_number; %The angle between any two masses
    velocities = []; %The empty list of velocities. I create it for good luck, mostly.
    
    for i = 1:m_number
        angle = (i-1)*theta; %Angle, starting at straight up, to the position of the mass
        x = -velocity*cos(angle); %x component of the position
        y = -velocity*sin(angle); %y component of the position
        velocities(1, i) = x;
        velocities(2, i) = y;
    end
    
    res = velocities;
    
    

end