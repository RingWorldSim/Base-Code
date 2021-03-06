function asteroidSim(mAsteroid)
%animates and calculates the path of an asteroid
close all
%constants
mAsteroid=1.8986e27;
rAsteroid=7.785e10;
vAsteroid=(2*pi*rAsteroid)/(3.74265e8);
mSun=2.0e30;
G=6.67384e-11;

%initial conditions
PJupiter=[rAsteroid,0];
PSun=[0,0];
vAsteroid=[0,vAsteroid];
vSun=[0,0];

%create vector of positions and velocities
X=[PJupiter,PSun,vAsteroid,vSun];

TimeF=4332*24*60*60; %period in seconds
options = odeset('RelTol', 1e-7);
[T,Y]=ode45(@acceleration,[0,TimeF],X,options);

figure()
hold on
plot(Y(:,1),Y(:,2),'b')
plot(Y(:,3),Y(:,4),'ro')

animate(T,Y)
    function res=acceleration(t,X)
    P1=X(1:2);
    P2=X(3:4);
    V1=X(5:6);
    V2=X(7:8);

    F12=gravity_force_func(P1,mAsteroid,P2,mSun);
    aJupiter=F12/mAsteroid;
    aSun=-F12/mSun;
    res=[V1;V2;aJupiter;aSun];

    end

    function animate(T,M)
        X1=M(:,1);
        Y1=M(:,2);
        X2=M(:,3);
        Y2=M(:,4);
        
        minmax=[min([X1;X2]),max([X1;X2]),min([Y1;Y2]),max([Y1;Y2])];
        %minmax=[-10e7,10e7,-10e7,10e7];
        time=0.002/(24*60*60);
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
