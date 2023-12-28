function A = createPolyMatrix(X, order)
    % Get the number of rows and columns in X
    [numRows, numCols] = size(X);
    
    % Initialize A with a column of ones
    A = ones(numRows, 1);

    % Function to recursively add terms of a specific order
    function addTerms(currentOrder, startIndex, currentProduct)
        if currentOrder == 0
            A = [A, currentProduct];
            return;
        end

        for i = startIndex:numCols
            addTerms(currentOrder - 1, i, currentProduct .* X(:, i));
        end
    end

    % Iterate over orders from 1 to the specified order
    for currentOrder = 1:order
        addTerms(currentOrder, 1, ones(numRows, 1));
    end
end

