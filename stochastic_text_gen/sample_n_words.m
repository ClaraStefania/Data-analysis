function retval = sample_n_words(text, widx, kscvidx, k, stoch, word_set, n)
	retval = text;

    for i = 1:n
		% pentru fiecare iteratie aflam probabilitatile
        probs = sample_next_word(retval, widx, kscvidx, k, stoch);

		% alegem urmatorul cuvant si il adaugam la final
        next_word = prob_choose(probs, word_set);
        retval{length(retval) + 1} = next_word;
    endfor
endfunction