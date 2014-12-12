function res = sweepMassVchange()
    masses = linspace(1.8*10^26, 1.8*10^30, 5);
    vchange = linspace(1, 100000000, 5);
    
    time2break=zeros(length(masses),length(vchange));
    counter = 1;
    for i=1:length(masses)
        for j=1:length(vchange)
            time2break(j,i)=RingworldMassVchange(masses(i),vchange(j));
            display(counter)
            counter = counter + 1;
        end
    end
    
    time2break=time2break/(24*60*60);
    pcolor(masses,vchange,time2break) %pcolor graph
    xlabel('Mass Ring (kg)')
    ylabel('V change (m/s)')
    title('Life of Ringworld')
    c = colorbar();
    ylabel(c,'Time before breaking (days)','FontSize',12);
end