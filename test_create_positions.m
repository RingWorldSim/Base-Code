function test_create_positions()
    %Built to test the create_positions function, by plotting the points
    %output
    m_number = 50;
    radius = 5;
    
    positions = create_positions(m_number, radius);
    
    clf
    hold on
    plot(positions(1,:), positions(2,:), '.b')

end