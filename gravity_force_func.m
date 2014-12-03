function [ F12] = gravity_force_func( P1,m1,P2,m2 )
%calculates force of gravity between two objects in space
R=P2-P1;
r=norm(R);
G=6.67e-11;
x1=P1(1);
y1=P1(2);
x2=P2(1);
y2=P2(2);
r1=R(1);
r2=R(2);
F12x=((G*m1*m2)/r^2)*(r1/sqrt(r1^2+r2^2));
F12y=((G*m1*m2)/r^2)*(r2/sqrt(r1^2+r2^2));
F21x=((G*m1*m2)/r^2)*(r1/sqrt(r1^2+r2^2));
F21y=((G*m1*m2)/r^2)*(r2/sqrt(r1^2+r2^2));
F12=[F12x;F12y];
F21=-1*[F21x;F12y];
% disp(F12)
% disp(F21)
end

