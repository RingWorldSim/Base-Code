function velocities = getVelocities(positions, v)
%calculates initial velocity vectors of each ringworld mass given position and desired total
%velocity
  
%positions=positions';
%positions=positions';

%preallocation
velocities=zeros(size(positions));
mags=zeros(max(size(positions)),1);

%find magnitude of each position vector, called mags
for i=1:max(size(positions))
    mags(i)=norm(positions(:,i));
end

%normalize each position vector
for i=1:length(mags)
    velocities(:,i)=positions(:,i)/mags(i);
end

%flips the position vector and mutliplies it by the scalar v to get the
%velocity vectors
velocities=v*flip(velocities);
end
