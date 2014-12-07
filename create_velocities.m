function res = create_velocities(m_number, velocity)
%This function takes in m_number, the number of masses, and velocity, the
%velocity each mass moves at. It uses these to create the vector
%velocities for each piece of the ring, assuming that it's currently moving
%in a circle
%
%The velocities are returned in a matrix where each column contains an
%x and y coordinate (x on top)
    
    theta = 2*pi/m_number; %The angle between any two masses
    velocities = zeros(2,m_number); %initializes array of velocities
    
    for i = 1:m_number
        angle = (i-1)*theta; %Angle, measuring at straight up, 
                             %to the position of the mass
                             %(counterclockwise)
        x = -velocity*cos(angle); %x component of the position, m/s
        y = -velocity*sin(angle); %y component of the position, m/s
        velocities(1, i) = x;
        velocities(2, i) = y;
    end
    
    res = velocities;
    
    

end
