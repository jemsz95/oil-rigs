function res = neighbor(set)
    i = randi(size(set,2));
    res = set;
    res(i) = ~res(i);
end