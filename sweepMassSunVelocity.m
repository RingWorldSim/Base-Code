function res = sweepMassSunVelocity()
    massSun = linspace(1.8*10^29, 1.8*10^32, 7);
    velocity = linspace(10000, 100000, 7);
    
    time2break=zeros(length(massSun),length(velocity));
    counter = 1;
    for i=1:length(massSun)
        for j=1:length(velocity)
            time2break(j,i)=RingworldMassSunVelocity(massSun(i),velocity(j));
            display(counter)
            counter = counter + 1;
        end
    end
    
    time2break=time2break/(24*60*60);
    pcolor(massSun,velocity,time2break) %pcolor graph
    xlabel('Mass Sun (kg)')
    ylabel('Velocity of Ring (m/s)')
    title('Life of Ringworld')
    c = colorbar();
    ylabel(c,'Time before breaking (days)','FontSize',12);
end