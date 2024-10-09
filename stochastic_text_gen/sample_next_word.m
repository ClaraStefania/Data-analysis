function probs = sample_next_word(text, words_idx, k_secv_idx, k, stoch)
    n = length(text);
    
	% extragem ultima secventa si indexul corespunzator
    last_seq = strjoin(text(n-k+1:n));
    idx = k_secv_idx(last_seq);

	% probs devine linia din matrice corespunzatoare indexului
    probs = stoch(idx, :);
endfunction
