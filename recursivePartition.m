function K = recursivePartition(n, parts, index, current, K)
    if index == parts
        current(index) = n;
        K = [K; current];
    else
        for i = n:-1:0
            newCurrent = current;
            newCurrent(index) = i;
            K = recursivePartition(n-i, parts, index+1, newCurrent, K);
        end
    end
end
