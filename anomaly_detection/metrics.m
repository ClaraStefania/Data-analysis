function [precision recall F1] = metrics(true_pozitives, false_pozitives, false_negatives)
    % calculam procentajul outlierilor adevarati si determinati din outlierii
    % determinati pentru epsilon
    precision = true_pozitives / (true_pozitives + false_pozitives);

    % calculam procentajul outlierilor adevarati si determinati din totalul
    % outlierilor reali
    recall = true_pozitives / (true_pozitives + false_negatives);

    % calculam parametrul
    F1 = (2 * precision * recall) / (precision + recall);
endfunction