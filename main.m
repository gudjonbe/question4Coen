close all
syms x1 x2 x3

% Define the range for x and y
x = linspace(0, 1, 101);
y = linspace(0, 1, 101);

% Create a meshgrid for the x and y values
[X, Y] = ndgrid(x, y);

% Calculate b3 for each point in the grid
B3 = 1 - X - Y;

% Initialize a figure for the subplots and store its handle
hFig = figure;

% Set the position and size of the figure
desiredPosition = [2296, 1166, 1050, 1603]; % [Left, Bottom, Width, Height]
set(hFig, 'Position', desiredPosition);

% Degree of the polynomial
n = 4;

% Number of variables
d = 3;

% Generate the K matrix for the desired degree
K = generateK(n, d); 

% Plot each Bernstein basis polynomial
for i = 1:size(K, 1)
    % Extract the exponents for the i-th basis polynomial
    exponents = K(i, :);
    
    % Initialize Z matrix for the current basis function
    Z = zeros(size(X));
    
    % Calculate the multinomial coefficient
    multinom_coeff = factorial(n) / (factorial(exponents(1))...
        * factorial(exponents(2)) * factorial(exponents(3)));
    
    % Evaluate the Bernstein basis polynomial at each point in the grid
    for j = 1:numel(X)
        b = [Y(j), X(j), B3(j)];
        if B3(j) >= 0 % Ensure the point is inside the simplex
            Z(j) = multinom_coeff * evaluatePolynomial(K(i, :), b);

        else
            Z(j) = NaN; % Assign NaN outside the simplex
        end
        if j == 1
            disp(evaluatePolynomial(K(i, :), [x1 x2 x3]))
            
        end

    end

    % Plot the current basis function
    subplot(5, 3, i); % Adjust subplot dimensions as needed
    surf(X, Y, Z, 'EdgeColor', 'none');
    title(sprintf('B^{%d}_{%d%d%d}(b)',n, exponents));
    xlabel('x');
    ylabel('y');
    zlabel('Value');
    axis tight;
    set(gca, 'XDir', 'reverse');
    view(45, 45);
end

