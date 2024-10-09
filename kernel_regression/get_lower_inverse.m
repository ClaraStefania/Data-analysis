function [P] = get_lower_inverse (L)
	n = size(L, 1);
    P = eye(n); % initializam cu matricea identitate
    
    for j = 1:n
        for i = j+1:n
            div = L(i, j) / L(j, j);
            % calculm elementele de pe liniile matricei
            P(i, :) = P(i, :) - div * P(j, :);
        endfor
    endfor
    
    % impartim fiecare element cu elementul corespunzator de pe diagonala
    % matricei L
    for i = 1:n
        P(i, :) = P(i, :) / L(i, i);
    endfor
endfunction
