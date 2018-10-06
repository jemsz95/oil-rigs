function res = neighborFree(set)
    n = size(set,2);
    resize = bound(n + randi(3,1) - 2, 1, 20);
    
    i = randi(n, 1);
    res = zeros(3, resize);
    
    if resize > n
        res(:,1:n) = set;
        res(:,n + 1) = set(:,i);
    elseif resize == n
        res = set;
        dxy = (rand(2,1) - 0.5) * 10;
        dk = randi(3,1) - 2;
        res(1:2,i) = bound(set(1:2,i) + dxy, 0, 10);
        res(3,i) = bound(set(3,i) + dk, 1, 20);
    else
        except = true(1,n);
        except(i) = false;
        res = set(:,except);
    end
end

