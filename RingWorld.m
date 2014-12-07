function RingWorld()
%Animates Ringworld
%   takes acceleration of individula ringworld mass, it's initial velocity,
%   and animates the motion of the ringworld

%constants

G=6.67384e-11;
m_number=4;
%initial conditions
positions = create_positions(4, 3.671*10^6)'; %Position Vectors for All Ring World Masses
velocities = test_create_velocities()';
positions=reshape(positions,[1,m_number*2]);
velocities=reshape(velocities,[1,m_number*2]);
Pstar=[0,0];      %Position Vector for Star;
vStar=[0,0];  %Star begines at rest

%create vector of positions and velocities
X=[positions,Pstar,velocities,vStar];

TimeF=4332*24*60*60; %period in seconds (subject to change)
options = odeset('RelTol', 1e-7);
[T,Y]=ode45(@acceleration,[0,1000],X,options); %takes a long time to run if
% time is set to higher than 1000 seconds

%figure()
hold on
%plot(Y(:,1),Y(:,2),'b')
%plot(Y(:,3),Y(:,4),'ro')

%animate(T,Y)
    function res=acceleration(t,X)
     %m_number=4
    positions=X(1:8);
    Pstar=X(9:10);
    velocities=X(11:18);
    vStar=X(19:20);
    accelerations = test_find_acceleration(positions,m_number);
    res=[velocities;vStar;accelerations;[0;0]]; %for now, star's acceleration is assumed
    % to be zero 

    end

    function animate(T,M)
        X1=M(:,1);
        Y1=M(:,2);
        X2=M(:,3);
        Y2=M(:,4);
        
        minmax=[min([X1;X2]),max([X1;X2]),min([Y1;Y2]),max([Y1;Y2])];
        %minmax=[-10e7,10e7,-10e7,10e7];
        time=0.5/(24*60*60);
        for i=1:length(T)-1
            clf;
            axis(minmax);
            hold on;
            draw_func(X1(i),Y1(i),X2(i),Y2(i));
            drawnow;
            step=T(i+1)-T(i);
            pause(step*time*0.33);
        end
    end
    function draw_func(x1,y1,x2,y2)
        plot(x1,y1,'r.','MarkerSize',50);
        plot(x2,y2,'b.','MarkerSize',20);
    end
end