function res = radius_difference(positions)
%The positions matrix is the same one as usual: it defines all of the
%points in the ring. this function returns the variation in orbital radii
%of the points on the ring.

    radii = []; %a vector containing all of the distances from the sun
    for i = 1:length(positions)
        radii(i) = norm(positions(:,i));
    end
    
    res = max(radii(i)) - min(radii(i));

end