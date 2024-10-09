function probability = gaussian_distribution(X, mean_value, variance)
    det_variance = det(variance);

    % stabilim dimensiunile
    [m, n] = size(X);
    probability = zeros(m, 1);
    A = inv(variance);

    % calculam densitatea de probabilitate pentru datasetul dat
    for i = 1:m
        diff = X(i, :) - mean_value;
        % calculam exponentul corespunzator fiecarui dataset
        exponent = (-0.5) * diff * A * diff'; 
        probability(i) = (1 / ((2 * pi) ^ (n / 2) * sqrt(det_variance))) * exp(exponent);
    endfor   
endfunction