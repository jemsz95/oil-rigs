function res = bound(n,low, high)
%BOUND bounds n to lower and upper limits
%   Returns n if low <= n <= high
%   Returns low if n < low
%   Returns high high if n > high
    res = n;
    res(res < low) = low;
    res(res > high) = high;
end

