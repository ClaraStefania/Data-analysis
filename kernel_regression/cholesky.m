function [L] = cholesky (A)
    [n n] = size(A);
    L = zeros(n,n);

    % calculam elementele matricei folosind formulele
    for j = 1:n
        L(j, j) = sqrt(A(j, j) - L(j, 1:j-1) * L(j, 1:j-1)');
        L(j+1:n, j) = (A(j, j+1:n) - L(j, 1:j-1) * L(j+1:n, 1:j-1)') / L(j, j);
    endfor
endfunction