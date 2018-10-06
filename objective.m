function cost = objective(set, rigs, wells, a, d, rigsCost)
    cost = 0;
    used = zeros(size(wells, 1), 1);
    
    for r = rigs(:,set)
        used = used | r;
        poly = wells(r,:);
        centroid = sum(poly, 1) / size(poly,1);
        nWells = sum(r);
        h = sqrt(sum((poly - centroid).^2,2));
        cost = cost + rigsCost(bound(nWells,1,10)) + sum(a * (h + d).^2); 
    end
        
    if(any(~used))
        cost = Inf;
    end
end

