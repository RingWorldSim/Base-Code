function sweep2paramsKV2()
%sweeps the k and initial velocity of ringworld
%   calls Ringworld2params and generates pcolor graph

% determines values of the two paramters to sweep, in this case k and
% vinitial

k = linspace(0,100,20);
vinitial1 = linspace(20000,29800,10);
vinitial2 = linspace(29800,29800+9800,10);
vinitial = [vinitial1,vinitial2];
%vinitial = linspace(0,40000,15);
%iterates the k and vinitial values over a for loop
time2break=zeros(length(k),length(vinitial));
for i=1:length(k)
    for j=1:length(vinitial)
        time2break(j,i)=Ringworld2params2(k(i),vinitial(j));
    end
end
time2break=time2break/(60*60);
pcolor(k, vinitial, time2break) %pcolor graph
xlabel('k value (N/m)')
ylabel('initial velocity (m/s)')
title('Life of Ringworld')
c = colorbar();
ylabel(c,'Time before breaking (hours)','FontSize',12);
minmax=[0.001, 1000, 50, 500000];
%axis(minmax)
end
