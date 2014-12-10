function Force = massForce2( M0,M1,M2,MStar,P0,P1,P2,...
    PStar,k,l0)
%massForce Calculates forces on single ringworld mass
%   Forces include spring forces and gravitational forces
G=6.67e-11;
% Forces connecting points act like springs with rest length 0
% Spring Force is a restoring force and opposes gravity, and is
% therefore positive

Fspring1=-k*(P0-P1).*(norm(P0-P1)-l0)./norm(P0-P1); %l0 is free length of spring
Fspring2=-k*(P0-P2).*(norm(P0-P2)-l0)./norm(P0-P2);
%Gravity calculated based on the two nearest masses and the star,
%not every ringworld mass
%Gravity is pointed in the negative direction in this coordinate system

%The force is calculated by subtracting the postiions of the objects that
%act on the mass from the position of the single ringworld mass

FGrav10=-G*M0*M1*(P0-P1)./(norm(P0-P1)).^3;
FGrav20=-G*M0*M2*(P0-P2)./(norm(P0-P1)).^3;
FGravStar0=-G*M0*MStar*(P0-PStar)./(norm(PStar-P0)).^3;

%Returns the force as a vector
Force=Fspring1+Fspring2+FGrav10+FGrav20+FGravStar0;
end
