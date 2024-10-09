% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
    [m, n] = size(X);
    mean_values = zeros(1,n);
    variances = zeros(n, n);

   % calculam vectorul de medii
    for i = 1:n
        mean_values(1, i) = sum(X(:, i));
    endfor
    mean_values = mean_values ./ m;

    % construim matricea de varianta aplicand formula
    for i = 1:n
        for j = 1:n
            variances(i, j) = sum((X(:, i) - mean_values(i))' *
                                  (X(:, j) - mean_values(j))) / m;
        endfor
    endfor
endfunction
