function Force = massForce( M0,M1,M2,MStar,P0,P1,P2,...
    PStar,k1,k2 )
%massForce Calculates forces on single ringworld mass
%   Forces include spring forces and gravitational forces
G=6.67e-11;
Fspring1=k1*(P1-P0);
Fspring2=k2*(P0-P2);
FGrav10=G*M0*M1*(P1-P0)./(norm(P1-P0)).^3;
FGrav20=G*M0*M2*(P0-P2)./(norm(P2-P0)).^3;
FGravStar0=G*M0*MStar*(P0-PStar)./(norm(PStar-P0)).^3;
Force=Fspring1+Fspring2+FGrav10+FGrav20+FGravStar0;
end

