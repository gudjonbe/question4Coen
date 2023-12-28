
function K = generateK(n, d)
    
    % Generate all combinations of non-negative integers that sum to n
    % and have exactly d+1 parts.
    K = [];
    partition = zeros(1, d);
    K = recursivePartition(n, d, 1, partition, K);
end
