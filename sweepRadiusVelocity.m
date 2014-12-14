function res = sweepRadiusVelocity()
    radius = linspace(1.8*10^10, 1.8*10^12, 5);
    velocity = linspace(15000, 45000, 5);
    
    time2break=zeros(length(radius),length(velocity));
    counter = 1;
    for i=1:length(radius)
        for j=1:length(velocity)
            time2break(j,i)=RingworldRadiusVelocity(radius(i),velocity(j));
            display(counter)
            counter = counter + 1;
        end
    end
    
    time2break=time2break/(365*24*60*60);
    clf
    pcolor(radius,velocity,time2break) %pcolor graph
    xlabel('Radius (meters)')
    ylabel('Velocity of Ring (m/s)')
    title('Life of Ringworld')
    c = colorbar();
    ylabel(c,'Time before breaking (years)','FontSize',12);

end