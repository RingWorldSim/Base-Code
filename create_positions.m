function res = create_positions(m_number, radius)
    %takes in the number of masses, and the radius of the ringworld,
    %returning a list of "m_number" evenly spaced position vectors around a circle
    %with the given redius. m_number should be at leat two. If it's one, 
    %that's just craziness.
    %
    %The positions are returned in a matrix where each column contains an
    %x and y coordinate (x on top)
    
    theta = 2*pi/m_number; %The angle between any two masses
    positions = []; %The empty list of positions. I create it for good luck, mostly.
    
    for i = 1:m_number
        angle = (i-1)*theta; %Angle, starting at straight up, to the position of the mass
        x = radius*sin(angle); %x component of the position
        y = radius*cos(angle); %y component of the position
        positions(1, i) = x;
        positions(2, i) = y;
    end
    
    res = positions;
end
