function otherSweep()
%sweeps the k and initial velocity of ringworld
%   calls Ringworld2params and generates pcolor graph

% determines values of the two paramters to sweep, in this case k and
% vinitial
format long
ratio = linspace(0,1e9,10);
%vinitial = linspace(1e2,9e5,10);
vinitial1 = linspace(25000,29800,5);
vinitial2 = linspace(29800,29800+4800,5);
vinitial = [vinitial1,vinitial2];
%iterates the k and vinitial values over a for loop
time2break=zeros(length(ratio),length(vinitial));
for i=1:length(ratio)
    for j=1:length(vinitial)
        time2break(i,j)=RingworldOtherSweep(ratio(i),vinitial(j));
    end
end
time2break=time2break
pcolor(ratio,vinitial,time2break) %pcolor graph
xlabel('mass ratio','FontSize',15)
ylabel('Initial Velocity (m/s)','FontSize',15)
title('Life of Ringworld','FontSize',15)
c = colorbar();
ylabel(c,'Time before breaking (seconds)','FontSize',12);
minmax=[0.001, 1000, 50, 500000];
%axis(minmax)
end

