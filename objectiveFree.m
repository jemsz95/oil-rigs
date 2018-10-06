function cost = objectiveFree(set, a, wells)
    cost = 0;
    used = zeros(size(wells, 1), 1);
    
    for platform = set
        x = platform(1);
        y = platform(2);
        k = platform(3);
        
        d = 0.5 + (0.05 * x)^2 + 0.1 * y;
        c = 12.1497 * k^0.677;
        
        [h, i] = sort(sqrt(sum((wells - [x y]).^2,2)));
        
        used(i(1:k)) = true;
        
        cost = cost + c + sum(a * (h(1:k) + d).^2);
    end
    
    if(any(~used))
        cost = Inf;
    end
end

