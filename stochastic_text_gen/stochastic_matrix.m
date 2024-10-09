function M = stochastic_matrix(k_secv_corpus, corpus_words, word_set, k_secv_set, k)
    nr_seq_set = length(k_secv_set);
    nr_words_set = length(word_set);
    nr_words = length(corpus_words);

    M = sparse(nr_seq_set, nr_words_set);

    for i = 1:(nr_words - k)
        % luam secventa de la indicele i
        k_seq = k_secv_corpus{i};
        % luam cuvantul de dupa secventa
        word = corpus_words{i + k};

        % cautam indicii celor 2 cuvinte si incrementam elementul din matrice
        % aflat la indicii respectivi
        k_seq_idx = find(strcmp(k_secv_set, k_seq), 1);
        word_idx = find(strcmp(word_set, word), 1);
        M(k_seq_idx, word_idx)++;      
    endfor
endfunction