function retval = word_idx (distinct_wds)
    n = length(distinct_wds);
	% asociem fiecarui cuvant un indice
    retval = containers.Map(distinct_wds, 1:n);
endfunction
