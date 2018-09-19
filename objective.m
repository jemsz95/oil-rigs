function cost = objective(rigs, wells, a, d)
    cost = 0;
    for r = rigs
        poly = wells(r == 1,:);
        centroid = sum(poly, 1) / size(poly,1);
        h = sum(sqrt(sum((poly - centroid).^2,2)));
        cost = cost + a * (d+h)^2; 
    end
end

