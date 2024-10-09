function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)
    false_pozitives = 0;
    false_negatives = 0;
    true_pozitives = 0;

    n = length(predictions);

    for i = 1:n
        % daca predictia si adevarul sunt 1, incrementam true_pozitives
        if predictions(i) && truths(i)
            true_pozitives++;
        endif

        % daca predictia e 1 si adevarul e 0, incrementam false_pozitives
        if predictions(i) && ~truths(i)
            false_pozitives++;
        endif

        % daca predictia e 0 si adevarul e 1, incrementam false_negatives
        if ~predictions(i) && truths(i)
            false_negatives++;
        endif
    endfor
endfunction