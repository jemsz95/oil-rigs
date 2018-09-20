function res = neighbor(set)
    i = randi(size(set,1));
    res = set;
    res(i) = ~res(i);
end