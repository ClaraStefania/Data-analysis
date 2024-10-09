% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    n = length(probabilities);
    predictions = zeros(1, n);

    % calculam minimul si maximul din vectorul de probabilitati
    minim = probabilities(1);
    maxim = probabilities(1);
    for i = 2:n
        if probabilities(i) < minim
            minim = probabilities(i);
        endif

        if probabilities(i) > maxim
            maxim = probabilities(i);
        endif
    endfor

    % calculam pasul
    step = (maxim - minim) / 1000;

    for epsilon = minim:step:maxim
        for i = 1:n
            if probabilities(i) < epsilon
                predictions(i) = 1;
            else
                predictions(i) = 0;
            endif
        endfor

        [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths);
        [precision recall F1] = metrics(true_pozitives, false_pozitives, false_negatives);

        % daca parametrul este mai mare, se actualizeaza valorile
        if F1 > best_F1
            best_epsilon = epsilon;
            best_F1 = F1;
            associated_precision = precision;
            associated_recall = recall;
        endif
    endfor
endfunction
